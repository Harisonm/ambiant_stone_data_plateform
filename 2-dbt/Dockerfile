# temp stage
FROM python:3.11-slim AS builder

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dbt
ENV DBT_VERSION=1.1.1
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends gcc && \
    apt-get install -y git

RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"


RUN apt-get update -y && \
    apt-get upgrade -y

ENV DBT_DIR /src
WORKDIR $DBT_DIR
COPY src/requirements.txt .
RUN pip install -r requirements.txt

# final stage
FROM python:3.11-slim AS stage
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
RUN addgroup --gid 1001 --system dbt_app && \
    adduser --no-create-home --shell /bin/false --disabled-password --uid 1001 --system --group dbt_app

USER dbt_app

COPY --from=builder /opt/venv /opt/venv
# Set environment variables and working directory

ENV DBT_DIR /src
COPY --chown=dbt_app:dbt_app . .
WORKDIR $DBT_DIR
USER dbt_app

ENV DBT_PROFILES_DIR $DBT_DIR/profiles/big_query/

# Use root to avoid permission issues
# RUN dbt debug --target=$TARGET --profiles-dir profiles/big_query
RUN echo $GOOGLE_APPLICATION_CREDENTIALS > $DBT_DIR/profiles/big_query/gcloud-service-key.json

RUN mkdir -p target
RUN chown dbt_app:dbt_app -R $DBT_DIR/
RUN chmod -R 775 $DBT_DIR/

ENV PATH="/opt/venv/bin:$PATH"
RUN ["dbt", "deps"]
ENTRYPOINT ["dbt"]

