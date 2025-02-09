cd "$(dirname "$0")" 1>/dev/null
CURR_DIR="$(pwd)"
plugin_name='xxh-plugin-zsh-ohmyzsh-autols-fix'

export ZSH="$CURR_DIR/ohmyzsh"

if [[ -v ZSH_THEME ]]; then
  if [[ $XXH_VERBOSE == '2' ]]; then
    echo $plugin_name: Found ZSH_THEME=$ZSH_THEME
  fi
else
  if [[ $XXH_VERBOSE == '2' ]]; then
    echo $plugin_name: Set default ZSH_THEME=agnoster
  fi
  export ZSH_THEME="agnoster"
fi

if [[ -v plugins ]]; then
  if [[ $XXH_VERBOSE == '2' ]]; then
    echo $plugin_name: Found plugins=$plugins
  fi
else
  if [[ $XXH_VERBOSE == '2' ]]; then
    echo $plugin_name: Set default plugins=git
  fi
  export plugins=(git)
fi

export DISABLE_AUTO_UPDATE=true
source $CURR_DIR/ohmyzsh/oh-my-zsh.sh
autoload -U compinit && compinit
