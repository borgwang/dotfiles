#!/bin/bash

# OS specific
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    echo "Linux setup"
    source linux-setup.sh
elif [[ "$OSTYPE" == "darwin*" ]]; then
    echo "macOS setup"
    source mac-setup.sh
else
    echo "Unknown OS"
fi
