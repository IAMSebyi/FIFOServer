FIFO_NAME="input"

mkfifo $FIFO_NAME

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

done
