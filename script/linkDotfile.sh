# config files

path=$(cd "$(dirname "$0")"; pwd)/..

linkarray=( "$path/vim/.vimrc $HOME/.vimrc"
            "$path/JetBrain/.ideavimrc $HOME/.ideavimrc"
            "$path/shell/.zshrc $HOME/.zshrc"
            "$path/shell/.tmux.conf $HOME/.tmux.conf"
            "$path/git/.czrc $HOME/.czrc"
            "$path/git/.gitconfig $HOME/.gitconfig"
            "$path/git/.gitignore_global $HOME/.gitignore_global")

set -f
for entry in "${linkarray[@]}"
do
    targets=( $entry )
    #eval will expand the tildes
    eval from=${targets[0]}
    eval to=${targets[1]}
        #if the target exists and is not a symlink, err on the side of caution
        if [ -e "$to" -a ! -L "$to" ]
        then
            echo "$to exists and is not a link, skipping..."
        else
            #probably safe to delete an existing symlink
            if [ -e "$to" ]
            then
                rm $to
            fi
            ln -s $from $to
        fi
done
