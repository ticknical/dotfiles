##############################
# general aliases
##############################

alias ll="ls -al"

##############################
# docker compose up with 1Password injection
##############################

# `docker compose up` で、.env があり op が使える場合のみ1Passwordの秘匿情報を注入する
docker() {
    if [[ "$1 $2" == "compose up" && -f .env ]] && (( $+commands[op] )); then
        op run --env-file=.env -- docker "$@"
    else
        command docker "$@"
    fi
}
