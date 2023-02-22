FROM python:3.7

RUN apt-get update && apt-get install sshpass -y

COPY . /local
WORKDIR /local

# Install Python Poetry
RUN pip install --upgrade pip\
    && pip install poetry

# Install Packages from Poetry
RUN poetry config virtualenvs.create false \
    && poetry install --no-interaction --no-ansi

# Install Ansible Galaxy Requirements
RUN ansible-galaxy install -r requirements.yml
