#!/bin/bash
archivo=main
borrartemporales(){
  echo "Eliminando archivos temporales"
  rm -f $archivo.aux
  rm -f $archivo.bbl
  rm -f $archivo.blg
  rm -f $archivo.glg
  rm -f $archivo.glo
  rm -f $archivo.gls
  rm -f $archivo.glsdefs
  rm -f $archivo.ist
  rm -f $archivo.lal
  rm -f $archivo.lol
  rm -f $archivo.loc
  rm -f $archivo.loi
  rm -f $archivo.lod
  rm -f $archivo.loq
  rm -f $archivo.out
  rm -f $archivo.toc
  rm -f $archivo.log
  rm -f $archivo.synctex.gz
  rm -f $archivo.dvi
  rm -f $archivo.brf
  rm -f $archivo.lon
  rm -f $archivo.ptc
  rm -f $archivo.idx
  rm -f $archivo.bcf
  rm -f $archivo.run.xml
  rm -f $archivo.ilg
  rm -f $archivo.ind
}
pause(){
  read -p "Presione una tecla para continuar..."
}

if [ ! -f $archivo.tex ]; then
  echo "Archivo $archivo.tex no existe"
  pause
  exit
fi

pdflatex -synctex=1 -interaction=nonstopmode $archivo
makeindex main.idx -s StyleInd.ist
biber main
pdflatex -synctex=1 -interaction=nonstopmode $archivo
pdflatex -synctex=1 -interaction=nonstopmode $archivo
borrartemporales