sudo apt install direnv
cat << __bashrc__ >> $HOME/.bashrc

# added by direnv installer
export EDITOR=vi
eval "$(direnv hook bash)"
export DIRENV_WARN_TIMEOUT=86400s
__bashrc__
