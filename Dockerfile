FROM ubuntu:18.04

RUN apt update
RUN apt-get install -y sudo
RUN apt-get install -y git

# add a default user
RUN adduser --disabled-password --gecos '' alexzam

#  Add new user alexzam to sudo group
RUN adduser alexzam sudo

# Ensure sudo group users are not asked for a password
# when using sudo command by ammending sudoers file
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER alexzam
WORKDIR /home/alexzam

RUN git clone https://github.com/alexiszamanidis/.ubuntu_bootstrap.git ~/.ubuntu_bootstrap

ENTRYPOINT bash ~/.ubuntu_bootstrap/scripts/install.sh -d
