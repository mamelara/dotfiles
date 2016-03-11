#----------------------- general -------------------------------
set -g default-terminal 'screen-256color'

set -g prefix2 C-a
bind C-a send prefix -2

set -g history-limit 5000

#reload config
bind r source-file ~/.tmux.conf \; display '~/.tmux.conf sourced'

if 'which -s reattach-to-user-namespace' 'set -g default-command "exec initializing... 2> /dev/null & reattach-to-user-namespace $SHELL -l"'

bind v split-window -h
bind C-v split-window -h

bind s split-window -v
bind C-v split-window -v

bind-key q kill-window
bind-key C-q kill-window

bind-key x kill-pane
bind-key C-x kill-pane

#---------------------- display -------------------------------
set -g base-index 1 # start with 1
setw -g pane-base-index 1 # make pane number consistent
setw -g automatic-rename on

set -g renumber-windows on

set -g set-titles on
set -g set-titles-string '#h ❐ #S ● #I #W'

set -g display-panes-time 800
set -g display-time 1000

set -g status-interval 10

#clock
setw -g clock-mode-style 24

# clear both screen and history
bind -n C-l send-keys C-l \; run 'tmux clear-history'

#activity
set -g monitor-activity on
set -g visual-activity off

# -- navigation ------------------------------------------------
bind C-f command-prompt -p find-session 'switch-client -t %%'

# pane navigation
bind -r h select-pane -L # left
bind -r j select-pane -D # down
bind -r k select-pane -U # up
bind -r l select-pane -R # move right

bind > swap-pane -D
bind < swap-pane -U


#max current pane
bind + run 'cut -c3- ~/.tmux.conf | sh -s maximize_pane'

bind -r H resize-pane -L 2
bind -r J resize-pane -D 2
bind -r K resize-pane -U 2
bind -r L resize-pane -R 2

# toggle mouse
setw -g mode-mouse on

bind m run "cut -c3- ~/.tmux.conf | sh -s toggle_mouse"

# copy to Mac OSX pasteboard
set-option -g default-command 'reattach-to-user-namespace -l bash'
#if -b 'which -s reattach-to-user-namespace' bind y run "tmux save-buffer - | reattach-to-user-namespace pbcopy"'

# ----------------------- powerline bar ----------------------------
source "/Users/mariomelara/Envs/v-python/lib/python2.7/site-packages/powerline/bindings/tmux/powerline.conf"
