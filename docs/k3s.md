# k3s

k3s release channels: https://update.k3s.io/v1-release/channels

Preferred minor version, e.g. `v1.28`

Other possible values: `latest`, `stable` or precise k3s version like `v1.28.2+k3s1`.

## Setup

```bash
export CHANNEL="v1.28"
export TOKEN=`openssl rand -hex 32`
```

## k3s-server

```bash
curl -sfL https://get.k3s.io | INSTALL_K3S_CHANNEL=${CHANNEL} sh -
```

### Config

```bash
# Generate k3s join token; recommended to do in advance

openssl rand -hex 32
```

```yaml
# /etc/rancher/k3s/config.yaml

token: <token>

write-kubeconfig-mode: "0600"

tls-san:
  - "<private network ip>"
  - "<public ip>"
  - "<cluster name>-0.k8s.vxm.cz"

# Cilium requirements
flannel-backend: none
disable-network-policy: true

disable:
  - servicelb
  - traefik
```

## k3s-agent

```bash
curl -sfL https://get.k3s.io | INSTALL_K3S_CHANNEL=${CHANNEL} K3S_URL=https://${CLUSTER_NAME}-0.k8s.vxm.cz:6443 K3S_TOKEN=${TOKEN} sh -
```
