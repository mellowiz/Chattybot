FROM arm32v6/alpine:3.10
COPY entry.sh .
RUN chmod +x entry.sh
ENTRYPOINT ["./entry.sh"]
