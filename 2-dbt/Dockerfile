FROM python:3.10.7-slim-buster AS builder

# set work directory
ENV APP_HOME /app
WORKDIR $APP_HOME
COPY 2-dbt ./
# allow statements and log message to immediately appear in the Knative logs
ENV PYTHONUNBUFFERED True
# Install production dependencies.
RUN pip install --no-cache-dir -r requirements.txt

FROM python:3.10.7-slim-buster
USER root
WORKDIR /dbt
COPY --from=builder /app ./
# install dependencies
RUN pip install --upgrade pip
COPY 2-dbt/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt
# copy project
COPY 2-dbt .
ARG GOOGLE_APPLICATION_CREDENTIALS
ENV GOOGLE_APPLICATION_CREDENTIALS=${GOOGLE_APPLICATION_CREDENTIALS}

RUN echo $GOOGLE_APPLICATION_CREDENTIALS > service-account.json
# RUN ["dbt", "deps"]
ENTRYPOINT ["dbt"]