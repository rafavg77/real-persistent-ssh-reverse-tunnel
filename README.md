## Real Persistent SSH Tunnel 


###1.- Generate SSH Keys
```bash
  ssh-keygen -t rsa -C "Reverse Tunnel"
```
###2.- Copy your public key to your server in authorized_keys file
```bash
  ssh-rsa <public key> user@remote.server
```
###3.- Add permissions to the script
```bash
  chmod +x tunnelssh.sh
```  
###4.- Add a new line to your crontab:
```bash
  */1 * * * * /path/to/tunnessh.sh > /path/to/tunnessh.log 2>&1
```
###5.- In your remote server acces to the tunnel
```bash
  ssh -l <user> -p <port> localhost
```  
###6.- Enjoy

## License

###MIT Licence

Free Software Hell Yeah !! 
