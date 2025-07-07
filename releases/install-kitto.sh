#!/bin/bash
# Kitto Quick Installer

echo "📦 Installing Kitto..."

# Download DMG
echo "⬇️  Downloading..."
curl -L -o /tmp/Kitto.dmg https://github.com/kittohq/kitto/releases/download/v1.0.0/Kitto-1.0.0-arm64.dmg

# Remove quarantine
echo "🔓 Removing quarantine..."
xattr -c /tmp/Kitto.dmg

# Mount DMG
echo "💿 Mounting..."
hdiutil attach /tmp/Kitto.dmg -nobrowse

# Copy to Applications
echo "📁 Installing to Applications..."
rm -rf /Applications/Kitto.app
cp -R /Volumes/Kitto/Kitto.app /Applications/

# Unmount
hdiutil detach /Volumes/Kitto

# Remove quarantine from app
xattr -cr /Applications/Kitto.app

# Cleanup
rm /tmp/Kitto.dmg

echo "✅ Kitto installed successfully!"
echo ""
echo "🚀 Launching Kitto..."
open /Applications/Kitto.app