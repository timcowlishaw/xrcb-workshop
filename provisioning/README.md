# Provisioning instructions

  - Flash an SD card with a full raspbian stretch install
  - edit ./wpa_supplicant.conf with your username and password
  - Mount the SD card and run ./provision-sdcard.sh
  - Eject the card, put it in the pi, and boot
  - clone this repo to the pi users's home
  - run ./provision-pi.sh

