#!/bin/bash
(xinput list-props 10 | grep 'Device Enabled' | grep -E ':\s0' > /dev/null) && xinput enable 10 || xinput disable 10
