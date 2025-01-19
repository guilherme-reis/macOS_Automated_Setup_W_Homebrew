# Usage instruction
# To run this script, use the following command:
# cd ~/Documents/Install && chmod +x install_apps.sh && ./install_apps.sh | tee install_apps.log
# The above command will run the script and save the output to a log file named install_apps.log in the same directory.

#!/bin/bash

# Welcome Message
echo "$(date '+%Y-%m-%d %H:%M:%S') - Welcome to the Automated Setup Script!"

# Request for Administrator Access
echo "$(date '+%Y-%m-%d %H:%M:%S') - Administrator access is required."
sudo -v

# macOS Updates
echo "$(date '+%Y-%m-%d %H:%M:%S') - Checking for available macOS updates..."
if softwareupdate --list | grep -q 'No new software available'; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - No macOS updates available."
else
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Installing macOS updates..."
    softwareupdate --all --install || echo "$(date '+%Y-%m-%d %H:%M:%S') - macOS update failed."
fi

# Xcode Tools Installation
echo "$(date '+%Y-%m-%d %H:%M:%S') - Verifying Xcode Command Line Tools installation..."
xcode-select --install || echo "$(date '+%Y-%m-%d %H:%M:%S') - Xcode Command Line Tools are already installed."

# Homebrew Installation
if ! command -v brew &>/dev/null; then
  echo "$(date '+%Y-%m-%d %H:%M:%S') - Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "$(date '+%Y-%m-%d %H:%M:%S') - Homebrew is already installed."
fi

# Update Homebrew
if brew update; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Homebrew updated successfully."
else
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Homebrew update failed. Check your network connection."
    exit 1
fi

# Install Formulae
echo "$(date '+%Y-%m-%d %H:%M:%S') - Installing essential formulae..."
if brew install wget python git speedtest-cli; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Formulae installed successfully."
else
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Some formulae installations failed. Check logs."
fi

# Install Casks
echo "$(date '+%Y-%m-%d %H:%M:%S') - Installing essential applications..."
if brew install --cask microsoft-teams onedrive microsoft-onenote insomnia whatsapp xmind the-unarchiver spotify vlc google-chrome visual-studio-code github docker virtualbox readest dbeaver-community applite postman; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - All applications installed successfully."
else
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Some application installations failed. Check logs."
fi

# Cleanup
echo "$(date '+%Y-%m-%d %H:%M:%S') - Cleaning up outdated files..."
brew cleanup && brew autoremove

# Completion
echo "$(date '+%Y-%m-%d %H:%M:%S') - Setup completed successfully!"
echo "$(date '+%Y-%m-%d %H:%M:%S') - Installation Summary:"
echo "-----------------------------------------------------"
echo "Installed Formulae:"
brew list --formula

echo "-----------------------------------------------------"
echo "Installed Casks:"
brew list --cask

echo "-----------------------------------------------------"

exit 0
