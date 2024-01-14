#ubuntu è un'alias di hub.docker.com/_/ubuntu
#FROM dice che la mia immagine partirà da questa
#22.04 è un tag, come fosse un id di un commit, è un puntatore ad un layer (ultimo step della build, cioè l'immagine)
FROM ubuntu:22.04

#RUN permette di eseguire comandi
#Per cacheare tutto insieme basta mettere tutto sulla stessa riga (oppure usare \)
RUN apt-get update && apt-get install -y \
    python3 \
    nodejs \
    git
#Qui di solito si fa pulizia, alla fine di ogni layer per evitare che vengano messi in cache file temporanei

#docker build
#docker run dockerImageName 
    #bisogna dare un comando di avvio che quando termina docker killa il container
    # se non si passa bisogna specificarlo nel file dockerfile con il comando CMD
    # Se il comando è interattivo bisogna specificare -it, perché in teoria dovresti avviare un demone e basta

#CMD viene eseguito quando viene istanziata un'immagine
CMD [ "/bin/bash" ]

#Copiare file da host a container
# Esempio: copio i sorgenti dall'host al container
# COPY file.txt /file.txt

#tutte le volte che qualcuno entra nel container eseguirà i comandi in questa folder
# WORKDIR /the/workdir/path