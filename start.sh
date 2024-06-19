#!/bin/bash

# Starte den SSH-Dienst
service ssh start

# Halte den Container am Laufen, um den Dienst aufrechtzuerhalten
tail -f /dev/null

