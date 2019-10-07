FROM alpine:3.10

# First test, with Ping
#CMD ["/bin/ping", "10.0.2.70", "-c", "30"]

# Current version is based on a Bash script
COPY entry.sh .
RUN chmod +x entry.sh
ENTRYPOINT ["./entry.sh"]
