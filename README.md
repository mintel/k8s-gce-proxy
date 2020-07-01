# k8s-gce-proxy

Bundles [cloudsql-proxy](]https://github.com/GoogleCloudPlatform/cloudsql-proxy) with a few extra tools.

Be default the image waits 4 seconds before running commands passed to it, this can be overridden by setting the WAIT_TIME_SECONDS environment variable.

## Additional Tools

- https://www.busybox.net/
- https://github.com/banzaicloud/bank-vaults