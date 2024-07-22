# Dotfiles

### Script to launch tmux for each terminal
Add it to ~/.zshrc
`if [ "$TMUX" = "" ]; then tmux new \; set-option destroy-unattached; fi`

