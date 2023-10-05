FROM  ghcr.io/dbt-labs/dbt-bigquery:latest

# define in docker build
ARG BQ_PROJECT_ID
ARG BQ_DATASET
ARG DBT_PROJECT_DIR
ARG GOOGLE_APPLICATION_CREDENTIALS

ENV DBT_PROJECT_DIR=$DBT_PROJECT_DIR
ENV BQ_PROJECT_ID=$BQ_PROJECT_ID
ENV BQ_DATASET=$BQ_DATASET

# default env values, can be overridden
ENV BQ_LOCATION="europe-west1"
ENV TARGET=prod

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y git


ENV GOOGLE_APPLICATION_CREDENTIALS=/usr/app/gcp-service-account.json
ENV TARGET=prod

USER root

# Copy dbt project in the docker image to build
COPY . /usr/app/

ENV DBT_PROFILES_DIR dbt/profiles/big_query/

# Use root to avoid permission issues
USER root