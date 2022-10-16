# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
command -qv nvim && alias vim nvim

if type -q exa
  alias ll "exa -l -g --icons"
  alias lla "ll -a"
end

set -gx EDITOR nvim


if status is-interactive
    # Commands to run in interactive sessions can go here
end

