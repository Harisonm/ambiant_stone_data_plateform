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

ENV GOOGLE_APPLICATION_CREDENTIALS=$GOOGLE_APPLICATION_CREDENTIALS
ENV TARGET=prod
ENV DBT_TYPE="service_account"

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y git
    
USER root

COPY . .

WORKDIR $DBT_PROJECT_DIR

ENV DBT_PROFILES_DIR profiles/big_query/

# RUN ["dbt", "deps"]
ENTRYPOINT ["dbt"]