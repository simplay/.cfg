if [ ! -d ".cfg" ]; then
   git clone --bare https://github.com/simplay/.cfg.git $HOME/.cfg
fi

function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no

mkdir .vim
mkdir .vim/colors
mkdir .vim/autoload
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# minimal (`-m`) installation: only fetch vimrc and tmux.conf
# TODO: blacklist explicitly what should not be restored and restore everything else in .config-backup
if [ "$1" = -m ]; then
    cp .config-backup/.bashrc ~/
    cp .config-backup/.bash_profile ~/
    cp .config-backup/.bash_aliases ~/
    cp .config-backup/.zshrc ~/
fi
vim -c PlugInstall -c q! -c q!
