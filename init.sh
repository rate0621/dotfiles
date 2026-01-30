#!/bin/sh

set -e

echo "=== dotfiles セットアップ開始 ==="

# ----------------------------------------
# Homebrew
# ----------------------------------------
if ! command -v brew &> /dev/null; then
    echo "Homebrewをインストールしています..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "Homebrew: インストール済み"
fi

# ----------------------------------------
# Homebrewパッケージ
# ----------------------------------------
echo "Homebrewパッケージをインストールしています..."

BREW_PACKAGES=(
    tmux
    peco
    neovim
    pyenv
    pyenv-virtualenv
)

for pkg in "${BREW_PACKAGES[@]}"; do
    if brew list "$pkg" &> /dev/null; then
        echo "  $pkg: インストール済み"
    else
        echo "  $pkg: インストール中..."
        brew install "$pkg"
    fi
done

# ----------------------------------------
# nvm（Homebrewではなく公式スクリプトでインストール）
# ----------------------------------------
if [ ! -d "$HOME/.nvm" ]; then
    echo "nvmをインストールしています..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
else
    echo "nvm: インストール済み"
fi

# ----------------------------------------
# oh-my-zsh
# ----------------------------------------
if [ ! -d ~/.oh-my-zsh ]; then
    echo "oh-my-zshをインストールしています..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "oh-my-zsh: インストール済み"
fi

# ----------------------------------------
# シンボリックリンク作成
# ----------------------------------------
echo "シンボリックリンクを作成しています..."

ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/colors ~/.vim
ln -sf ~/dotfiles/.zprofile ~/.zprofile
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

# neovim設定
mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim

echo "  .vimrc, .vim, .zprofile, .zshrc, .tmux.conf, nvim/init.vim: リンク完了"

# ----------------------------------------
# Karabiner-Elements設定
# ----------------------------------------
if [ -d "/Applications/Karabiner-Elements.app" ]; then
    mkdir -p ~/.config/karabiner
    ln -sf ~/dotfiles/others/karabiner.json ~/.config/karabiner/karabiner.json
    echo "Karabiner設定: リンク完了"
else
    echo "Karabiner-Elements: 未インストール（スキップ）"
fi

# ----------------------------------------
# BetterTouchTool設定
# ----------------------------------------
if [ -d "/Applications/BetterTouchTool.app" ]; then
    echo "BetterTouchTool設定ファイル: ~/dotfiles/others/Default.bttpreset"
    echo "  → BTTアプリから手動でインポートしてください"
else
    echo "BetterTouchTool: 未インストール（スキップ）"
fi

# ----------------------------------------
# Claude Code設定
# ----------------------------------------
echo "Claude Code設定をリンクしています..."

# ~/.claudeディレクトリがなければ作成
mkdir -p ~/.claude

# 設定ファイルのリンク
ln -sf ~/dotfiles/.claude/CLAUDE.md ~/.claude/CLAUDE.md
ln -sf ~/dotfiles/.claude/settings.json ~/.claude/settings.json

# ディレクトリのリンク（既存があれば削除してからリンク）
for dir in rules agents commands skills; do
    if [ -L ~/.claude/$dir ]; then
        rm ~/.claude/$dir
    elif [ -d ~/.claude/$dir ]; then
        rm -rf ~/.claude/$dir
    fi
    ln -sf ~/dotfiles/.claude/$dir ~/.claude/$dir
done

echo "  CLAUDE.md, settings.json, rules/, agents/, commands/, skills/: リンク完了"

# ----------------------------------------
# 完了
# ----------------------------------------
echo ""
echo "=== セットアップ完了 ==="
echo ""
echo "次のステップ:"
echo "  1. ターミナルを再起動してください"
echo "  2. pyenv install <version> でPythonをインストール"
echo "  3. nvm install --lts でNode.jsをインストール"
