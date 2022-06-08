ARG VARIANT="ubuntu-22.04"
FROM mcr.microsoft.com/vscode/devcontainers/cpp:0-${VARIANT}

LABEL maintainer="https://github.com/ibis-hdl"

ENV AGENT_TOOLSDIRECTORY=/opt/hostedtoolcache
RUN mkdir -p /opt/hostedtoolcache

# https://github.com/actions/runner/releases
ARG GH_RUNNER_VERSION="2.292.0"

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

WORKDIR /actions-runner
COPY scripts/install_actions.sh /actions-runner

RUN apt-get update \
  && apt-get -y install --no-install-recommends ccache g++-11 clang-14 doxygen graphviz gettext \
  && chmod +x /actions-runner/install_actions.sh \
  && /actions-runner/install_actions.sh ${GH_RUNNER_VERSION} \
  && rm /actions-runner/install_actions.sh

COPY scripts/token.sh scripts/entrypoint.sh /
RUN chmod +x /token.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["./bin/Runner.Listener", "run", "--startuptype", "service"]
