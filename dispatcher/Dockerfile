FROM golang:1.18-alpine
RUN apk add --no-cache bash git
WORKDIR /root/go/src/github.com
RUN git clone https://github.com/scionproto/scion 
RUN cd scion && go build -o ./bin/ ./dispatcher/cmd/dispatcher && cp ./bin/dispatcher /root/dispatcher && echo "Built dispatcher"
CMD ["/root/dispatcher"]