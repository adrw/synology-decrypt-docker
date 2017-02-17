#!/bin/bash

# prepare ssh server
mkdir -p /var/run/sshd

# start up supervisord, all daemons should launched by supervisord.
/usr/bin/supervisord -c /root/supervisord.conf

mkdir ~/syno
cd ~/syno
wget http://global.download.synology.com/download/Tools/SynologyCloudSyncDecryptionTool/013/Linux/i686/SynologyCloudSyncDecryptionTool-013_x64.tar.gz
tar xvzf SynologyCloudSyncDecryptionTool-013_x64.tar.gz
bash -c 'echo "~/syno/SynologyCloudSyncDecryptionTool" >> /.bashrc'

# start a shell
/bin/bash
