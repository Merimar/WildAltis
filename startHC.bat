@ECHO OFF
TITLE Server Startup
START C:\Users\admin\Desktop\SERVER\HeadlessClient\arma3server_x64.exe -profiles=C:\Users\admin\Desktop\SERVER\HeadlessClient -mod=@life_hc;@extDB3 -client -connect=127.0.0.1 -name=hc_1
EXIT