echo "1. Manually Install Chinese input method"
# Follow this page: http://www.pinyinjoe.com/linux/ubuntu-12-chinese-setup.htm
# The key takeaway is you'll need to logout and login again, after setting it up. Phew.
# The default username on Lubuntu Live Boot is "lubuntu", password is empty.
echo "Open Preference, then Language Support, then Add or Remove Language,"
echo "now choose your language to install."
echo

echo "2. Fix the black pop-up frame bug"
# Thanks to Sheng-Yao Tseng who shared his research literally 2 days ago (Jun 6, 2016)
# https://bugs.launchpad.net/ubuntu/+source/fcitx/+bug/1513571
sudo apt-get -y -q install qtdeclarative5-qtquick2-plugin && echo "... OK"
echo

echo "3. Now you will need to logout and login again with username $USER"
echo

# You man want to try some more tricks
# 10 things to do first in Lubuntu 16.04
# https://sites.google.com/site/easylinuxtipsproject/first-lubuntu
