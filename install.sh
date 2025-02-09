#!/bin/bash

# Define installation directories
INSTALL_DIR="$HOME/tools"
CLANGD_URL="https://github.com/clangd/clangd/releases/download/llvmorg-16.0.0/clangd-16.0.0-x86_64-windows.zip"
PYRIGHT_URL="https://github.com/microsoft/pyright/releases/download/v1.1.223/pyright-win.zip"
GCC_URL="https://github.com/WinLibs/mingwlibs/releases/download/2022.06.04/WinLibs-MinGW-w64-2022.06.04-mingw32.zip"

# Create install directory if it doesn't exist
mkdir -p "$INSTALL_DIR"

# Download and install clangd
echo "Downloading clangd..."
curl -L "$CLANGD_URL" -o "$INSTALL_DIR/clangd.zip"
unzip "$INSTALL_DIR/clangd.zip" -d "$INSTALL_DIR/clangd"
rm "$INSTALL_DIR/clangd.zip"

# Download and install pyright
echo "Downloading pyright..."
curl -L "$PYRIGHT_URL" -o "$INSTALL_DIR/pyright.zip"
unzip "$INSTALL_DIR/pyright.zip" -d "$INSTALL_DIR/pyright"
rm "$INSTALL_DIR/pyright.zip"

# Download and install MinGW GCC
echo "Downloading MinGW GCC..."
curl -L "$GCC_URL" -o "$INSTALL_DIR/mingw.zip"
unzip "$INSTALL_DIR/mingw.zip" -d "$INSTALL_DIR/mingw"
rm "$INSTALL_DIR/mingw.zip"

# Add tools to PATH
echo "Updating PATH..."
echo "export PATH=\$PATH:$INSTALL_DIR/clangd/clangd.exe:$INSTALL_DIR/pyright:$INSTALL_DIR/mingw/bin" >> ~/.bashrc

# Source the updated bashrc
source ~/.bashrc

echo "Installation complete!"
