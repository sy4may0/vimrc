python3 << EOF
import os
import sys

home = os.path.expanduser("~")
path = home + "/home/sy4may0/anaconda3/lib/python3.6/site-packages"
if not path in sys.path:
    sys.path.insert(0, path)

EOF
