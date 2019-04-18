# https://www.pureweber.com/article/git-pretty-output/
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias gcz='git cz'
alias gfwd='git log --reverse --pretty=%H master | grep -A 1 $(git rev-parse HEAD) | tail -n1 | xargs git checkout'
alias gpsu='git push --set-upstream origin $(git get-current-branch-name)'
