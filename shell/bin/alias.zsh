if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  stty -ixon
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

alias showfigfonts='showfigfonts | less'
alias ptt="ssh bbsu@ptt.cc"

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias rmi='rm -i'
alias mv='mv -i'
alias vim='/usr/local/bin/vim'
alias v='vim'
alias ctg='cat $1 | grep "$2"'
alias llg='ls -alF | grep "$1"'

# alias pip3='python3 -m pip install'
# http://einverne.github.io/post/2017/04/pyenv.html
alias workon='pyenv activate'
alias deactivate='pyenv deactivate'

fb() {
  while :
  do
    fb-messenger-cli
    if [ $? -eq 0 ]; then
      break
    fi
  done
}

alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

search() {
  ack -i "$@"
}
# get request header to a website
headers() {
  curl -I $1
}

# tig
alias tis='tig status'
alias til='tig log'
alias tib='tig blame -C'

# history
alias h='history'
function hs
{
  history | grep $*
}

# base64
encode64() {
  if [[ $# -eq 0 ]]; then
    cat | base64
  else
    printf '%s' $1 | base64
  fi
}
decode64() {
  if [[ $# -eq 0 ]]; then
    cat | base64 --decode
  else
    printf '%s' $1 | base64 --decode
  fi
}
alias e64=encode64
alias d64=decode64

# for calculating checksum
alias checksum='shasum -a 256'
alias t='tmux'
alias ydl='youtube-dl'

# disk usage
alias dus='for i in G M K; do du -hsx * | grep "[0-9]$i\b" | sort -nr; done'

# for calendar
alias todo='vim $ZSH_CONFIG_ROOT/calendar/calendar.txt'
alias reload='source $HOME/.zshrc'

# encryption and decryption
encrypt() {
  openssl des3 -in $1 -out $1.enc
}
decrypt() {
  openssl des3 -d -in $1 -out $2
}

# generate random number
gen_password(){
  LC_CTYPE=C tr -dc "A-Za-z0-9_" < /dev/urandom | fold -w ${1} | head -n 2 | tail -n 1
}

# list connect ip on port
ls_connect_ip() {
  netstat -tn 2>/dev/null | grep :${1} | awk "{print $5}" | cut -d: -f1 | sort | uniq -c | sort -nr | head
}

# copy command output to copy board
copy() {
  eval "$@ | tee >(pbcopy)"
}

# cound words of a file and sort
count_words() {
  cat ${1} | tr -cs 'a-zA-Z \-' ' ' | awk '{$1=$1;print}' | tr ' ' '\n' | sort | uniq -c | sort -n -k 1
}

# command output to img
cmd2img() {
  eval '$@ | convert label:@- $(date -u +"%Y-%m-%dT%H.%M.%SZ").png'
}

alias trans='$ZSH_CONFIG_ROOT/trans/trans -shell -brief'
