#!/bin/bash

docker build -t apache_custom -f Task3.dockerfile .

docker run -d -p 8088:8088 --name apache_container apache_custom