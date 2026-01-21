#!/bin/bash

cliphist list | walker -d -H | cliphist decode | wl-copy
