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


# RUN addgroup --gid 1001 --system dbt_app && \
#     adduser --no-create-home --shell /bin/false --disabled-password --uid 1001 --system --group dbt_app

# Copy dbt project in the docker image to build
# COPY --chown=dbt_app:dbt_app $DBT_PROJECT_DIR .

# Use dbt_app to avoid permission issues
USER root

COPY $DBT_PROJECT_DIR .

WORKDIR $DBT_PROJECT_DIR

ENV DBT_PROFILES_DIR $DBT_PROJECT_DIR/profiles/big_query/
# Use root to avoid permission issues
# RUN dbt debug --target=$TARGET --profiles-dir profiles/big_query
RUN echo $GOOGLE_APPLICATION_CREDENTIALS > $DBT_PROJECT_DIR/profiles/big_query/gcloud-service-key.json