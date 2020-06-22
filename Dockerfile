FROM gcr.io/distroless/base

ARG BUILD_DATE
ARG VCS_REF


COPY --from=gcr.io/cloudsql-docker/gce-proxy:1.17 /cloud_sql_proxy /usr/local/bin/
COPY --from=banzaicloud/vault-env:1.3.2 /usr/local/bin/vault-env /usr/local/bin/
COPY --from=busybox /bin/busybox /bin
COPY --from=busybox /bin/busybox /bin/sh

ARG BUILD_DATE
ARG VCS_REF

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/mintel/k8s-gce-proxy.git" \
      org.label-schema.schema-version="1.0.0" \
      org.label-schema.name="k8s-gce-proxy" \
      org.label-schema.description="gce-proxy with addons such as busybox and vault-env" \
      org.label-schema.vendor="Mintel Group Ltd." \
      maintainer="Nick Badger <nbadger@mintel.com>"

RUN /bin/busybox --install /usr/bin && rm /bin/busybox /bin/sh
