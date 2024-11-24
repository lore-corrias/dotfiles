#!/bin/bash

writeup_dir="$HOME/Personal/Notes/archive/CTF"
ctf_base_dir="$HOME/Personal/pwnatine"

# Define your functions here
create_new_ctf() {
  ctf_name=$(rofi -dmenu -p "Enter the name of the CTF: ")
  mkdir "$ctf_base_dir/$ctf_name"
  main_menu "Created CTF $ctf_name"
  # Add your custom command or script here
}

add_challenge() {
  selected_ctf=$(select_ctf)
  if [ -z "$selected_ctf" ]; then
    exit 0
  fi
  # resize the rofi window so that the user sees only what he writes
  challenges_names=$(rofi -dmenu -p "Name of the challenge(s) (by \",\"):")
  if [ -z "$challenges_names" ]; then
    exit 0
  fi

  IFS=',' read -ra challenges_array <<<"$challenges_names"
  for challenge in "${challenges_array[@]}"; do
    if [ -z "$challenge" ]; then
      continue
    fi

    challenge_files=$(zenity --file-selection --multiple --title "Select all challenge files")
    # Convert the string of file paths into an array
    IFS='|' read -ra challenge_file_array <<<"$challenge_files"

    mkdir -p "$ctf_base_dir/$selected_ctf/$challenge" && mkdir -p "$writeup_dir/$selected_ctf/$challenge"
    # Iterate over each file path
    for challenge_file in "${challenge_file_array[@]}"; do
      if [ -f "$challenge_file" ]; then
        cp "$challenge_file" "$ctf_base_dir/$selected_ctf/$challenge"
      fi
    done
    alacritty -e tmux new-window -n "ctf-$challenge" -c "$ctf_base_dir/$selected_ctf/$challenge"
  done
}

select_ctf() {
  # get list of CTFs inside the directory and parse them
  # with ",", use find, exclude hidden directories
  ctf_list=$(find "$ctf_base_dir" -mindepth 1 -maxdepth 1 -type d -not -path '*/\.*' -exec basename {} \;)
  echo "$ctf_list" | rofi -dmenu -p "Select a CTF: "
}

delete_ctf() {
  deleted_ctf=$(select_ctf)
  if [ -z "$deleted_ctf" ] || [ ! -d "$ctf_base_dir/$deleted_ctf" ]; then
    exit 0
  fi
  if [ "$(echo -e "Yes\nNo" | rofi -dmenu -p "Are you sure you want to delete $deleted_ctf?")" == "Yes" ]; then
    rm -rf "${ctf_base_dir:?}/$deleted_ctf"
  fi
}

delete_challenge() {
  selected_ctf=$(select_ctf)
  echo "$ctf_base_dir/$selected_ctf"
  if [ -z "$selected_ctf" ] || [ ! -d "$ctf_base_dir/$selected_ctf" ]; then
    exit 0
  fi
  challenges=$(zenity --file-selection --multiple --directory --title "Select all challenge files" --filename "$ctf_base_dir/$selected_ctf/")
  IFS='|' read -ra challenge_array <<<"$challenges"
  for challenge in "${challenge_array[@]}"; do
    if [ -z "$challenge" ]; then
      continue
    fi
    if [ "$(echo -e "Yes\nNo" | rofi -dmenu -p "Are you sure you want to delete $(basename "$challenge")?")" == "Yes" ]; then
      rm -rf "$challenge"
    fi
  done
}

quit() {
  exit 1
}

main_menu() {
  declare -A options
  options=(
    ["Create New CTF"]=create_new_ctf
    ["Delete CTF"]=delete_ctf
    ["Quit"]=quit
    ["Delete Challenge"]=delete_challenge
    ["Add Challenge"]=add_challenge
  )

  ctf_prompt="$1"

  # Show rofi menu and get the selected option
  selected=$(echo -e "$(
    IFS=$'\n'
    echo "${!options[*]}"
  )" | rofi -dmenu -i -p "$ctf_prompt")

  if [ -z "$selected" ]; then
    exit 0
  fi

  if [[ -n ${options[$selected]} ]]; then
    ${options[$selected]}
  else
    exit 0
  fi
}

main_menu " Choose an option:"
