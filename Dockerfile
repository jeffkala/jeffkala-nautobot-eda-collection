FROM python:3.9

RUN apt-get update \
    && apt-get install sshpass -y \
    && apt-get install openjdk-17-jdk -y

ARG USER_ID=${USER_ID:-1001}
ARG DEVEL_COLLECTION_LIBRARY=0

COPY . /local
WORKDIR /local

USER 0
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64

# Install Python Poetry
RUN pip install --upgrade pip\
    && pip install poetry

# Install Packages from Poetry
RUN poetry config virtualenvs.create false \
    && poetry install --no-interaction --no-ansi

# Install Ansible Galaxy Requirements
RUN ansible-galaxy install -r requirements.yml

RUN bash -c "if [ $DEVEL_COLLECTION_LIBRARY -ne 0 ]; then \
    ansible-galaxy collection install git+https://github.com/ansible/event-driven-ansible.git --force; fi"
