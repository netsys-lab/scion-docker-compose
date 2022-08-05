FROM golang:1.18-alpine
RUN apk add --no-cache bash git build-base
WORKDIR /root/go/src/github.com
RUN git clone https://github.com/scionproto/scion 
RUN cd scion && go build -o ./bin/ ./daemon/cmd/daemon && cp ./bin/daemon /root/daemon && echo "Built daemon"
RUN cd scion && go build -o ./bin/ ./dispatcher/cmd/dispatcher && cp ./bin/dispatcher /root/dispatcher && echo "Built dispatcher"
RUN cd scion && go build -o ./bin/ ./scion/cmd/scion && cp ./bin/scion /usr/bin/scion && echo "Built scion"
RUN cd scion && go build -o ./bin/ ./scion-pki/cmd/scion-pki && cp ./bin/scion-pki /usr/bin/scion-pki && echo "Built scion-pki"
RUN rm -rf /root/go
COPY run.sh /root/run.sh
RUN chmod +x /root/run.sh

CMD ["/root/run.sh"]
