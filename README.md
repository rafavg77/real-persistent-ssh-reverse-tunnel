ssh tunnel real persistent


1.- Generate SSH Keys

  ssh-keygen -t rsa -C "Reverse Tunnel"

2.- Copy your public key to your server in authorized_keys file

  ssh-rsa <public key> user@remote.server

3.- Add permissions to the script
  
  chmod +x tunnelssh.sh
  
4.- Add a new line to your crontab:

  */1 * * * * /path/to/tunnessh.sh > /path/to/tunnessh.log 2>&1

5.- In your remote server acces to the tunnel

  ssh -l <user> -p <port> localhost
  
6.- Enjoy
