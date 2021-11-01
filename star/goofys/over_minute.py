#!/usr/bin/env python
 
import datetime
import sys

dt1 = datetime.datetime.strptime(sys.argv[1], '%Y%m%d%H%M%S')
dt2 = datetime.datetime.strptime(sys.argv[2], '%Y%m%d%H%M%S')
th_minute = int(sys.argv[3])

if (dt2-dt1).total_seconds()/60 > th_minute:
    print(1)
else:
    print(0)
