FROM alpine:3.10
#CMD ["/bin/ping", "10.0.2.70", "-c", "30"]
COPY entry.sh .
#RUN chmod +x entry.sh && ./entry.sh
RUN chmod +x entry.sh
ENTRYPOINT ["./entry.sh"]
