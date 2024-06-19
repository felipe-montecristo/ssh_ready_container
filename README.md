# Docker Image: Ubuntu mit SSH Server

Dieses Docker-Image basiert auf Ubuntu und enthält einen SSH-Server, der beim Start des Containers automatisch gestartet wird. 
Es erstellt auch einen Benutzer `testuser` mit dem Passwort `password` und fügt ihn zur `sudo`-Gruppe hinzu.

### Docker Image bauen

Um das Docker-Image zu bauen, führen Sie den folgenden Befehl im Verzeichnis dieses Dockerfiles aus:

docker build -t mein-ubuntu-ssh .
