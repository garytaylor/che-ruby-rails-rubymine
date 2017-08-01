#!/bin/bash
Xvfb :1 -extension GLX -screen 0 1024x780x24& DISPLAY=:1 /usr/bin/openbox-session&
x11vnc -usepw -display :1
exit 0
