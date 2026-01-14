if [[ "$(uname -s)" == "Darwin" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -d "/home/linuxbrew/.linuxbrew" ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
