FROM eclipse/stack-base:ubuntu
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

RUN \curl -sSL https://get.rvm.io | bash -s stable
USER root
WORKDIR /usr/local
RUN wget https://download.jetbrains.com/ruby/RubyMine-2017.2.tar.gz
RUN tar -xvzf RubyMine-2017.2.tar.gz
USER user
WORKDIR /projects
