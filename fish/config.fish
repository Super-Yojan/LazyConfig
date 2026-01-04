if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias vim nvim
alias vi nvim
alias cat bat
alias z zjs

# 1. THEME DEFINITION
# Metadata (Noise) -> Dark Grey (38;5;240)
# Executables (Action) -> Critical Red (1;31)
# Directories (Structure) -> Bold White (1;37)
set -gx EZA_COLORS "da=38;5;240:sn=38;5;240:sb=38;5;240:ur=38;5;240:gr=38;5;240:tr=38;5;240:xx=38;5;237:di=1;37:fi=37:ex=1;31:ln=3;38;5;250:ga=37:gm=31:gi=38;5;237"

# ls -> Grid view
alias ls 'eza --icons --group-directories-first'

# ll -> Detailed table (No User column to save space/noise)
alias ll 'eza -l --icons --git --group-directories-first --time-style=long-iso --no-user'

# tree -> Structural blueprint view
alias tree 'eza --tree --icons --level=2'

# Eza replacements for ls
alias la="eza -a --icons=always"
alias lt="eza --tree --level=2 --icons=always"
alias l="eza -lbF --icons=always"

set fish_greeting ""

starship init fish | source

enable_transience

# Initialize zoxide (replaces cd with z)
zoxide init fish --cmd cd | source

borders active_color=0xffFF0000 inactive_color=0xff161616 width=6.0 &
