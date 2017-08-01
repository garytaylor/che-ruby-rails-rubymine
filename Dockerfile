FROM eclipse/stack-base:ubuntu
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

RUN \curl -sSL https://get.rvm.io | bash -s stable
USER root
RUN apt-get install -y xvfb x11vnc openbox firefox
# Setup a password for vnc
RUN mkdir /.vnc
RUN x11vnc -storepasswd vncpassword ~/.vnc/passwd
# Expose default vnc port
EXPOSE 5900
# Add a script launching xvfb and x11vnc to supervisor configuration
RUN echo "[program:startxvfb]">> /etc/supervisor/conf.d/supervisord.conf
RUN echo "command=/bin/sh startXvfb.sh">> /etc/supervisor/conf.d/supervisord.conf
ADD startXvfb.sh startXvfb.sh        
        
WORKDIR /usr/local
RUN wget https://download.jetbrains.com/ruby/RubyMine-2017.2.tar.gz
RUN tar -xvzf RubyMine-2017.2.tar.gz
RUN rm RubyMine-2017.2.tar.gz
USER user
WORKDIR /projects
