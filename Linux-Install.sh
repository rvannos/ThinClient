# Thin Client VDI Plugin
wget https://zoom.us/download/vdi/5.17.5.24630/zoomvdi-universal-plugin-thinpro_5.17.5.deb
chmod 755 zoomvdi-universal-plugin-thinpro_5.17.5.deb
dpkg -i zoomvdi-universal-plugin-thinpro_5.17.5.deb
rm zoomvdi-universal-plugin-thinpro_5.17.5.deb

# PrinterLogic Pre-reqs
apt-get install --no-install-recommends --no-install-suggests -y \
  cups \
  libc-bin \
  libcups2 \
  libgssapi-krb5-2 \
  libtcl8.6 \
  libtk8.6 \
  libappindicator3-1 \
  libssl1.1 \
  net-tools
  
wget http://security.ubuntu.com/ubuntu/pool/main/libf/libffi/libffi6_3.2.1-8_amd64.deb
chmod 755 libffi6_3.2.1-8_amd64.deb
sudo dpkg -i libffi6_3.2.1-8_amd64.deb
sudo apt-get -f install
rm libffi6_3.2.1-8_amd64.deb

# PrinterLogic Client
wget https://printerlogic.printercloud.com/client/setup/printerinstallerclient_amd64.deb
chmod 755 printerinstallerclient_amd64.deb
sudo dpkg -i printerinstallerclient_amd64.deb
sudo apt-get -f install
rm printerinstallerclient_amd64.deb

sudo systemctl stop printer-installer-client
sudo killall -s SIGKILL PrinterInstallerClientService
sudo killall -s SIGKILL PrinterInstallerClientInterface
sudo killall -s SIGKILL PrinterLogicIdpAuthentication
sudo killall -s SIGKILL system_tray_icon
#If the device is configured as the Service Client, the commands below stop the additional services running.
sudo killall -s SIGKILL PrinterLogicServiceManager
sudo killall -s SIGKILL PrinterLogicServicePrinterApp
sudo killall -s SIGKILL PrinterLogicServiceIdentitySync
sudo killall -s SIGKILL PrinterLogicServiceSNMP
sudo killall -s SIGKILL PrinterLogicServiceOffNetworkClient
sudo killall -s SIGKILL PrinterLogicServiceOffNetworkServer

sudo sed -i 's/^\$EXE \&/LD_LIBRARY_PATH="$INSTALL_DIRECTORY\/service_interface\/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}" $EXE \&/' /writable/opt/PrinterInstallerClient/service_interface/run_service.sh

sudo systemctl start printer-installer-client

sudo /writable/opt/PrinterInstallerClient/bin/set_home_url.sh https alkeon.printercloud.com

sudo /writable/opt/PrinterInstallerClient/bin/use_authorization_code.sh 99dz5bf9
