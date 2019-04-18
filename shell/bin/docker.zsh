# docker
# https://github.com/tcnksm/docker-alias/blob/master/zshrc
# https://zaiste.net/removing_docker_containers/

# Get latest container ID
alias dl="docker ps -l -q"

# Get container process
alias dps="docker ps"

# Get process included stop container
alias dpa="docker ps -a"

# List all exited containers
alias dpa="docker ps -aq -f status=exited"

# Get images
alias di="docker images"

# Get container IP
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

# Run deamonized container, e.g., $dkd base /bin/echo hello
alias dkd="docker run -d -P"

# Run interactive container, e.g., $dki base /bin/bash
alias dki="docker run -i -t -P"

# Execute interactive container, e.g., $dex base /bin/bash
alias dex="docker exec -i -t"

# Execute interactive container with bash
dexb() { docker exec -i -t $1 bash }

# Stop all containers
alias dstall='docker stop $(docker ps -a -q)'

# Remove all containers
alias drmall='docker rm $(docker ps -a -q)'

# Stop and Remove all containers
alias drmfall='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

# Remove stopped containers
alias drmst="docker ps -aq --no-trunc -f status=exited | xargs docker rm"

# Remove containers created after a specific container
drmca() { docker ps --since $1 -q | xargs docker rm }

# Remove containers created before a specific container
drmcb() { docker ps --before $1 -q | xargs docker rm }

# Remove dangling/untagged images
alias drmid="docker images -q --filter dangling=true | xargs docker rmi"

# Remove all images
alias drmiall='docker rmi $(docker images -q)'

# Dockerfile build, e.g., $dbu tcnksm/test 
dbu() { docker build -t=$1 .; }

# Show all alias related docker
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }

# Bash into running container
dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }
