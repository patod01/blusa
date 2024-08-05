#! /bin/bash

# no apto para ASH.
# arquitectura ARM comentada.

modo=$1
VER=$2
push=$3
user=patod01
app=bolsa

BUILDX_V="0.15.1"

if [ "$modo" = "install" ]; then
     echo Installando buildx en Docker!
     # install buildx
     echo mkdir -p ~/.docker/cli-plugins
     echo curl -SL https://github.com/docker/buildx/releases/download/v$BUILDX_V/buildx-v$BUILDX_V.linux-amd64 -o ~/.docker/cli-plugins/docker-buildx
     echo chmod a+x ~/.docker/cli-plugins/docker-buildx
     echo docker buildx create --driver=docker-container --name=slave
     echo Installacion terminada
elif [ "$modo" = "build" ] && [ -n "$VER" ]; then
     echo Compilando la version $VER
     # build commands
     echo docker buildx build --builder=slave --platform=linux/amd64 -t $user/$app:$VER-amd . --load
     # echo docker buildx build --builder=slave --platform=linux/arm64/v8 -t $user/$app:$VER-arm . --load
     echo compilacion terminada!
     if [ "$push" = "publish" ]; then
          echo Publicando imagenesssss
          # puslibh
          echo docker push $user/$app:$VER-amd
          # echo docker push $user/$app:$VER-arm
          echo docker manifest create $user/$app:$VER $user/$app:$VER-amd #$user/$app:$VER-arm
          echo docker manifest create $user/$app $user/$app:$VER-amd #$user/$app:$VER-arm
          echo docker manifest push $user/$app:$VER
          echo docker manifest push $user/$app
     fi
elif [ "$modo" = "publish" ] && [ -n "$VER" ]; then
     echo Publicando imagenes version $VER...
     # puslibh
     echo docker push $user/$app:$VER-amd
     # echo docker push $user/$app:$VER-arm
     echo docker manifest create $user/$app:$VER $user/$app:$VER-amd #$user/$app:$VER-arm
     echo docker manifest create $user/$app $user/$app:$VER-amd #$user/$app:$VER-arm
     echo docker manifest push $user/$app:$VER
     echo docker manifest push $user/$app
elif [ "$modo" = "--help" ] || [ "$modo" = "-h" ]; then
     echo Esta es una utilidad para construir los siguientes grupos de instrucciones:
     echo $'\n'
     echo - install: instalar \`buildx\`.
     echo - build: construir las imagenes de docker \(dos plataformas por defecto\).
     echo - publish: publicar a dockerhub.
     echo $'\n'
     echo Nota: Las instrucciones generadas no son ejecutadas automaticamente.
     echo $'\n'
     echo uso:
     echo build.sh install \| build VERSION [publish] \| publish VERSION
else
     echo lel
fi
