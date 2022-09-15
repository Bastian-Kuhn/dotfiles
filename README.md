# Dotfiles

After some Inspiration in Youtube I created my own dotfiles which I can deploy on Linux and macOS.


It's basically for my own use. 
Attention: The install.sh script removes without asking config files and folders and replaces them with symlinks.
Removed are .vimrc, .vim, .tmux.conf, .zshrc and ~/bin (List may incomplete, check script)


## Hints:
- Terminal need to be set to 256 Colors
- Use right Fonts, found also here in repo: MesloLGS

## Features
- Command tm: shows menue to start named tmux session or connect to one
- Command tm-up: starts/ reconnect tmux session with data of .tmux.conf of current directory
- Command ve: Load Python Venv in this dir
- Command bve: Build a new Pyhton Venv in dir
- Command f12: Run commands defined in .f12 file. Mapped in vim to key
- tmux: Mouse Support, decent colors
- tmux: 265 Colors Setup (Set your Terminal)
- tmux: ctrl + s and ctr + b as controll keys
- vim: Developer Color Theme with good syntax higlights
- vim: copy from vim to local clipboard
- vim: ctrl + p: Search for files and open in Tab with ctr + t
- vim: Linter Support
- vim: Git Support
- vim: split screen with ctrl + h, j, k, l
- zsh: p10k shell
- zsh: Shell shows git branches, virtual envs etc

## Notes
- https://github.com/sonph/onehalf (Colorshemes)
- https://github.com/nicknisi/dotfiles

