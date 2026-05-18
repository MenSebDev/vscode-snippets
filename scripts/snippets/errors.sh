# Find from where an error was called.
# Example call stack :
#   1. main
#   2. my_function
#   3. error_custom
#   4. throw_error
#   5. find_error_caller
# It would find "my_function".
# The return format: "<caller>:<file>:<line>"
find_error_caller() {
  local caller
  local source="${1:-}"
  local depth=${#FUNCNAME[@]}

  for ((i = 1; i < depth; i++)); do
    caller="${FUNCNAME[$i]}"

    # Skip the "throw_error" method
    [[ "$caller" == "throw_error" ]] && continue

    # Skip custom "error_" methods, otherwise exit
    if [[ ! "$caller" =~ ^error_ || "$caller" == "$source" ]]; then
      local file="${BASH_SOURCE[$i]##*/}"
      local line="${BASH_LINENO[$((i - 1))]:-?}"
      printf "%s:%s:%s\n" "$caller" "$file" "$line"
      return 0
    fi
  done

  printf "main:%s\n" "${BASH_SOURCE[$((${#BASH_SOURCE[@]} - 1))]##*/}"
  return 0
}

# Print an error message with details.
# [ERROR] Missing argument name.
# [SOURCE] error_missing_argument:utilities.sh:57
# [HINT] Provide the name of the missing argument.
error_message() {
  local error="$1"
  local hint="${2:-}"
  local source="$(find_error_caller "${3:-}")"

  {
    printf "\n"

    # Print error
    printf "[ERROR] %s\n" "$error"

    # Print source
    printf "[SOURCE] %s\n" "$source"

    # Print hint (optionnal)
    [[ -n "$hint" ]] && printf "[HINT] %s\n" "$hint"

    printf "\n"
  } >&2
}

# Throw an error with a custom message.
throw_error() {
  local error="$1"
  local hint="${2:-}"
  local source="${3:-}"
  local code="${4:-2}"

  error_message "$error" "$hint" "$source"

  exit "$code"
}

# Throw an error for a missing argument in a function call.
error_missing_argument() {
  local name="${1:-}"

  [[ -z "$name" ]] && {
    throw_error \
      "Missing argument name." \
      "Provide the name of the missing argument." \
      "error_missing_argument"
  }

  throw_error "Missing argument: $name." "${2:-}" "${3:-}"
}

# Throw an error for a missing path in a function call.
error_missing_path() {
  local path="${1:-}"

  [[ -z "$path" ]] && error_missing_argument \
    "path" \
    "Provide the missing path."

  throw_error \
    "Missing path: $path" \
    "Make sure the file or directory exists."
}

# Throw an error for a missing marker in the readme file.
error_missing_marker() {
  local marker="${1:-}"

  [[ -z "$marker" ]] && error_missing_argument \
    "marker" \
    "Provide the README marker that should be verified."

  throw_error \
    "Missing marker: $marker" \
    "The README file must include the marker."
}
