FROM ubuntu

RUN apt-get update 
RUN apt-get install curl wget bash vim git make ssh zip -y
RUN rm -rf /var/lib/apt/lists/*

#install golang

ENV GO_VERSION 1.8.6
ADD https://dl.google.com/go/go1.18.linux-amd64.tar.gz /
RUN tar -C /usr/local -vxzf /go1.18.linux-amd64.tar.gz
ENV PATH="/go/bin:/usr/local/go/bin:$PATH" 
ENV GOPATH /go:/go/src/app/_gopath

# Adding Dockertest components

RUN echo "#!/bin/bash\n" > /startscript.sh
RUN echo "mkdir github\n" >> /startscript.sh
RUN echo "cd github\n" >> /startscript.sh
RUN echo "git clone \$GITHUB\n" >> /startscript.sh
RUN echo "cd *\n" >> /startscript.sh
RUN echo "make dockertest\n" >> /startscript.sh
RUN chmod +x /startscript.sh

CMD /startscript.sh
