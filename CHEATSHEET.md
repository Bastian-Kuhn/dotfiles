# Cheat Sheet: AI Review Workflow

Tastenkürzel und Befehle, um nachzuvollziehen, was AI (Claude) gemacht hat,
und es in vim, git und tmux zu reviewen. In vim ist der Leader **Space**.

## Befehle

| Befehl | Was es tut |
|---|---|
| `ai-review` | Offene Cairn Tasks mit Tag `Review AI Work`, Vorschau auf den ganzen Kommentarverlauf, neuester oben. Schreibt nur bei Kommentar, Schließen und Tag entfernen, nie mit dem Claude Token |
| `ai-review --print` | Gleiche Liste ohne fzf, als Text |
| `ai-review --comment ID` | Kommentar in `$EDITOR` schreiben und posten (leer bricht ab) |
| `ai-review --close ID` | Task erledigt setzen (fragt y/N) |
| `ai-review --untag ID` | Tag `Review AI Work` entfernen, Task bleibt offen (fragt y/N) |
| `ai-changes` | Pro Repo: Branch, ungepushte Commits, Rückstand, uncommittete Dateien |
| `ai-changes --fetch` | Vorher `git fetch` in jedem Repo |
| `ai-changes --pick` | fzf Auswahl der Repos mit offener Arbeit |
| `ai-session [repo]` | tmux Session: Claude links, `ai-review` rechts, Shell unten (bestehende wird wiederverwendet) |

Repos für `ai-changes`: per Default cairn, Checkmk-Checks, cmdbsyncer, fmg-checks, dotfiles; über `$AI_REPOS` änderbar.

## ai-review (fzf)

| Taste | Aktion |
|---|---|
| `Enter` | Task im Browser öffnen |
| `Ctrl-o` | vim `:Review` auf die im Kommentar genannten Commits (sonst die ungepushte Arbeit des Repos) |
| `Ctrl-g` | lazygit im Repo |
| `Ctrl-t` | Kommentar in `$EDITOR` schreiben und posten |
| `Ctrl-x` | Task schließen (fragt y/N) |
| `Alt-u` | Tag `Review AI Work` entfernen, Task bleibt offen (fragt y/N) |
| `Ctrl-r` | Liste neu laden |
| `Esc` | Beenden |

## ai-changes --pick (fzf)

| Taste | Aktion |
|---|---|
| `Enter` | vim `:Review` im Repo |
| `Ctrl-g` | lazygit im Repo |

## tmux

| Taste | Aktion |
|---|---|
| `prefix g` | lazygit als Popup im aktuellen Verzeichnis |
| `prefix R` | `ai-review` als Popup |
| `prefix A` | `ai-changes --pick` als Popup |
| `Ctrl-h/j/k/l` | Pane wechseln ohne Prefix, auch aus vim-Splits und fzf-Listen heraus |
| `prefix Ctrl-l` | Bildschirm leeren (`Ctrl-l` ist jetzt Navigation) |
| `Alt-h` / `Alt-l` | vorheriges / nächstes Window |
| `Alt-1` … `Alt-9` | direkt zu Window N |

Alt braucht in Terminal.app: Profil → Tastatur → „Wahltaste als Meta-Taste verwenden“.

## vim: Review

| Befehl / Taste | Aktion |
|---|---|
| `:Review` | Upstream (`@{u}`, sonst `HEAD~1`) gegen Working Tree: alle geänderten Dateien in die Quickfix Liste, jede als Side by Side Diff |
| `:Review HEAD~3` | Letzte 3 Commits |
| `:Review abc~1 abc` | Genau ein Commit `abc` |
| `]q` / `[q` | Nächste / vorherige Datei im Review |
| `Space gq` | Review beenden |

## vim: Git

| Taste | Aktion |
|---|---|
| `Space gs` | Git Status (fugitive) |
| `Space gd` | Diff der aktuellen Datei |
| `Space gD` | Diff der aktuellen Datei gegen Upstream |
| `Space gl` | Log der aktuellen Datei |
| `Space gL` | Repo Graph |
| `Space gb` | Blame |
| `Space gr` | `:Review` |
| `]h` / `[h` | Nächster / vorheriger geänderter Block |
| `Space hp` | Block Vorschau |
| `Space hu` | Block rückgängig machen |
| `Space hs` | Block stagen |

## zsh

| Alias | Aktion |
|---|---|
| `gd` | `git diff` (über delta) |
| `gds` | Gestagte Änderungen |
| `gdu` | Diff gegen Upstream |
| `glu` | Ungepushte Commits |

## git

`delta` ist der Pager (gruvbox dark, Zeilennummern, `n`/`N` springt zwischen Dateien), auch bei `git add -p`.

## tmux Statuszeile

`cpu` Auslastung aller Kerne in %, `load` 1 Minuten Load, `free` verfügbarer Speicher (Cache zählt als frei), danach Akku.
