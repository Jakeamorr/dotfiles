ZSH_DISABLE_COMPFIX="true"

if [ $(uname -s) = "Darwin" ]; then
	export NVM_DIR="$HOME/.nvm"
	    [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
	    [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
fi

source $ZDOTDIR/zshrc

