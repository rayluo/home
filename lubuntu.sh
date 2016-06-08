# 1. Install Chinese input method
# Follow this page: http://www.pinyinjoe.com/linux/ubuntu-12-chinese-setup.htm
# The key takeaway is you'll need to logout and login again, after setting it up. Phew.
# The default username on Lubuntu Live Boot is "lubuntu", password is empty.

# 2. Fix the black pop-up frame bug
# Thanks to Sheng-Yao Tseng who shared his research literally 2 days ago (Jun 6, 2016)
# https://bugs.launchpad.net/ubuntu/+source/fcitx/+bug/1513571
sudo apt-get install qtdeclarative5-qtquick2-plugin
