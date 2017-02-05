FROM tray/java:8-jre

RUN /usr/bin/curl -L https://s3-us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_latest.tar.gz | /bin/tar xz

# Add VOLUME to allow backup of databases
VOLUME ["/var/dynamodb_local"]

ENTRYPOINT ["/opt/jdk/bin/java", "-Djava.library.path=./DynamoDBLocal_lib", "-jar", "DynamoDBLocal.jar", "-dbPath", "/var/dynamodb_local"]

CMD ["-port", "8000"]