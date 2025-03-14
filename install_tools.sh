#!/bin/bash

# Kiểm tra và cài đặt Homebrew nếu chưa có
if ! command -v brew &> /dev/null; then
    echo "Đang cài đặt Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    echo "Cấu hình Homebrew trong PATH (.zprofile)..."
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
    
    echo "Cấu hình Homebrew trong PATH (.zshrc)..."
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
    source ~/.zshrc
fi

if ! command -v brew &> /dev/null; then
    echo "Lỗi: Homebrew không được cài đặt hoặc cấu hình thất bại."
    exit 1
else
    echo "Homebrew đã sẵn sàng: $(brew --version)"
fi

# Kiểm tra và cài đặt Git
if ! command -v git &> /dev/null; then
    echo "Đang cài đặt Git..."
    brew install git
else
    echo "Git đã được cài đặt: $(git --version)"
fi

# Kiểm tra và cài đặt GitHub Desktop
if [ ! -d "/Applications/GitHub Desktop.app" ]; then
    echo "Đang cài đặt GitHub Desktop..."
    brew install --cask github
else
    echo "GitHub Desktop đã được cài đặt tại /Applications/GitHub Desktop.app."
fi

# Kiểm tra và cài đặt NVM
if ! command -v nvm &> /dev/null; then
    echo "Đang cài đặt NVM..."
    brew install nvm
    
    echo "Cấu hình NVM trong .zshrc..."
    echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
    echo '[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh"' >> ~/.zshrc
    echo '[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm"' >> ~/.zshrc
    source ~/.zshrc
else
    echo "NVM đã sẵn sàng: $(nvm --version)"
fi

# Kiểm tra và cài đặt Node.js phiên bản 20
if ! nvm ls 20 &> /dev/null; then
    echo "Đang cài đặt Node.js 20..."
    nvm install 20
    nvm use 20
else
    echo "Node.js 20 đã được cài đặt: $(node --version)"
    nvm use 20
fi

# Kiểm tra và cài đặt Yarn
if ! command -v yarn &> /dev/null; then
    echo "Đang cài đặt Yarn..."
    brew install yarn
else
    echo "Yarn đã sẵn sàng: $(yarn --version)"
fi


echo "Hoàn tất cài đặt! Vui lòng khởi động lại Terminal hoặc máy để kiểm tra."