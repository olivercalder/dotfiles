# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

if [ -n "$SOURCED_PROFILE" ]; then
    return
fi

export SOURCED_PROFILE=1

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
    export PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.cargo" ] && [ -z "$(echo $PATH | grep ".cargo/bin")" ]; then
    source "$HOME/.cargo/env"
fi

go version 1>/dev/null 2>/dev/null && {
    export GOLIB="$HOME/.go"
    export PATH="$PATH:$GOLIB/bin"
    export GOPROJ="$HOME/coding/go"
    export GOPATH="$GOLIB:$GOPROJ"
}

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    export MOZ_ENABLE_WAYLAND=1
fi

if [ -d "$HOME/coding/scripts/common" ]; then
    export PATH="$HOME/coding/scripts/common:$PATH"
fi

if [ -d "$HOME/coding/scripts/backup" ]; then
    export PATH="$HOME/coding/scripts/backup:$PATH"
fi

if [ -d "$HOME/coding/scripts/remote" ]; then
    export PATH="$HOME/coding/scripts/remote:$PATH"
fi

if [ -d "$HOME/coding/scripts/station" ]; then
    export PATH="$HOME/coding/scripts/station:$PATH"
fi
