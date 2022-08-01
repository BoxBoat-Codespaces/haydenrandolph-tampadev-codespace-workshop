## A Codespaces showcase, quick and quirky

```
                                                                                
          &&&&&&                         &&&&&&                      
          &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&%                     
          &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&                     
          &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&                      
         &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&                    
        &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&                   
       &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&                  
       &&&&&&&&*..........................*&&&&&&&&                  
       &&&&&&*....     .............     ....&&&&&&                  
       &&&&&*.... ( ((( ........... ( ((( ....&&&&&                  
        &&&&&.... (((((............ ((((( ....&&&&#                  
.&&*     &&&&.....    ......*(.......    ....&&&&&     #&%           
           &&&&............(................&&&&                     
              &&&&&&.................../&&&&&                        
      &&&&             @@@@@@@@@@@@(                                 
     .   &#&         &&&&&&&&&&&&&&&&@                               
          &&&,&# .&&@&&&&&&&& &&&&&&&&                               
             &&&&&&&&&&& &&&& &&&& &&&                               
                    &&&& &&&& &&&& &&&                               
                    &&&& &&&& &&&& &&&                               
              ......&&&&.&&&&.&&&&.&&&....,,.                        
          ........./&&&,.&&&&.&&&&.&&&&,,........                    
         .........,,,,,..&&&..&&&&..,,,,...........                  
          ,.........*,,,.,,,,.,,,*.,,,...........                    
              ,.....,,,,.,,,,.,,,,.,,,.......                        


```


### Git and Devcontainers (Codespaces)

HTTPS with Git Credential manager should automatically be forwarded to the Codespace/Devcontainer. 

For ssh key configuration inside the container:

Linux
```bash
eval "$(ssh-agent -s)"
ssh-add $HOME/.ssh/id_rsa
docker ps
docker cp ~/.ssh/id_rsa <container id>:/home/vscode/.ssh
```

Windows
```powershell
# Make sure you're running as an Administrator
Set-Service ssh-agent -StartupType Automatic
Start-Service ssh-agent
Get-Service ssh-agent
ssh-add $HOME/.ssh/github_rsa
docker cp "$env.USERPROFILE"/.ssh/id_rsa <container id>:/home/vscode/.ssh
```

macOS
```
ssh-add $HOME/.ssh/github_rsa
```