if status is-interactive
    # Commands to run in interactive sessions can go here
end

[ -f /opt/homebrew/share/autojump/autojump.fish ]; and source /opt/homebrew/share/autojump/autojump.fish

# vim keybinds
fish_hybrid_key_bindings

# aliases
alias vim="nvim"
alias ls="ls -laG"

set PATH /Users/rmehra/.cargo/bin $PATH

starship init fish | source
