#!/bin/bash

# ANSI color code for red
RED='\033[0;31m'
# ANSI color code to reset to default
NC='\033[0m' # No Color

echo -e "${RED}   _    ___ _____  __  __  ___  _   _    ____    _    ____ _____ _   _ ____  _____ ${NC}"
echo -e "${RED}  / \  |_ _|  __ \|  \/  |/ _ \| \ | |  / ___|  / \  |  _ \_   _| | | |  _ \| ____|${NC}"
echo -e "${RED} / _ \  | || |__) | |\/| | | | |  \| | | |     / _ \ | |_) || | | | | | |_) |  _|  ${NC}"
echo -e "${RED}/ ___ \ | ||  _  /| |  | | |_| | |\  | | |    / ___ \|  __/ | | | |_| |  _ <| |___ ${NC}"
echo -e "${RED}/_/   \_\___|_| \_\_|  |_|\___/|_| \_|  \____/_/   \_\_|    |_|  \___/|_| \_\_____|${NC}"
echo ""

sleep 2

# Killing interfering processes
echo "Killing interfering processes..."
sudo airmon-ng check kill
sleep 1

# Start monitoring mode
echo "Starting monitoring mode on wlan0..."
sudo airmon-ng start wlan0
sleep 1

# Scan for Wi-Fi networks
echo "Scanning for Wi-Fi networks..."
sleep 1

sudo airodump-ng wlan0mon

# Wait for user input to stop scanning and select BSSID
echo "Press Ctrl+C to stop the scan once you find the target network."
read -p "Enter the BSSID of the target network: " bssid
read -p "Enter the channel of the target network: " channel
read -p "Enter file name to should write captured:" fname



# Start capturing packets on the selected BSSID
echo "Capturing data packets on BSSID: $bssid..."
sudo airodump-ng -w $fname -c $channel --bssid $bssid   wlan0mon

echo "Packet capture started. Check the file 'capture' for the results."
