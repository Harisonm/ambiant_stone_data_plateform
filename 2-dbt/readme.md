# Demo DBT Project

## Macros

## Models

## Run

#!/bin/sh
dbt deps --profiles-dir profiles/big_query  # Pulls the most recent version of the dependencies listed in your packages.yml from git
dbt debug --target dev --profiles-dir profiles/big_query
dbt debug --target prod --profiles-dir profiles/big_query
dbt run --target prod --profiles-dir profiles/big_query
dbt test --data --target dev --profiles-dir profiles/big_query

# Run dbt from cloud run
gcloud beta run jobs execute ambiant-stone-dbt-p --region europe-west1 --args="run" --args="--profiles-dir" --args="profiles/big_query"

gcloud beta run jobs execute ambiant-stone-dbt-p --region europe-west1 --args="run"


### Resources from DBT:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

# Best Practice for DBT Architecture : 
- How we structure our dbt projects, [Why does structure matter?](https://docs.getdbt.com/guides/best-practices/how-we-structure/1-guide-overview)