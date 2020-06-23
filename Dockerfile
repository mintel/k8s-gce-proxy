FROM busybox:1.31.1-glibc

ARG BUILD_DATE
ARG VCS_REF

COPY --from=gcr.io/cloudsql-docker/gce-proxy:1.17 /cloud_sql_proxy /usr/local/bin/
COPY --from=banzaicloud/vault-env:1.3.2 /usr/local/bin/vault-env /usr/local/bin/
COPY --from=gcr.io/distroless/base-debian10:nonroot /etc/ssl /etc/ssl

ARG BUILD_DATE
ARG VCS_REF

LABEL maintainer="Nick Badger <nbadger@mintel.com>" \
      org.opencontainers.image.title="k8s-gce-proxy" \
      org.opencontainers.image.description="gce-proxy with addons such as busybox and vault-env" \
      org.opencontainers.url="https://github.com/mintel/k8s-gce-proxy" \
      org.opencontainers.source="https://github.com/mintel/k8s-gce-proxy.git" \
      org.opencontainers.image.version="0.1.0" \
      org.opencontainers.image.vendor="Mintel Group Ltd." \
      org.opencontainers.image.licences="MIT" \
      org.opencontainers.authors="Nick Badger <nbadger@mintel.com>" \
      org.opencontainers.image.created="$BUILD_DATE" \
      org.opencontainers.image.revision="$VCS_REF"
