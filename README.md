# dotfiles

macOS用の個人設定ファイル集

## 含まれる設定

| ファイル | 説明 |
|----------|------|
| `.zshrc` | zsh設定（エイリアス、peco、pyenv、nvm等） |
| `.zprofile` | ログインシェル設定（brew、履歴、tmux自動起動） |
| `.vimrc` | Vim設定（atom-dark-256テーマ） |
| `.tmux.conf` | tmux設定（プレフィックスC-t、vimキーバインド） |
| `colors/` | Vimカラースキーム |
| `others/karabiner.json` | Karabiner-Elements設定（CapsLock→Control等） |
| `others/Default.bttpreset` | BetterTouchTool設定 |

## セットアップ

```bash
# リポジトリをクローン
git clone https://github.com/your-username/dotfiles.git ~/dotfiles

# セットアップ実行（ツールのインストール＋リンク作成）
cd ~/dotfiles
./init.sh
```

init.shは以下を自動で行います：
- Homebrewのインストール（未インストールの場合）
- 必要なツールのインストール（tmux, peco, neovim, pyenv, nvm等）
- oh-my-zshのインストール
- 設定ファイルへのシンボリックリンク作成
- Karabiner設定のリンク（インストール済みの場合）

## セットアップ後

```bash
# ターミナルを再起動後

# Pythonのインストール
pyenv install 3.12
pyenv global 3.12

# Node.jsのインストール
nvm install --lts
nvm use --lts
```

## 自動インストールされるツール

| ツール | 用途 |
|--------|------|
| [tmux](https://github.com/tmux/tmux) | ターミナルマルチプレクサ |
| [peco](https://github.com/peco/peco) | インタラクティブフィルタリング（履歴検索） |
| [neovim](https://neovim.io/) | テキストエディタ |
| [pyenv](https://github.com/pyenv/pyenv) | Pythonバージョン管理 |
| [pyenv-virtualenv](https://github.com/pyenv/pyenv-virtualenv) | Python仮想環境管理 |
| [nvm](https://github.com/nvm-sh/nvm) | Node.jsバージョン管理 |
| [oh-my-zsh](https://ohmyz.sh/) | zshフレームワーク |

## オプションツール（手動インストール）

- [Karabiner-Elements](https://karabiner-elements.pqrs.org/) - キーボードカスタマイズ
- [BetterTouchTool](https://folivora.ai/) - トラックパッド/キーボードカスタマイズ
