#!/usr/bin/env bash

# Moves the latest screenshot file to a desired folder

SCREENSHOTS_DIR=/$HOME/Pictures/Screenshots
LATEST_SS=$(ls -Art $SCREENSHOTS_DIR | tail -n 1)
mv $SCREENSHOTS_DIR/$LATEST_SS $1
