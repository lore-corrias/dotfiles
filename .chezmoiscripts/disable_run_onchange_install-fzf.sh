#!/bin/bash

# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to handle errors
handle_error() {
  echo -e "${RED}An error occurred. Exiting.${NC}"
  exit 1
}

# Trap errors and execute the error handler
trap 'handle_error' ERR

# Start process
echo -e "${YELLOW}Starting fzf installation...${NC}"

# Download Neovim appimage
echo -e "${YELLOW}Downloading Neovim appimage...${NC}"
if wget -q https://github.com/neovim/neovim/releases/latest/download/nvim.appimage; then
  echo -e "${GREEN}Download successful!${NC}"
else
  echo -e "${RED}Failed to download Neovim appimage. Please check your internet connection or the URL.${NC}"
  exit 1
fi

echo -e "${YELLOW}Extracting the appimage...${NC}"
if ! chmod u+x nvim.appimage; then
  echo -e "${RED}Failed to make the appimage executable.${NC}"
  exit 1
fi

if ! ./nvim.appimage --appimage-extract >/dev/null 2>&1; then
  echo -e "${RED}Failed to extract the appimage.${NC}"
  exit 1
fi

# Move extracted contents to root
if ! mv squashfs-root ~/.local; then
  echo -e "${RED}Failed to move extracted contents to root. Please check permissions.${NC}"
  exit 1
fi

# Create symbolic link
mkdir ~/.local/bin
if ln -s ~/.local/squashfs-root/AppRun ~/.local/bin/nvim; then
  echo -e "${GREEN}Extraction successful!${NC}"
else
  echo -e "${RED}Failed to extract the appimage. Please check permissions.${NC}"
  exit 1
fi

# Cleaning up
rm -rf nvim.appimage

# Completion message
echo -e "${GREEN}Neovim installation completed successfully!${NC}"
