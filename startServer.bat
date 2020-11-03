@ECHO OFF
TITLE Server Startup
cls
taskkill /IM arma3server_x64.exe /F
taskkill /IM javaw.exe /F
ECHO Der Server startet ...
START C:\Users\admin\Desktop\SERVER\A3Master\arma3server_x64.exe -profiles=C:\Users\admin\Desktop\SERVER\A3Master -port=2302 -config=server.cfg -autoInit -cfg=basic.cfg -enableHT -bandwidthAlg=2 -servermod=@life_server;@extDB3
START C:\Users\admin\Desktop\SERVER\HeadlessClient\arma3server_x64.exe -profiles=C:\Users\admin\Desktop\SERVER\HeadlessClient -mod=@life_hc;@extDB3 -client -enableHT -connect=127.0.0.1 -name=hc_1
//TIMEOUT /T 15
//ECHO Starte MapClient

//START C:\Users\admin\Desktop\SERVER\MapClient\arma3server_x64.exe -profiles=C:\Users\admin\Desktop\SERVER\MapClient -mod=@map_hc -client -enableHT -connect=127.0.0.1 -name=hc_2

//START C:\Users\admin\Desktop\startAC.bat

EXIT