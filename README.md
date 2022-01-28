# Dotfiles of my mac setup

I manage my dotfiles by using a bare repository in my `$HOME` directory as explained in [this](https://www.atlassian.com/git/tutorials/dotfiles) tutorial.
To install these dotfiles onto a new system (or migrate to this setup) you can follow these steps :

* Add this alias to your `.zshrc` file:
```
alias config='/usr/bin/git --git-dir=$HOME/.config/ --work-tree=$HOME'
```
* Add this `.config` folder to gitignore:
```
echo ".config" >> .gitignore
```
* Now clone these dotfiles into a bare repository in a "dot" folder in your `$HOME` directory:
```
git clone --bare https://github.com/ujjwal404/dotfiles $HOME/.config
```
* Define the alias in the current shell scope:
```
alias config='/usr/bin/git --git-dir=$HOME/.config/ --work-tree=$HOME'
```
* Now before checking out bare repository, backup all conflicting files in a `config-backup` folder:
```
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
```
* Run config checkout and set the flag showUntrackedFiles to no on this specific (local) repository:
```
config checkout
config config --local status.showUntrackedFiles no
```
* You're done. Now you can manage these files using all the config commands.
```
config status
config add .vimrc
config commit -m "Add vimrc"
config add .bashrc
config commit -m "Add bashrc"
config push
```

