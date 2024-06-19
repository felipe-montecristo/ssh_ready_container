# Verwende das offizielle Ubuntu-Image als Basis
FROM ubuntu:latest

# Installiere benötigte Pakete
RUN apt-get update && \
    apt-get install -y openssh-server sudo htop less && \
    rm -rf /var/lib/apt/lists/*

# Erstelle das Verzeichnis für den SSH-Daemon
RUN mkdir /var/run/sshd

# Setze ein Passwort für root (optional, hier wird 'root' verwendet)
RUN echo 'root:root' | chpasswd

# Erlaube root Login (optional)
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Erstelle einen Benutzer 'testuser' mit dem Passwort 'password' und füge ihn zur 'sudo'-Gruppe hinzu
RUN useradd -m -s /bin/bash testuser && \
    echo 'testuser:password' | chpasswd && \
    usermod -aG sudo testuser

# SSH Port
EXPOSE 22

# Kopiere das start.sh-Skript in den Container
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

# Starte den Container mit dem benutzerdefinierten Startskript
CMD ["/usr/local/bin/start.sh"]

