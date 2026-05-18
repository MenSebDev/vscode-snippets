#!/usr/bin/env bash

set -Eeuo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/errors.sh"
source "$SCRIPT_DIR/readme.sh"

help() {
  printf "\n"
  printf "%s\n" \
    "Usage: $0 --lang=<dir> --root=<dir>" \
    "Example: $0 --lang=cpp --root=gtest" \
    "Generates the \`gtest\` snippets for the \`cpp\` language." \
    "Updates the README.md file under the path /snippets/cpp/gtest."
}

# Read CLI arguments and update the README file
main() {
  local dir_lang=""
  local dir_root=""

  while [[ "$#" -gt 0 ]]; do
    case "$1" in
    --lang=*)
      dir_lang="${1#*=}"
      ;;
    --lang)
      if [[ "$#" -lt 2 ]]; then
        help >&2
        throw_error \
          "Missing value for --lang." \
          "Example: $0 --lang=cpp --root=gtest"
      fi

      dir_lang="${2:-}"
      shift
      ;;
    --root=*)
      dir_root="${1#*=}"
      ;;
    --root)
      if [[ "$#" -lt 2 ]]; then
        help >&2
        throw_error \
          "Missing value for --root." \
          "Example: $0 --lang=cpp --root=gtest"
      fi

      dir_root="${2:-}"
      shift
      ;;
    -h | --help)
      help
      exit 0
      ;;
    *)
      throw_error \
        "Unknown parameter: $1" \
        "Run with --help to see usage."
      ;;
    esac

    shift
  done

  if [[ -z "$dir_lang" || -z "$dir_root" ]]; then
    help >&2
    throw_error \
      "--lang and --root flags are required." \
      "Example: $0 --lang=cpp --root=gtest"
  fi

  update_readme "$dir_lang" "$dir_root"
}

main "$@"
