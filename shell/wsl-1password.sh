# https://level69.net/archives/31056
export AUTH_SOCK="$HOME/.ssh/.ssh-auth-sock"
export SSH_AUTH_SOCK=$AUTH_SOCK
ALREADY_RUNNING=$(ps -auxww | grep -q "[n]piperelay.exe"; echo $?)
if [[ $ALREADY_RUNNING != "0" ]]; then
    if [[ -S $SSH_AUTH_SOCK ]]; then
        /usr/bin/rm $SSH_AUTH_SOCK
    fi
    (setsid socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:"/mnt/c/my_program_files/npiperelay/npiperelay.exe -s //./pipe/openssh-ssh-agent",nofork &) >/dev/null 2>&1
fi
