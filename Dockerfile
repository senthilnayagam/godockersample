FROM tianon/true
EXPOSE 1337

COPY certs/ca-certificates.crt /etc/ssl/certs/
ADD main /

CMD ["/main"]
