declare -Ar MARKERS=(
    ["overview_opening"]="<!-- OVERVIEW:OPENING -->"
    ["overview_closing"]="<!-- OVERVIEW:CLOSING -->"
    ["snippets_opening"]="<!-- SNIPPETS:OPENING -->"
    ["snippets_closing"]="<!-- SNIPPETS:CLOSING -->"
)

find_snippet_files() {
    local path_snippets="${1:-}"

    [[ -z "$path_snippets" ]] && error_missing_argument "path_snippets"

    local snippet_files=()

    mapfile -t snippet_files < <(
        find "$path_snippets" -maxdepth 1 -type f -name "*.json" | LC_ALL=C sort
    )

    if [[ ${#snippet_files[@]} -eq 0 ]]; then
        throw_error \
            "No snippet JSON files found: $path_snippets" \
            "Provide JSON files under the snippets directory."
    fi

    printf "%s\n" "${snippet_files[@]}"
}

generate_snippets_overview() {
    local path_snippets="${1:-}"
    local path_content="${2:-}"

    [[ -z "$path_snippets" ]] && error_missing_argument "path_snippets"
    [[ -z "$path_content" ]] && error_missing_argument "path_content"

    local snippet_files=()
    mapfile -t snippet_files < <(find_snippet_files "$path_snippets")

    for file in "${snippet_files[@]}"; do
        [[ -f "$file" ]] || continue

        local filename
        filename="$(basename "$file" .json)"

        printf "\n### %s\n\n" "${filename^}" >> "$path_content"
        printf "%s\n" \
            "| Prefix | Description |" \
            "|--------|-------------|" \
            >> "$path_content"

        jq -r '
            def escape_md_table:
                gsub("\\|"; "\\|");

            to_entries[]
            | .value as $snippet
            | "| `\($snippet.prefix)` | \($snippet.description | escape_md_table) |"
        ' "$file" >> "$path_content"
    done
}

generate_snippets_details() {
    local path_snippets="${1:-}"
    local path_content="${2:-}"

    [[ -z "$path_snippets" ]] && error_missing_argument "path_snippets"
    [[ -z "$path_content" ]] && error_missing_argument "path_content"

    local snippet_files=()
    mapfile -t snippet_files < <(find_snippet_files "$path_snippets")

    for file in "${snippet_files[@]}"; do
        [[ -f "$file" ]] || continue

        echo "Processing File: $file" >&2

        local filename="$(basename "$file" .json)"

        local snippets 
        snippets="$(jq -r --arg fence "txt" '
            def md_block($name; $prefix; $body; $desc):
                "**Prefix:** `\($prefix)`  \n" +
                "**Description:** " + $desc + "  \n" +
                "**Output:**\n\n```" + $fence + "\n" +
                ($body | join("\n")) + "\n```\n" +
                "\n---\n";

            to_entries[]
            | .key as $name
            | .value as $v
            | md_block($name; $v.prefix; $v.body; $v.description)
        ' "$file")"

        printf "\n### %s\n\n---\n\n%s\n" "${filename^}" "$snippets" >> "$path_content"
    done
}

inject_readme_section() {
    local marker_opening="${1:-}"
    local marker_closing="${2:-}"
    local path_content="${3:-}"
    local path_readme="${4:-}"

    [[ -z "$marker_opening" ]] && error_missing_argument "marker_opening"
    [[ -z "$marker_closing" ]] && error_missing_argument "marker_closing"
    [[ -z "$path_content" ]] && error_missing_argument "path_content"
    [[ -z "$path_readme" ]] && error_missing_argument "path_readme"

    local path_temp
    path_temp="$(mktemp)" || throw_error \
        "Could not create README temp file."

    awk \
        -v delimiter_begin="$marker_opening" \
        -v delimiter_end="$marker_closing" \
        -v file_content="$path_content" '
        function dump(file, line) {
            while ((getline line < file) > 0) print line
            close(file)
        }

        $0 == delimiter_begin {
            print
            dump(file_content)
            skipping = 1
            next
        }

        $0 == delimiter_end {
            skipping = 0
        }

        !skipping
    ' "$path_readme" > "$path_temp" && mv "$path_temp" "$path_readme"
}

update_snippets_overview() {
    local path_snippets="${1:-}"
    local path_readme="${2:-}"

    [[ -z "$path_snippets" ]] && error_missing_argument "path_snippets"
    [[ -z "$path_readme" ]] && error_missing_argument "path_readme"

    local marker_opening="${MARKERS[overview_opening]}"
    local marker_closing="${MARKERS[overview_closing]}"

    if ! grep -Fq "$marker_opening" "$path_readme"; then
        error_missing_marker "$marker_opening"
    fi

    if ! grep -Fq "$marker_closing" "$path_readme"; then
        error_missing_marker "$marker_closing"
    fi

    local path_content
    path_content="$(mktemp)" || throw_error \
        "Could not create snippets overview temp file."

    generate_snippets_overview "$path_snippets" "$path_content"

    inject_readme_section \
        "$marker_opening" \
        "$marker_closing" \
        "$path_content" \
        "$path_readme"

    rm -f "$path_content"
}

update_snippets_details() {
    local path_snippets="${1:-}"
    local path_readme="${2:-}"

    [[ -z "$path_snippets" ]] && error_missing_argument "path_snippets"
    [[ -z "$path_readme" ]] && error_missing_argument "path_readme"

    local marker_opening="${MARKERS[snippets_opening]}"
    local marker_closing="${MARKERS[snippets_closing]}"

    if ! grep -Fq "$marker_opening" "$path_readme"; then
        error_missing_marker "$marker_opening"
    fi

    if ! grep -Fq "$marker_closing" "$path_readme"; then
        error_missing_marker "$marker_closing"
    fi

    local path_content 
    path_content="$(mktemp)" || throw_error \
        "Could not create snippets details temp file."

    generate_snippets_details "$path_snippets" "$path_content"

    inject_readme_section \
        "$marker_opening" \
        "$marker_closing" \
        "$path_content" \
        "$path_readme"

    rm -f "$path_content"
}

update_readme() {
    # Ensure that jq is available for this script.
    if ! command -v jq >/dev/null; then
        throw_error \
            "jq is required for this script." \
            "install jq from https://jqlang.org/."
    fi

    local dir_lang="${1:-}"
    local dir_root="${2:-}"

    # Verify that the lang argument is provided
    if [[ -z "$dir_lang" ]]; then
        error_missing_argument \
            "dir_lang" \
            "Provide the language directory, e.g. cpp."
    fi

    # Verify that the root argument is provided
    if [[ -z "$dir_root" ]]; then
        error_missing_argument \
            "dir_root" \
            "Provide the root snippets directory, e.g. gtest."
    fi

    local path_source="snippets/${dir_lang}/${dir_root}"
    local path_snippets="${path_source}/snippets"
    local path_readme="${path_source}/README.md"

    # Verify that all paths exists
    [[ ! -d "$path_source" ]] && error_missing_path "$path_source"
    [[ ! -d "$path_snippets" ]] && error_missing_path "$path_snippets"
    [[ ! -f "$path_readme" ]] && error_missing_path "$path_readme"

    printf "\nUpdating README for %s/%s\n" "$dir_lang" "$dir_root"

    update_snippets_overview "$path_snippets" "$path_readme"
    update_snippets_details "$path_snippets" "$path_readme"

    if command -v code >/dev/null; then
        code --reuse-window "$path_readme" || true
    fi
}
