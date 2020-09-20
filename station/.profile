# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	    . "$HOME/.bashrc"
    fi
fi

# if running zsh
if [ -n "$ZSH_VERSION" ]; then
    # include .zshrc if it exists
    if [ -f "$HOME/.zshrc" ]; then
        . "$HOME/.zshrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

rustup --version 1>/dev/null 2>/dev/null && [ -z "$(echo $PATH | grep ".cargo/bin")" ] && {
    source "$HOME/.cargo/env"
    export PATH="$HOME/.cargo/bin:$PATH"
}

go version 1>/dev/null 2>/dev/null && {
    export GOLIB="$HOME/.go"
    export PATH="$PATH:$GOLIB/bin"
    export GOPROJ="$HOME/coding/go"
    export GOPATH="$GOLIB:$GOPROJ"
}

if [[ $XDG_SESSION_TYPE == "wayland" ]]; then
    export MOZ_ENABLE_WAYLAND=1
fi

if [ -d "$HOME/coding/scripts/common" ]; then
    PATH="$HOME/coding/scripts/common:$PATH"
fi

if [ -d "$HOME/coding/scripts/backup" ]; then
    PATH="$HOME/coding/scripts/backup:$PATH"
fi

if [ -d "$HOME/coding/scripts/remote" ]; then
    PATH="$HOME/coding/scripts/remote:$PATH"
fi

if [ -d "$HOME/coding/scripts/pop" ]; then
    PATH="$HOME/coding/scripts/pop:$PATH"
fi

if [ -d "$HOME/coding/scripts/station" ]; then
    PATH="$HOME/coding/scripts/station:$PATH"
fi