# =========================================================
#  DR. MOSCOVIUM | FISH SHELL CONFIG
#  Palette: Blue (#4A5F7F) | Teal (#5A7A7A) | Cream (#D4C5B0) | Off-Black (#1C1C1E)
#  Retro-Futuristic Engineering Aesthetic
# =========================================================

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# =========================================================
#  CORE ALIASES
# =========================================================

alias vim nvim
alias vi nvim
alias cat bat
alias z zjs

# =========================================================
#  EZA THEME (Dr. Moscovium)
# =========================================================
# Color Philosophy:
# - Metadata (Noise) -> Light Grey (246) - #8E8E93
# - Executables (Action) -> Muted Blue (67) - #4A5F7F
# - Directories (Structure) -> Bold Tan (180) - #D4C5B0
# - Regular Files -> Default/None (no color, just icons)
# - Modified Files -> Muted Red (131) - #B85450
# - Added Files -> Olive Green (101) - #6B7456
# - Links -> Muted Teal (66) - #5A7A7A

# EZA_COLORS format: key=value:key=value
# Key reference:
# da = date            sn = size numbers    sb = size unit
# ur = user read       uw = user write      ux = user execute
# gr = group read      gw = group write     gx = group execute
# tr = other read      tw = other write     tx = other execute
# di = directory       fi = regular file    ex = executable
# ln = symlink         or = broken symlink
# ga = git added       gm = git modified    gd = git deleted
# gi = git ignored     xx = punctuation

set -gx EZA_COLORS "da=38;5;246:sn=38;5;246:sb=38;5;246:ur=38;5;246:uw=38;5;246:ux=38;5;246:gr=38;5;246:gw=38;5;246:gx=38;5;246:tr=38;5;246:tw=38;5;246:tx=38;5;246:xx=38;5;240:di=1;38;5;180:ex=1;38;5;67:ln=3;38;5;66:ga=38;5;101:gm=38;5;131:gd=38;5;131:gi=38;5;240"

# Alternative: No color for regular files (cleaner look)
# set -gx EZA_COLORS "da=38;5;246:sn=38;5;246:sb=38;5;246:ur=38;5;246:uw=38;5;246:ux=38;5;246:gr=38;5;246:gw=38;5;246:gx=38;5;246:tr=38;5;246:tw=38;5;246:tx=38;5;246:xx=38;5;240:di=1;38;5;180:fi=:ex=1;38;5;67:ln=3;38;5;66:ga=38;5;101:gm=38;5;131:gd=38;5;131:gi=38;5;240"

# =========================================================
#  EZA ALIASES
# =========================================================

# ls -> Grid view
alias ls 'eza --icons --group-directories-first'

# ll -> Detailed table (No User column to save space/noise)
alias ll 'eza -l --icons --git --group-directories-first --time-style=long-iso --no-user'

# tree -> Structural blueprint view
alias tree 'eza --tree --icons --level=2'

# Additional eza shortcuts
alias la 'eza -a --icons=always'
alias lt 'eza --tree --level=2 --icons=always'
alias l 'eza -lbF --icons=always'

# =========================================================
#  FISH CONFIGURATION
# =========================================================

# Disable greeting
set fish_greeting ""

# Initialize Starship prompt
starship init fish | source
enable_transience

# Initialize zoxide (replaces cd with z)
zoxide init fish --cmd cd | source

# =========================================================
#  BORDERS (macOS)
# =========================================================
# Active window border: Muted Blue
# Inactive window border: Off-Black
borders active_color=0xff4A5F7F inactive_color=0xff1C1C1E width=6.0 &

# =========================================================
#  DR. MOSCOVIUM FISH COLOR SCHEME
# =========================================================
# Set Fish shell colors to match theme

# Syntax highlighting
set -g fish_color_normal D4C5B0
set -g fish_color_command 4A5F7F
set -g fish_color_keyword 4A5F7F
set -g fish_color_quote 6B7456
set -g fish_color_redirection 5A7A7A
set -g fish_color_end 5A7A7A
set -g fish_color_error B85450
set -g fish_color_param D4C5B0
set -g fish_color_comment 8E8E93
set -g fish_color_selection --background=454547
set -g fish_color_search_match --background=454547
set -g fish_color_operator C17A5F
set -g fish_color_escape C17A5F
set -g fish_color_autosuggestion 8E8E93

# Completion pager
set -g fish_pager_color_progress 8E8E93
set -g fish_pager_color_prefix 4A5F7F
set -g fish_pager_color_completion D4C5B0
set -g fish_pager_color_description 8E8E93
set -g fish_pager_color_selected_background --background=454547
set -g fish_pager_color_selected_prefix 5A7A7A
set -g fish_pager_color_selected_completion D4C5B0
set -g fish_pager_color_selected_description 8E8E93

# =========================================================
#  COLOR REFERENCE
# =========================================================
# 256-Color Codes (Corrected):
# 180 = Tan/Beige (closest to Cream #D4C5B0) - Directories
# 67  = Slate Blue (closest to Blue #4A5F7F) - Executables, Commands
# 66  = Muted Cyan (closest to Teal #5A7A7A) - Links, Redirection
# 131 = Muted Red (closest to Red #B85450) - Modified, Errors
# 101 = Olive/Khaki (closest to Olive #6B7456) - Added, Quotes
# 246 = Light Gray (closest to Gray #8E8E93) - Metadata, Comments
# 240 = Dark Gray - Punctuation, Ignored
#
# NOTE: Regular files (fi) left uncolored for clarity
# =========================================================
