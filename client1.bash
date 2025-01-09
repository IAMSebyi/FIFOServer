CLIENT_PID=$$

cleanup() {

    clear
    rm "output$CLIENT_PID"
    echo "Program has stopped..."
    exit 0
}

trap cleanup SIGINT

echo $CLIENT_PID
clear

while true; do

    echo -n "Command: "
    read cmd

    if [[ $cmd == "exit" ]]; then

        cleanup
    fi

    if [[ $cmd == "clear" ]]; then

        clear
        continue
    fi

    if [[ $cmd == "help" ]]; then

        echo
        echo "clean"
        echo "exit"
        echo "[cmd] - linux command"
        echo
        continue
    fi

    echo "$CLIENT_PID: $cmd" >input

    fileName="output$CLIENT_PID"

    while [[ ! -e $fileName ]]; do

        A=1
    done

    cat <$fileName
    rm $fileName

done