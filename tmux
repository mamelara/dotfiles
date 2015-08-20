set-option -g prefix C-a
bind-key C-a send-prefix
set -g default-terminal "screen-256color"
set -g status-right '#(~/anaconda/lib/python2.7/site-packages/powerline tmux right)'
run-shell "powerline-daemon -q"
source "/Users/mariomelara/anaconda/lib/python2.7/site-packages/powerline/bindings/tmux/powerline.conf"
