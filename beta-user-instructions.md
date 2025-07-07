# Kitto Installation Instructions

## If you see "Kitto is damaged and can't be opened"

This happens because the app isn't code-signed yet. Here's how to fix it:

### Option 1: Remove Quarantine (Easiest)

1. Download Kitto-1.0.0-arm64.dmg
2. Open Terminal
3. Run this command:
   ```bash
   xattr -c ~/Downloads/Kitto-1.0.0-arm64.dmg
   ```
4. Now open the DMG normally and drag Kitto to Applications
5. Right-click Kitto in Applications and select "Open"

### Option 2: Allow in Security Settings

1. Download and try to open the DMG
2. When you see the error, go to System Settings > Privacy & Security
3. Look for a message about Kitto being blocked
4. Click "Open Anyway"

### Option 3: Terminal Install

```bash
# Download the DMG
curl -L -o ~/Downloads/Kitto.dmg https://github.com/kittohq/kitto/raw/main/releases/Kitto-1.0.0-arm64.dmg

# Remove quarantine
xattr -c ~/Downloads/Kitto.dmg

# Mount the DMG
hdiutil attach ~/Downloads/Kitto.dmg

# Copy to Applications
cp -R /Volumes/Kitto/Kitto.app /Applications/

# Unmount
hdiutil detach /Volumes/Kitto

# Remove quarantine from app
xattr -cr /Applications/Kitto.app

# Open the app
open /Applications/Kitto.app
```

## Why does this happen?

- Kitto isn't code-signed with an Apple Developer certificate (yet)
- macOS quarantines all unsigned apps downloaded from the internet
- This is Apple's security feature called Gatekeeper

## Future Solution

We're working on getting an Apple Developer certificate to sign the app properly. Once signed, this issue will go away.
