FROM alpine:latest AS docs

# Install python/pip
ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

RUN mkdir /mkdocs
WORKDIR /mkdocs
COPY mkdocs.yml mkdocs_requirements.txt requirements.txt ./
RUN pip3 install -r mkdocs_requirements.txt

ENTRYPOINT ["mkdocs", "serve", "--dev-addr", "0.0.0.0:8000"]
