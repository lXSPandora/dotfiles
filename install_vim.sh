echo "🚀 Installing neovim config 🚀"
cp init.vim ~/.config/nvim/init.vim
cp -R UtilSnips/ ~/.vim/UtilSnips/
echo "⚡️ Copied the Configuration and Snippets ⚡️"

echo "👽 Installing Dein 👽"
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
echo "✅ Dein Installed ✅"

echo "🚀 Vim Configuration Installed 🚀"
echo "👉 Now run nvim to open neovim"
echo "👉 And run this command ':call dein#install()'"
