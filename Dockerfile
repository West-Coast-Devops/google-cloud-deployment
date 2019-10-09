FROM google/cloud-sdk:latest

# Install node
RUN echo 'y' | apt-get update && apt-get install -y curl software-properties-common
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs

# install kube-tpl-manager
RUN npm install -g kube-tpl-manager@1.0.1 --unsafe-perm

# configure service account file
ENTRYPOINT echo $GCP_SERVICE_ACCOUNT > /tmp/gcp_service_account.json && /bin/bash
