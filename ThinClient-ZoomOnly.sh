# Unlock FS
fsunlock

# Remove comments from sources.list
sed -i '1,2 s/^##*//' /etc/apt/sources.list

# Update apt-get
sudo apt-get update

# Thin Client VDI Plugin
wget -O zoom_plugin.deb https://zoom.us/download/vdi/6.1.12.25370/zoomvdi-universal-plugin-thinpro_6.1.12.deb
chmod 755 zoom_plugin.deb
dpkg -i zoom_plugin.deb
rm zoom_plugin.deb

# Add comments back to sources.list
sed -i '1,2 s/^/#/' /etc/apt/sources.list

# Lock FS
fslock

# Remove script
rm ThinClient-ZoomOnly.sh
