#! /bin/bash

# Utilidad para correr la imagen de docker.

docker run --rm -it \
--name mac \
-p 8080:10011 \
bolsa \
$1
