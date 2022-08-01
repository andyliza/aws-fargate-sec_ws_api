ARG ACCOUNT_ID
FROM $ACCOUNT_ID.dkr.ecr.ap-southeast-1.amazonaws.com/ws-base-image:latest
COPY . .
RUN apt update && apt install ncat -y
EXPOSE 443

RUN apt install software-properties-common -y
RUN apt update
RUN apt install -y python3-pip
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
COPY . .
COPY nginx.conf /etc/nginx
RUN chmod +x ./start.sh
CMD ["./start.sh"]
