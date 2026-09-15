@echo off
set HTTPS_PROXY=socks5h://127.0.0.1:65532
set HTTP_PROXY=socks5h://127.0.0.1:65532
set ALL_PROXY=socks5h://127.0.0.1:65532
set NO_PROXY=127.0.0.1,localhost,::1
start "" "C:\Users\24894\AppData\Local\Programs\antigravity\Antigravity.exe"
