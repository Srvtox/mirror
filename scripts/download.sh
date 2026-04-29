#!/bin/bash
set -e

BASE="https://static.rust-lang.org/dist"
TARGET="x86_64-unknown-linux-gnu"

mkdir -p dist
cd dist

echo "Downloading metadata..."
curl -L -O "$BASE/channel-rust-stable.toml"

# Extract correct version of Rust bundle from metadata
VERSION=$(grep -A1 '\[pkg.rust\]' channel-rust-stable.toml \
    | grep '^version' \
    | cut -d '"' -f2 \
    | cut -d ' ' -f1)

echo "Rust version detected: $VERSION"
echo "$VERSION" > VERSION

echo "Downloading Rust bundle (installer)..."

# Download installer bundle (this contains rustc + cargo + std + install.sh)
BUNDLE="rust-$VERSION-$TARGET.tar.xz"
curl -L -O "$BASE/$BUNDLE"
curl -L -O https://static.rust-lang.org/dist/rust-src-$VERSION.tar.xz

echo "Downloaded files:"
ls -lh
