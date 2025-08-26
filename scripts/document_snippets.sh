#!/bin/bash

help() {
    printf "%s\n" \
        "Usage: $0 --lang=<dir> --root=<dir>" \
        "Example: $0 --lang=cpp --root=gtest" \
        "Generates the \`gtest\` snippets for the \`cpp\` language." \
        "Updates the README.md file under the path /snippets/cpp/gtest."
}

error_arguments() {
    {
        printf "%s\n" \
            "[ERROR]: --lang and --root flags are required."
        help
    } >&2
    exit 2
}

error_path() {
    {
        printf "%s\n" \
            "[ERROR]: Missing path: $1"
    } >&2
    exit 2
}

error_marker() {
    {
        printf "%s\n" \
            "[ERROR]: Missing marker: $1"
    } >&2
    exit 2
}

error_missing_snippets() {
    {
        printf "%s\n" \
            "[ERROR]: Missing \`$2\` snippets for \`$1\` language." \
            "[HINT]: Provide JSON files under path \`/snippets/$1/$2/snippets/\`."
    } >&2
    exit 2
}

error_temp_file() {
    {
        printf "%s\n" \
            "[ERROR]: Could not create \`$1\` temp file."
    } >&2
    exit 2
}

# Ensure that jq is available for this script.
if ! command -v jq >/dev/null; then
    {
        printf "%s\n" \
            "[ERROR]: jq is required for this script." \
            "[HINT]: install jq from https://jqlang.org/."
    } >&2
    exit 2
fi

# Parse arguments
# Possible flag formats:
#   --key value
#   --key "value"
#   --key=value
#   --key="value"

DIR_LANG=""
DIR_ROOT=""

while [[ "$#" -gt 0 ]]; do
    case $1 in
    --lang=*)
        DIR_LANG="${1#*=}"
        ;;
    --lang)
        DIR_LANG="$2"
        shift
        ;;
    --root=*)
        DIR_ROOT="${1#*=}"
        ;;
    --root)
        DIR_ROOT="$2"
        shift
        ;;
    -h | --help)
        help
        exit 0
        ;;
    *)
        echo "Unknown parameter: $1" >&2
        help
        exit 2
        ;;
    esac
    shift
done

# Catch undefined arguments lang or root
if [[ -z "$DIR_LANG" || -z "$DIR_ROOT" ]]; then error_arguments; fi

# Directories and files
SOURCE_DIR="snippets/${DIR_LANG}/${DIR_ROOT}"
SNIPPETS_DIR="${SOURCE_DIR}/snippets"
README_FILE="${SOURCE_DIR}/README.md"

if [[ ! -d "$SOURCE_DIR" ]]; then error_path "$SOURCE_DIR"; fi
if [[ ! -d "$SNIPPETS_DIR" ]]; then error_path "$SNIPPETS_DIR"; fi
if [[ ! -f "$README_FILE" ]]; then error_path "$README_FILE"; fi

# Delimiters
DELIMITER_BEGIN="<!-- SNIPPETS:BEGIN -->"
DELIMITER_END="<!-- SNIPPETS:END -->"

# Verify markers exist
if ! grep -Fq "$DELIMITER_BEGIN" "$README_FILE"; then error_marker "$DELIMITER_BEGIN"; fi
if ! grep -Fq "$DELIMITER_END" "$README_FILE"; then error_marker "$DELIMITER_END"; fi

# enable nullglob, unmatched globs expand to nothing instead of a literal *.json
SNIPPET_FILES=($(
    shopt -s nullglob
    printf "%s\n" "$SNIPPETS_DIR"/*.json
))

if [[ ${#SNIPPET_FILES[@]} -eq 0 ]]; then error_missing_snippets "$DIR_LANG" "$DIR_ROOT"; fi

# Deterministic ASCII order -> array, IFS only for this read
mapfile -t SNIPPET_FILES < <(LC_ALL=C printf "%s\n" "${SNIPPET_FILES[@]}" | sort)

# Start documenting snippets
printf "%s\n" \
    "Documenting \`${DIR_ROOT}\` snippets for \`${DIR_LANG}\` language."

# Temporary files
TEMP_SNIPPETS=$(mktemp) || error_temp_file "snippets"
TEMP_README=$(mktemp) || error_temp_file "readme"

# Automatically clean up temp files on exit
cleanup() {
    [[ -f "$TEMP_SNIPPETS" ]] && rm -f "$TEMP_SNIPPETS"
    [[ -f "$TEMP_README" ]] && rm -f "$TEMP_README"
}
trap cleanup EXIT INT TERM

# Build the snippets content with JSON files from /snippets folder.

for file in "${SNIPPET_FILES[@]}"; do
    # only process JSON files
    [[ -f "$file" ]] || continue

    echo "Processing File: $file" >&2

    filename=$(basename "$file" .json)

    snippets=$(jq -r --arg fence "sh" '
        def md_block($name; $prefix; $body; $desc):
            "**Prefix:** `\($prefix)`\n\n" +
            "**Output:**\n\n```" + $fence + "\n" +
            ($body | join("\n")) + "\n```\n\n" +
            "**Description:** " + $desc + "\n" +
            "\n---\n";

        to_entries[]
        | .key as $name
        | .value as $v
        | md_block($name; $v.prefix; $v.body; $v.description)
    ' "$file")

    printf "\n### %s\n\n---\n\n%s\n" "${filename^}" "$snippets"
done >"$TEMP_SNIPPETS"

# Update the README.md file with the snippets content.

awk \
    -v delimiter_begin="$DELIMITER_BEGIN" \
    -v delimiter_end="$DELIMITER_END" \
    -v file_snippets="$TEMP_SNIPPETS" '
    # Dump content from file
    function dump(file, line) {
        while ((getline line < file) > 0) print line
        close(file)
    }

    # Found the begin delimiter => print and skip
    $0 == delimiter_begin {
        print
        dump(file_snippets)
        skipping = 1
        next
    }

    # Found the end delimiter => print and reset
    $0 == delimiter_end {
        skipping = 0
    }

    # Outside the delimiters => print normally
    !skipping
' "$README_FILE" >"$TEMP_README" && mv "$TEMP_README" "$README_FILE"

# If the script is called from within VS Code, focus the updated README file.
# Then, the user may save the file to trigger the table of contents update.
if command -v code >/dev/null; then
    code --reuse-window "$README_FILE" || true
fi
