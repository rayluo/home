try:
    from urllib.request import urlopen  # Python 3
except:
    from urllib2 import urlopen  # Python 2
import sys

if len(sys.argv) < 2:
    sys.exit("Usage: %s url" % sys.argv[0])
print(urlopen(sys.argv[1]).read().decode('utf-8'))

