#!/bin/bash

amixer sget Master | awk -F"[][]" '/Left:/ { print $2 }'
