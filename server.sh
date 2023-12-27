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

# Checks if Python3 is installed
if ! command -v git &> /dev/null
then
    echo "It appears that Python3 is not installed."
    exit
fi

# Starts the server
python3 -m http.server $(cat $PORT) > $LOG 2>&1 &