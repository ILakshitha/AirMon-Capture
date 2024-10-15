#!/bin/bash

# Killing interfering processes
echo "Killing interfering processes..."
sudo airmon-ng check kill

# Start monitoring mode
echo "Starting monitoring mode on wlan0..."
sudo airmon-ng start wlan0

# Scan for Wi-Fi networks
echo "Scanning for Wi-Fi networks..."
sudo airodump-ng wlan0mon

# Wait for user input to stop scanning and select BSSID
echo "Press Ctrl+C to stop the scan once you find the target network."
read -p "Enter the BSSID of the target network: " bssid
read -p "Enter the channel of the target network: " channel
read -p "Enter file name to should write captured:" capture


# Start capturing packets on the selected BSSID
echo "Capturing data packets on BSSID: $bssid..."
sudo airodump-ng -w $capture -c $channel --bssid $bssid   wlan0mon

echo "Packet capture started. Check the file 'capture' for the results."
