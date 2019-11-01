#/bin/bash

echo "Your NUTS Masternode Will be Updated To Latest Version Now" 
sudo apt-get -y install unzip
NUTS-cli stop
rm -rf /usr/local/bin/NUTS*
mkdir NUTSUpdated_3.0.0.0
cd NUTSUpdated_3.0.0.0
wget https://github.com/Nutscoin/wallet/releases/download/v3.0.0.0/NUTS-3.0.0.0-Daemon-Ubuntu_16.04.tar.gz
tar xzvf NUTS-3.0.0.0-Daemon-Ubuntu_16.04.tar.gz
mv NUTSd /usr/local/bin/NUTSd
mv NUTS-cli /usr/local/bin/NUTS-cli
chmod +x /usr/local/bin/NUTS*
rm -rf ~/.NUTS/blocks
rm -rf ~/.NUTS/chainstate
rm -rf ~/.NUTS/peers.dat
cd ~/.NUTS/
wget https://github.com/Nutscoin/wallet/releases/download/v3.0.0.0/bootstrap.zip
unzip bootstrap.zip
echo "addnode=206.189.93.175 add" >> NUTS.conf
echo "addnode=178.128.20.41 add" >> NUTS.conf
echo "addnode=159.65.134.250 add" >> NUTS.conf
echo "addnode=188.166.149.24 add" >> NUTS.conf
echo "addnode=157.230.58.7 add" >> NUTS.conf
echo "addnode=178.128.10.40 add" >> NUTS.conf

cd ..
cd NUTSUpdated_3.0.0.0
NUTSd -daemon
sleep 10
NUTS-cli addnode 206.189.93.175 onetry
NUTS-cli addnode 178.128.20.41 onetry
NUTS-cli addnode 159.65.134.250 onetry
NUTS-cli addnode 188.166.149.24 onetry
NUTS-cli addnode 157.230.58.7 onetry
NUTS-cli addnode 178.128.10.40  onetry

echo "Masternode Updated!"
echo "Please wait few minutes and start your Masternode again on your Local Wallet"