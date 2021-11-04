#!/bin/bash
chmod 644 /etc/yum.repos.d/CentOS-Base.repo
sed -i "s/8.0.1905/\$releasever/g" /etc/yum.repos.d/CentOS-Base.repo
yum install glibc-common -y
yum install wqy-*-fonts -y
yum groupinstall "Xfce" -y
yum install tigervnc-server xrdp ibus ibus-gtk2 ibus-gtk3 ibus-libpinyin im-chooser gtk2-immodule-xim gtk3-immodule-xim firefox -y
echo 'LANG=zh_CN.utf8' > /etc/locale.conf
source /etc/locale.conf
echo '#!/bin/bash' > ~/.Xclients
echo 'XFCE="$(which xfce4-session 2>/dev/null)"'  >> ~/.Xclients
echo 'exec "$XFCE"' >> ~/.Xclients
chmod +x /root/.Xclients && chkconfig xrdp on && service xrdp restart
systemctl set-default graphical.target
reboot
