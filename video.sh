#!/bin/bash
## Script para exibir tempo dos vídeos de vários subdiretórios

extensao='mp4'
caminho= "/home/marcos"

cd $caminho
# Encontrar todos os arquivos com extensão informada no diretório informado e ordenar por nome
lista=$(find . -maxdepth 2 -name "*.$extensao" | sort)

for arq in $lista; do
    # Obter informação da duração do arquivo em HH:MM:SS.centésimos
    tempo=$(avconv -i $arq 2>&1 | grep "Duration"| cut -d ' ' -f 4 | sed s/,//)
    # Imprimir nome do arquivo e duração
    echo $arq "-" $tempo
done
