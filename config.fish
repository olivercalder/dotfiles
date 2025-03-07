set -gx EDITOR vim
set -gx GOLIB "$HOME/.go"
set -gx GOPATH "$GOLIB"
fish_add_path --global --move ~/.local/bin ~/.cargo/bin "$GOPATH/bin" /snap/bin

if status is-interactive
    # Commands to run in interactive sessions can go here

    # Maybe use starship
    #starship init fish | source

    # Enable vim keybindings (this clobbers other bindings)
    set -g fish_key_bindings fish_vi_key_bindings

    # Emulates vim's cursor shape behavior
    # Set the normal and visual mode cursors to a block
    set fish_cursor_default block
    # Set the insert mode cursor to a line
    set fish_cursor_insert line
    # Set the replace mode cursors to an underscore
    set fish_cursor_replace_one underscore
    set fish_cursor_replace underscore
    # Set the external cursor to a block The external cursor appears when a command is started.
    # The cursor shape takes the value of fish_cursor_default when fish_cursor_external is not specified.
    set fish_cursor_external block
    # The following variable can be used to configure cursor shape in
    # visual mode, but due to fish_cursor_default, is redundant here
    set fish_cursor_visual block
end
