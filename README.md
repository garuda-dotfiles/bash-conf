# bash-conf

Bash configuration for Garuda Linux. `.bashrc` loads Garuda's defaults first and keeps only personal
overrides below them, so the defaults follow system updates.

## Requirements

- Garuda Linux with `garuda-bash-config` (provides `/usr/share/garuda/garuda-bash-config/bashrc`)
- eza, bat, ugrep, fastfetch (installed on Garuda by default)
- Optional: [nvm](https://github.com/nvm-sh/nvm), Go, Rust (rustup), Neovim

## Install

```bash
git clone https://github.com/garuda-dotfiles/bash-conf ~/dotfiles-conf/bash-conf
mv ~/.bashrc ~/.bashrc.bak   # keep the old config
ln -s ~/dotfiles-conf/bash-conf/.bashrc ~/.bashrc
exec bash
```

## What `.bashrc` does

1. Returns early for non-interactive shells.
2. Sources Garuda's defaults: eza / bat / ugrep aliases, pacman helpers (`upd`, `cleanup`, `rip`, ...).
3. Overrides:

| Override | Value |
| --- | --- |
| Prompt | Plain `[user@host dir]$` (the starship prompt from Garuda is turned off) |
| `PATH` | `~/usr/bin`, `~/.local/bin`, `GOPATH/bin` (when `go` exists), `~/.cargo/bin` |
| `rm` | `rm --verbose --interactive=once` |
| `cd` | `cd -P` |
| `vim` / `vd` | `nvim -p` / `nvim -dO` |
| `ll` | `eza -lah --icons=always --git-repos --git -T -L 2` |
| Cursor | Blinking beam (`\e[5 q`) |
| Startup | `fastfetch -l garuda` |
| nvm | Loads `~/.nvm/nvm.sh` and its completion |
| ssh-agent | Starts one when none runs and adds `~/.ssh/github/phamnam2003` |

To use the starship prompt again, remove the "Prompt" block in `.bashrc`.
