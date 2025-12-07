## 環境
OS: Ubuntu24.04

## 初期設定

1. 本リポジトリをローカルにクローン
```
cd ~/.config
git clone <ssh or https>
```

2. NeoVim本体のインストール
```
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
```

3. 以下の内容を~/.bashrcに追記
```
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
```

4. ~/.bashrcの再読込
```
source ~/.bashrc 
```

5. 必要パッケージのインストール
```
sudo apt update
sudo apt install -y neovim build-essential xclip lazygit
```

6. 必要文字フォントの設定
```
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
unzip JetBrainsMono.zip
fc-cache -fv
```

4. ターミナルへのフォント適用
- ターミナル右上のハンバーガーマーク->設定->サイドメニューで適用されているプロファイル選択
- フォントで"JetBrainsMono Nert Font"を選択
- 一度全てのターミナルを閉じる
- 再度ターミナルを起動してフォントが直っていればOK


