try:
    from urllib.request import urlopen  # Python 3
except:
    from urllib2 import urlopen  # Python 2
import sys

if len(sys.argv) < 3:
    sys.exit("Usage: %s url filename" % sys.argv[0])
raw = urlopen(sys.argv[1]).read()  # It is string in Python 2, bytes in Python 3
# print(raw)  # It won't work because Python 3 bytes result in a "b'...'" wrapper
              # Besides, print(...) subjects current console's locale.
# So we abandon the UNIX piping CLI tradition. We just dump it into a file as-is.
open(sys.argv[2], 'wb').write(raw)

