#!/bin/bash

# start the vsftpd service in the background
service vsftpd start

# create a user 
adduser --gecos "" --disabled-password $FTP_USER

echo "$FTP_USER:$FTP_PASSWORD_USER" | chpasswd

# Create the ftp folder
mkdir -p /home/$FTP_USER/ftp

# set its ownership
chown -R $FTP_USER:$FTP_USER /home/$FTP_USER/ftp

# Remove write permissions
chmod a-w /home/$FTP_USER/ftp

# Configure vsftpd
# disables anonymous login to the FTP server
echo "anonymous_enable=NO" >> /etc/vsftpd.conf

# enables local user login
echo "local_enable=YES" >> /etc/vsftpd.conf

# enables write permissions for the FTP users.
echo "write_enable=YES" >> /etc/vsftpd.conf

# sets the chroot jail for local users to their home directory
echo "chroot_local_user=YES" >> /etc/vsftpd.conf

# enables the use of the userlist_file option
echo "userlist_enable=YES" >> /etc/vsftpd.conf

# sets the path to the userlist file
echo "userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf

# allows write access for local within their chroot jail
echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf

# appends the value of the FTP_USER variable to the userlist file.
echo "$FTP_USER" | tee -a /etc/vsftpd.userlist

# allow the users in  to connect in vsftpd 
echo "userlist_deny=NO" >> /etc/vsftpd.conf

# sets the minimum port for passive mode data connections
echo "pasv_min_port=40011" >> /etc/vsftpd.conf

# sets the maximum port for passive mode data connections
echo "pasv_max_port=40020" >> /etc/vsftpd.conf

# stop the service of vsftpd
service vsftpd stop

# start the vsftpd in foreground 
/usr/sbin/vsftpd /etc/vsftpd.conf