#----------------------- general -------------------------------
set-option -g default-terminal 'xterm'
set-option -g default-shell /bin/zsh

set -g prefix2 C-a
bind C-a send prefix -2

set -g history-limit 5000

#reload config
bind r source-file ~/.tmux.conf \; display '~/.tmux.conf sourced'

#if 'which -s reattach-to-user-namespace' 'set -g default-command "exec initializing... 2> /dev/null & reattach-to-user-namespace $SHELL -l"'


# -- pane splitting -----------------
bind | split-window -h -c "#{pane_current_path}"
bind - split-window -v -c "#{pane_current_path}"
#bind v split-window -h
#bind C-v split-window -h
#
#bind s split-window -v
#bind C-v split-window -v

# ----- kill windows ---------------
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
#bind C-f command-prompt -p find-session 'switch-client -t %%'

# pane navigation
is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
  | grep -iqE '^[^TXZ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"

bind-key -n C-h if-shell "$is_vim" "send-keys C-h" "select-pane -L"
bind-key -n C-j if-shell "$is_vim" "send-keys C-j" "select-pane -D"
bind-key -n C-k if-shell "$is_vim" "send-keys C-k" "select-pane -U"
bind-key -n C-l if-shell "$is_vim" "send-keys C-l" "select-pane -R"
bind-key -n C-\ if-shell "$is_vim" "send-keys C-\\" "select-pane -l"
#bind -r h select-pane -L # left
#bind -r j select-pane -D # down
#bind -r k select-pane -U # up
#bind -r l select-pane -R # move right

bind > swap-pane -D
bind < swap-pane -U

# vi mode -------------------------------------------------------
set-window-option -g mode-keys vi


#max current pane
bind + run 'cut -c3- ~/.tmux.conf | sh -s maximize_pane'

bind -r H resize-pane -L 2
bind -r J resize-pane -D 2
bind -r K resize-pane -U 2
bind -r L resize-pane -R 2

# toggle mouse

bind m run "cut -c3- ~/.tmux.conf | sh -s toggle_mouse"

# copy to Mac OSX pasteboard
bind-key -T copy-mode-vi v send -X begin-selection
bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "pbcopy"
bind-key -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "pbcopy"
bind-key -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel "pbcopy"

# ----------------------- powerline bar ----------------------------
#source "/Users/mariomelara/Envs/v-python/lib/python2.7/site-packages/powerline/bindings/tmux/powerline.conf"
# Setting up tmux options
bind P paste-buffer
set-option -g mouse on

# TPM tmux plugin manager settings
set -g @plugin 'tmux-plugins/tpm'
# set -g @plugin 'tmux-plugins/tmux-sensible'
# set -g @plugin 'odedlaz/tmux-onedark-theme'

# set -g @plugin 'arcticicestudio/nord-tmux'

set -g @plugin 'egel/tmux-gruvbox'

run '~/.tmux/plugins/tpm/tpm'

# To install press prefix + I
# To uninstall press  prefix + alt + u
# To update prefix + U
