Talk for linux deepin (Forked)
=============================

For install cross plateform
Install ActivePython as default python interpreter

Install ActivePython
-------------
download link http://www.activestate.com/activepython/downloads
after install you may config the activepython path

Install Sip
------------
cause of PyQt5 need the sip-4.15.5 or later so you need install this version by manual

Install QT5
--------------
download link http://qt-project.org/downloads
NOT recommand source install , it will waste a lot of time

after install config
'''
QMAKESPEC=/path to QT/Qt5.2.1/5.2.1/gcc_64/mkspecs/linux-g++
'''
and QT PATH

Install PyQt5
-------------
after download source code.
'''
python configure.py --qmake=/path to QT qmake/
make
make install # long time
'''

Install Xlib
-------------
I didn't find Xlib in pip repo or pypm repo.
use source code install direct.

Install other dependance
---------------
use pip or pypm will fix problem


My Computer environment
--------------
Ubuntu 12.04

EMail
--------------
lijianying12@gmail.com
