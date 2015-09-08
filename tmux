#Set Tmux's default keystroke to C-Space
unbind C-b
set -g prefix C-Space
bind Space send-prefix

# Enter copy mode with Space
bind Space copy-mode
bind C-Space copy-mode

# Use this to get better colors in tmux
set -g default-terminal "screen-256color"

# Create a cleaner status bar
set -g status-bg blue 
set -g status-fg black
set -g status-left '#[fg=black]#S'
set-window-option -g window-status-current-bg yellow

unbind %
bind | split-window -h # Split horizontally with C-a |
bind - split-window -v # Split vertically with C-a -

set -g mode-mouse on
