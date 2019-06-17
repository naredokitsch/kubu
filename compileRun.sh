#!/bin/bash

cobc -free -x -o main$1 $1 && ./main$1
