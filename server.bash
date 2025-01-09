FIFO_NAME="input"

mkfifo $FIFO_NAME

cleanup() {

    clear
    rm input
    echo "Program has stopped..."
    exit 0
}

trap cleanup SIGINT

clear

while true; do

    echo "Waiting for data..."

    data=$(cat ./input)
    len=${#data}

    PID=""
    cmd=""
    
    i=0
    while true; do

        ch=${data:i:1}

        if [[ $ch == ":" ]]; then

            break
        fi

        PID="$PID$ch"
        i=$((i+1))

    done

    i=$((i+2))

    while true; do

        ch=${data:i:1}
        cmd="$cmd$ch"

        if [[ $i -eq $len ]]; then

            break
        fi

        i=$((i+1))

    done

    # echo $PID
    # echo $cmd

    fileName="output$PID"

    mkfifo $fileName

    if command -v $cmd &> /dev/null; then
        echo "$(man $cmd)" >$fileName
    else
        echo "Command does not exist" >$fileName
    fi

done