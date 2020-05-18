#!/bin/bash
clear
echo "memulai service tools"
echo "klik ctrl+c jika sudah 4 detik"
sleep 1

ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R 80:localhost:4444 serveo.net 2> /dev/null > sendlink

