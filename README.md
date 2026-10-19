# Dotfiles

After some Inspiration in Youtube I created my own dotfiles which I can deploy on Linux and macOS.


It's basically for my own use. 
The install.sh script replaces config files and folders with symlinks into this repo.
Existing targets (.vimrc, .vim, .tmux.conf, .zshrc, .zprofile, .p10k.zsh, ~/bin) are not deleted
but moved to <name>.bak-<date> first; links that are already correct are left alone.


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

## AI review workflow

Alle Tasten und Befehle auf einen Blick: [CHEATSHEET.md](CHEATSHEET.md).
Tools: `brew install fzf git-delta lazygit`. Delta is the git pager (set in ~/.gitconfig, not in this repo).

- `ai-session [repo]`: tmux session for a repo (name below ~/git or path): claude left, vim right, shell below. Reuses an existing session.
- `ai-review`: Cairn tasks tagged "Review AI Work". Preview shows the whole comment thread, newest first.
  Keys: enter opens the task in Firefox, ctrl-o opens vim `:Review` on the commits named in the comment
  (or on the unpushed work of the repo), ctrl-g lazygit, ctrl-t writes a comment in `$EDITOR` (empty aborts),
  ctrl-x closes the task, alt-u drops the review tag (task stays open), ctrl-r reload. Close and untag ask y/N.
  Writes use the token from `cairn login` (or `$CAIRN_TOKEN`) and refuse the Claude account's token.
  `ai-review --print` for a plain list, `--comment|--close|--untag ID` without the picker.
- `ai-changes`: per repo branch, to push, behind, uncommitted files and unpushed commits.
  `--fetch` fetches first, `--pick` is an fzf picker (enter vim `:Review`, ctrl-g lazygit). Repos: `$AI_REPOS`.
- tmux: `prefix g` lazygit, `prefix R` ai-review, `prefix A` ai-changes --pick (all as popups).
- vim (leader is space): `:Review [base] [head]` puts every changed file into the quickfix list and shows a
  side by side diff per file, `]q`/`[q` next/previous file, `<leader>gq` ends it. Default base is `@{u}`
  (else HEAD~1) against the work tree. `<leader>gs` status, `<leader>gd` diff file, `<leader>gD` diff file vs
  upstream, `<leader>gl` file log, `<leader>gL` repo log, `<leader>gb` blame, `<leader>gr` :Review,
  `]h`/`[h` next/previous hunk, `<leader>hp` preview, `<leader>hu` undo, `<leader>hs` stage hunk.
- zsh: `gd` diff, `gds` staged diff, `gdu` diff against upstream, `glu` unpushed commits.

## Notes
- https://github.com/sonph/onehalf (Colorshemes)
- https://github.com/nicknisi/dotfiles

