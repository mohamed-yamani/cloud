# Install Apache ubuntu
apt-get install --quiet -y httpd httpd-devel

# Copy configuration file
cp httpd.conf /etc/httpd/conf/httpd.conf
cp httpd-vhosts.conf /etc/httpd/conf/httpd-vhosts.conf

# Start Apache and configure it to run at boot
# systemctl start httpd
service httpd start
chkconfig httpd on