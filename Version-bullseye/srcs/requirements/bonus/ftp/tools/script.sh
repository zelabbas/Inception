#!/bin/bash

# Start the vsftpd (Very Secure FTP Daemon) service in the background
service vsftpd start

# Create a new FTP user without a password prompt and without additional info
adduser --gecos "" --disabled-password $FTP_USER

# Set the password for the newly created FTP user
echo "$FTP_USER:$FTP_PASSWORD_USER" | chpasswd

# Create an FTP directory for the user to store files
mkdir -p /home/$FTP_USER/ftp

# Set the ownership of the FTP directory to the new user
chown -R $FTP_USER:$FTP_USER /home/$FTP_USER/ftp
chmod -R 777 /home/$FTP_USER/ftp

# Configure vsftpd settings for secure FTP access

# Disable anonymous login to enhance security
echo "anonymous_enable=NO" >> /etc/vsftpd.conf

# Enable local user login to allow authenticated users access
echo "local_enable=YES" >> /etc/vsftpd.conf

# Allow FTP users to write files in their home directories
echo "write_enable=YES" >> /etc/vsftpd.conf

# Set the chroot jail for local users to their home directory for security
echo "chroot_local_user=YES" >> /etc/vsftpd.conf

# Enable the userlist feature to manage allowed users
echo "userlist_enable=YES" >> /etc/vsftpd.conf

# Specify the path for the userlist file
echo "userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf

# Allow write access for users within their chroot jail
echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf

# Add the FTP user to the userlist to allow them to connect
echo "$FTP_USER" | tee -a /etc/vsftpd.userlist

# Set userlist_deny to NO to allow users in the userlist to connect
echo "userlist_deny=NO" >> /etc/vsftpd.conf

# Define the minimum port for passive mode data connections
echo "pasv_min_port=40011" >> /etc/vsftpd.conf

# Define the maximum port for passive mode data connections
echo "pasv_max_port=40020" >> /etc/vsftpd.conf

# Stop the vsftpd service to apply the new configuration
service vsftpd stop

# Start vsftpd in the foreground to keep the container running
exec /usr/sbin/vsftpd /etc/vsftpd.conf
