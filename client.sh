# Configuration
CONFIG_DIR=/home/$USER/.config/devec
PORT=$CONFIG_DIR/port
HOST=$CONFIG_DIR/host
LOG=$CONFIG_DIR/log

# Default values
DEFAULT_PORT=3971
DEFAULT_HOST=127.0.0.1

# Checks if the config exists
mkdir -p $CONFIG_DIR

if [ ! -f $PORT ]; then
    echo $DEFAULT_PORT > $PORT
fi

if [ ! -f $HOST ]; then
    echo $DEFAULT_HOST > $HOST
fi

if [ ! -f $LOG ]; then
    touch $LOG
fi

# Send and recive messages
loop() {
    echo "Would you like to send a message? (y/n)"
    read opt

    if [ $opt == "y" ]; then
        echo "Enter Message: "
        read msg
        echo "$msg" > /dev/tcp/$(cat $HOST)/$(cat $PORT)
        cat $LOG

    elif [ $opt == "n" ]; then
        cat $LOG

    else
        cat $LOG
    fi
}

# Main loop
while true; do
    loop
    sleep 1
done
