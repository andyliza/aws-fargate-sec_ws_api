FROM 394576591249.dkr.ecr.ap-southeast-1.amazonaws.com/ws-base-image:latest
COPY . .
RUN apt update && apt install ncat -y
EXPOSE 443

RUN apt install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa -y
RUN apt update
RUN apt install python3.7 -y
RUN apt-get install -y python3.7-dev
RUN apt install -y python3-pip
# RUN apt-get install -y libxml2-dev
# RUN apt-get install -y libxslt1-dev 
# RUN apt-get -y install uwsgi-plugin-python3
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
COPY . .
COPY nginx.conf /etc/nginx
RUN chmod +x ./start.sh
CMD ["./start.sh"]

# CMD ["pdig", "-a", "./init.sh"]
