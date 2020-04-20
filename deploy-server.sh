#!/bin/bash

RELEASE="20200202"
APPIMAGE_NAME="OpenRA-Red-Alert-x86_64.AppImage"
URL="https://github.com/OpenRA/OpenRA/releases/download/release-$RELEASE/$APPIMAGE_NAME"
DEPLOY_DIR_NAME="openra-srv"
DEPLOY_DIR_PATH="~/$DEPLOY_DIR_NAME"

echo ">> Cleaning the installation stage..."
if [ -d "$DEPLOY_DIR_PATH" ]; then
    echo ">> Are you sure you want to delete the previous installation?"
    rm -r -I "$DEPLOY_DIR_PATH"
fi

mkdir -p "$DEPLOY_DIR_PATH"

echo ">> Downloading $APPIMAGE_NAME (release-$RELEASE)"
wget wget -q --show-progress -O "$APPIMAGE_NAME" "$URL"

echo ">> Extracting $APPIMAGE_NAME"
chmod +x "$APPIMAGE_NAME"
./"$APPIMAGE_NAME" --appimage-extract

echo ">> Moving squashfs-root --> $DEPLOY_DIR_PATH"
mv squashfs-root "$DEPLOY_DIR_PATH"

echo ">> Copying configuration scripts..."
cp run-openra-srv.sh "$DEPLOY_DIR_PATH"/run-openra-srv.sh
cp background-cmd.txt "$DEPLOY_DIR_PATH"/background-cmd.txt

echo ">> Deleting $APPIMAGE_NAME"
rm $APPIMAGE_NAME
