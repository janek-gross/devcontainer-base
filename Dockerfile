FROM python:3.12-alpine

# Install packages using apk (Alpine’s package manager)
RUN apk add --no-cache \
    git \
    bash \
    sudo \
    shadow  # provides useradd, groupadd, etc.

# Create devcontainer user
RUN groupadd -r devcontainer && \
    useradd -r -g devcontainer -m -s /bin/bash devcontainer

# Give sudo privileges to evaluation user
RUN echo "evaluation ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/devcontainer
RUN chmod 0440 /etc/sudoers.d/devcontainer
SHELL ["/bin/bash", "-c"]


# Switch to evaluation user
USER devcontainer
WORKDIR /home/devcontainer
RUN python -m venv .venv
ENV PATH="/home/devcontainer/.venv/bin:$PATH"
COPY --chown=devcontainer:devcontainer requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN git config --global --add safe.directory /home/devcontainer/devcontainer-base
CMD ["sleep", "infinity"]