@echo off
START warshield decrypt D:\theAccountant\app\data\data.json
echo Data Decrypted
pause
ruby D:\theAccountant\app\main.rb
pause
START warshield encrypt D:\theAccountant\app\data\data.json
echo "Data ecnrypted"
