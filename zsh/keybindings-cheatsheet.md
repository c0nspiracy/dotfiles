# Zsh keybindings cheatsheet

Defaults that work in this setup (zsh + vi-mode + fzf + atuin + zsh-autosuggestions).
Most bindings work in vi *insert* mode (the mode you start in). For full vi editing
hit `Esc` to drop into normal mode.

## Editing the current line

| Keys             | Action                                                |
| ---------------- | ----------------------------------------------------- |
| `Ctrl-A`         | Jump to start of line                                 |
| `Ctrl-E`         | Jump to end of line — **also accepts autosuggestion** |
| `→` (at line end)| Accept autosuggestion                                 |
| `Alt-F`          | Forward by word — accepts *one word* of suggestion    |
| `Alt-B`          | Backward by word                                      |
| `Ctrl-W`         | Delete word before cursor                             |
| `Alt-Backspace`  | Delete previous word (smaller chunk than Ctrl-W)      |
| `Alt-D`          | Delete *next* word                                    |
| `Ctrl-U`         | Delete from cursor back to start                      |
| `Ctrl-K`         | Delete from cursor to end                             |
| `Ctrl-Y`         | Paste back what was killed by Ctrl-W/U/K              |
| `Ctrl-T`         | Swap two characters around the cursor                 |
| `Ctrl-_`         | Undo                                                  |
| `Ctrl-L`         | Clear screen, keep current line                       |

## Pulling things from history

| Keys      | Action                                                          |
| --------- | --------------------------------------------------------------- |
| `Ctrl-R`  | Atuin fuzzy history search                                      |
| `↑`       | Atuin filtered history (after the antidote branch lands)        |
| `Alt-.`   | Insert last argument of previous command. Repeat to walk back.  |
| `!!`      | The whole previous command. e.g. `sudo !!`                      |
| `!$`      | Last argument of previous command (text form of `Alt-.`)        |
| `!*`      | All arguments of previous command                               |
| `^old^new`| Re-run last command with `old` replaced by `new`                |
| `r`       | Re-run last command                                             |
| `r make`  | Re-run last command starting with `make`                        |

## Edit in $EDITOR (nvim)

| Keys              | Action                                                 |
| ----------------- | ------------------------------------------------------ |
| `Ctrl-X Ctrl-E`   | Open current command line in nvim. Save+quit to run    |
| `v` (vi normal)   | Same thing (custom binding in zshrc)                   |

## Tab completion & fuzzy pickers

| Keys              | Action                                                 |
| ----------------- | ------------------------------------------------------ |
| `Tab`             | Complete                                               |
| `Tab Tab`         | If multiple matches, enter menu — arrow keys to pick   |
| `**<Tab>`         | fzf fuzzy completion. Try `vim **<Tab>`, `kill **<Tab>`|
| `Alt-C`           | fzf-pick a directory and `cd` into it                  |
| `=cmd`            | Expands to full path of `cmd`. e.g. `ls -l =node`      |

## fzf-git chords (Ctrl-G prefix)

| Keys          | Action                              |
| ------------- | ----------------------------------- |
| `Ctrl-G b`    | Pick a git branch                   |
| `Ctrl-G t`    | Pick a git tag                      |
| `Ctrl-G h`    | Pick a commit hash from log         |
| `Ctrl-G f`    | Pick a tracked file                 |
| `Ctrl-G r`    | Pick a remote                       |
| `Ctrl-G s`    | Pick a stash                        |

(Run `bindkey -p '^g'` to see the full list.)

## Suspending & multitasking

| Keys     | Action                                                          |
| -------- | --------------------------------------------------------------- |
| `Alt-Q`  | Push current line aside, fresh prompt — line returns afterward  |
| `Alt-#`  | Comment out current line, send to history, fresh prompt         |
| `Ctrl-Z` | Suspend foreground process                                      |
| `fg`     | Resume most recent suspended process                            |
| `bg`     | Resume in background                                            |

## Globbing tricks (zsh-only)

```zsh
ls **/*.rb              # recursive glob — no need for find
print -l *(.)           # only regular files
print -l *(/)           # only directories
print -l *(.om[1])      # most recently modified file
ls -ld *(N)             # nullglob — no error if no matches
```

Add `setopt extendedglob` to zshrc to also get:

```zsh
ls **/*.rb~**/spec/*    # exclusion via ~
ls ^*.bak               # negation via ^
```

## Setup gotchas (macOS + vi-mode)

Two non-obvious things have to be in place for the `Alt-X` bindings above to work
on a Mac with vi-mode active:

1. **Ghostty** (or whichever terminal): `macos-option-as-alt = true` so that Option
   sends an Esc-prefixed escape sequence (`Option-F` → `^[f`) instead of a special
   character (`Option-F` → `ƒ`).
2. **zshrc**: vi insert mode (`viins`) inherits almost no Alt-bindings from the
   default zsh setup — `forward-word`, `backward-word`, `kill-word`,
   `insert-last-word` etc. are all unbound in viins. They have to be added
   explicitly with `bindkey -M viins '^[f' forward-word` etc. (already done).

If an `Alt-X` binding stops working unexpectedly, check `bindkey -M viins '^[X'`
to see what (if anything) it's bound to in the active keymap.

## Discovering more

| Command                  | Shows                                              |
| ------------------------ | -------------------------------------------------- |
| `bindkey`                | Every binding in current keymap                    |
| `bindkey -M viins`       | Insert-mode bindings                               |
| `bindkey -M vicmd`       | Normal-mode bindings                               |
| `bindkey -p '^g'`        | All bindings starting with Ctrl-G                  |
| `zle -la`                | Every available widget you could bind             |
| `man zshzle`             | Full reference for the line editor                 |
| `man zshcontrib`         | Useful contrib widgets (incremental-complete-word) |
