# Unlock FS
fsunlock

# Remove comments from sources.list
sed -i '1,2 s/^##*//' /etc/apt/sources.list

# Update apt-get
sudo apt-get update

# Thin Client VDI Plugin
wget https://zoom.us/download/vdi/5.17.11.24850/zoomvdi-universal-plugin-ubuntu_5.17.11.deb
chmod 755 zoomvdi-universal-plugin-thinpro_5.17.11.deb
dpkg -i zoomvdi-universal-plugin-thinpro_5.17.11.deb
rm zoomvdi-universal-plugin-thinpro_5.17.11.deb

# Add comments back to sources.list
sed -i '1,2 s/^/#/' /etc/apt/sources.list

# Lock FS
fslock
