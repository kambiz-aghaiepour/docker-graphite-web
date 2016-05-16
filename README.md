# docker-graphite-web

centos7 based docker image for graphite-web

Suitable for collecting data via collectd, typical usage would be to start with external volume, e.g.:

```
docker run -d \
--name graphite-web \
-p 8080:80 \
-v /data/carbon/whisper:/var/lib/carbon/whisper \
kambiz/graphite-web:0.9.15
```
