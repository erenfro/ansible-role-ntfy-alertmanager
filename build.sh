#!/bin/bash
set -e

# Configuration
REPO_URL="https://git.xenrox.net/~xenrox/ntfy-alertmanager"
BUILD_DIR="$(dirname "$0")/build"
TMP_DIR="$(mktemp -d)"

# Cleanup on exit
trap 'rm -rf "$TMP_DIR"' EXIT

echo "Cloning repository..."
git clone "$REPO_URL" "$TMP_DIR/src"

echo "Building binary..."
cd "$TMP_DIR/src"
go build -o ntfy-alertmanager .

echo "Moving binary to build directory..."
mkdir -p "$BUILD_DIR"
mv ntfy-alertmanager "$BUILD_DIR/ntfy-alertmanager"

echo "Build complete: $BUILD_DIR/ntfy-alertmanager"
