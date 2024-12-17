#!/bin/bash

declare -r COLOR_RED="1"
declare -r COLOR_GREEN="2"
declare -r COLOR_YELLOW="3"
declare -r COLOR_BLUE="4"
declare -r COLOR_MAGENTA="5"
declare -r COLOR_CYAN="6"
declare -r COLOR_WHITE="7"

print_color() {
  # Using `tput` change forground color, print, reset display.
  printf "%b" \
    "$(tput setaf "$2" 2>/dev/null)" \
    "$1" \
    "$(tput sgr0 2>/dev/null)"
}

print_red() {
  print_color "$1" "$COLOR_RED"
}

print_green() {
  print_color "$1" "$COLOR_GREEN"
}

print_yellow() {
  print_color "$1" "$COLOR_YELLOW"
}

print_blue() {
  print_color "$1" "$COLOR_BLUE"
}

print_magenta() {
  print_color "$1" "$COLOR_MAGENTA"
}

print_cyan() {
  print_color "$1" "$COLOR_CYAN"
}

print_white() {
  print_color "$1" "$COLOR_WHITE"
}

print_okay() {
  print_green "     [✔] $1\n"
}

print_warn() {
  print_magenta "     [!] $1\n"
}

print_fail() {
  local message=$(printf "$1" "$2")
  print_red "     [✖] $message\n"
}

print_fail_stream() {
  while read -r line; do
    print_fail "↳ ERROR: $line"
  done
}

print_talk() {
  print_cyan "\n(ツ) $1\n\n"
}

print_title() {
  print_blue "     $1\n"
}

print_ask() {
  print_yellow "     [?] $1"
}

print_result() {
  if [ "$1" -eq 0 ]; then
    print_okay "$2"
  else
    print_fail "$2"
  fi
  return "$1"
}


is_macos() {
  local kernel_name=""
  kernel_name="$(uname -s)"
  [[ "$kernel_name" == "Darwin" ]] || return 1
}

is_ubuntu() {
  local kernel_name=""
  kernel_name="$(uname -s)"
  [[ "$kernel_name" == "Linux" ]] && [[ -e "/etc/lsb-release" ]] || return 1
}

get_os() {
  local os=""

  if is_macos; then
    os="macos"
  elif is_ubuntu; then
    os="ubuntu"
  else
    os="$kernel_name"
  fi

  print_yellow "$os"
} 

get_os_version() {
  local version=""

  if is_macos; then
    version="$(sw_vers -productVersion)"
  elif is_ubuntu; then
    version="$(lsb_release -d | cut -f2 | cut -d' ' -f2)"
  fi

  print_yellow "$version"
}
