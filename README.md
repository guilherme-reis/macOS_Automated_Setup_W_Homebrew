---

# Automated macOS Setup Script

Welcome! 👋 This script is designed to streamline the installation of essential apps and tools on macOS. Whether you're setting up a new machine or refreshing an existing one, this script simplifies the process. I hope it proves helpful to you!

---

## Features

This script:
- Updates your macOS system to the latest version.
- Installs essential developer tools like Xcode and Homebrew.
- Automatically sets up a curated selection of applications for development, productivity, and entertainment.
- Cleans up outdated files to keep your system efficient and organized.

---

## Applications Installed

The script installs the following apps via Homebrew:

### Development
- Visual Studio Code
- GitHub Desktop
- Docker
- Postman
- DBeaver Community Edition
- AppLite
- VirtualBox

### Productivity
- Microsoft Teams
- OneDrive
- Microsoft OneNote
- Insomnia
- Xmind

### Utilities
- The Unarchiver
- Google Chrome
- VLC Media Player

### Entertainment
- Spotify
- WhatsApp

### Other
- Readest

---

## Customizing the Installation

### Adding or Removing Applications

To customize the list of apps installed:
1. Open the `install_apps.sh` file in any text editor.
2. Locate the section with the `brew install --cask` command:
   ```bash
   brew install --cask microsoft-teams onedrive microsoft-onenote insomnia whatsapp xmind the-unarchiver spotify vlc google-chrome visual-studio-code github docker virtualbox readest dbeaver-community applite postman
   ```
3. To **add an app**, append its name to the list. For example:
   ```bash
   brew install --cask slack
   ```
4. To **remove an app**, delete its name from the list. For example:
   ```bash
   # Remove Spotify
   brew install --cask microsoft-teams onedrive microsoft-onenote insomnia whatsapp xmind the-unarchiver vlc google-chrome visual-studio-code github docker virtualbox readest dbeaver-community applite postman
   ```
5. Save your changes and rerun the script.

---

## How to Run the Script

1. Clone this repository or download the script:
   ```bash
   git clone https://github.com/guilherme-reis/macOS_Automated_Setup_W_Homebrew.git
   cd macos-setup-script
   ```
2. Make the script executable:
   ```bash
   chmod +x install_apps.sh
   ```
3. Run the script and log its output:
   ```bash
   ./install_apps.sh | tee install_apps.log
   ```

The installation progress will be saved in `install_apps.log`.

---

## Resolving Permissions Issues

If you see the error:
```
Your terminal does not have App Management permissions
```
Follow these steps to grant permissions:

1. Open **System Settings** (or **System Preferences** on older macOS versions).
2. Navigate to **Privacy & Security**.
3. Select **App Management** under **Privacy & Security**.
4. Locate your terminal app (e.g., **Terminal**, **iTerm**, etc.).
5. Check the box to grant the app **App Management permissions**.
6. Restart your terminal and rerun the script.

---

## Contributing

Feel free to contribute by submitting issues, feature requests, or pull requests to this repository. Let's make this script even better together! 💻✨

---

## License

This project is licensed under the MIT License. See `LICENSE` for details.

---