#Set Tmux's default keystroke to C-a
set-option -g prefix C-a
bind-key C-a send-prefix
unbind C-b
# Use this to get better colors in tmux
set -g default-terminal "screen-256color"

# Create a cleaner status bar
set -g status-bg blue 
set -g status-fg white
set -g status-left '#[fg=black]#S'
set-window-option -g window-status-current-bg yellow 

unbind %
bind | split-window -h # Split horizontally with C-a |
bind - split-window -v # Split vertically with C-a -

