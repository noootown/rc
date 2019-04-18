IFS=$'\n' a=($(cat npmfile))
for i in $(seq ${#a[*]}); do
    npm install -g "${a[$i]}"
done
