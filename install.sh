echo "Would you like to install the client or the server? (c/s)"
read opt

if [ $opt == "c" ]; then
    sudo curl "https://entrpix.me/devec/client.sh" -o /usr/local/bin/devec
    sudo chmod +x /usr/local/bin/devec
    exit
elif [ $opt == "s" ]; then
    sudo curl "https://entrpix.me/devec/server.sh" -o /usr/local/bin/devec-server
    sudo chmod +x /usr/local/bin/devec-server
    exit
else
    echo "Invalid option"
    exit
fi