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

export-once () {
    case ":${PATH}:" in
        *:"$1":*)
            ;;
        *)
            export PATH="$1:$PATH"
            ;;
    esac
}

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
    export-once "$HOME/bin"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
    export-once "$HOME/.local/bin"
fi

if [ -d "$HOME/.cargo" ]; then
    . "$HOME/.cargo/env"
fi

go version 1>/dev/null 2>/dev/null && {
    export GOLIB="$HOME/.go"
    export GOPROJ="$HOME/coding/go"
    export GOPATH="$GOLIB:$GOPROJ"
    export-once "$GOLIB/bin"
}

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    export MOZ_ENABLE_WAYLAND=1
fi

if [ -d "$HOME/coding/scripts/common" ]; then
    export-once "$HOME/coding/scripts/common"
fi

if [ -d "$HOME/coding/scripts/backup" ]; then
    export-once "$HOME/coding/scripts/backup"
fi

if [ -d "$HOME/coding/scripts/remote" ]; then
    export-once "$HOME/coding/scripts/remote"
fi

if [ -d "$HOME/coding/scripts/station" ]; then
    export-once "$HOME/coding/scripts/station"
fi
