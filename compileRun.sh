#!/bin/bash

cobc -free -x -o main$1 $1.cob && ./main$1
