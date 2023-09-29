# Run dbt

#!/bin/sh
dbt deps --profiles-dir profiles/big_query  # Pulls the most recent version of the dependencies listed in your packages.yml from git
dbt debug --target dev --profiles-dir profiles/big_query
dbt debug --target prod --profiles-dir profiles/big_query
dbt run --target prod --profiles-dir profiles/big_query
dbt test --data --target dev --profiles-dir profiles/big_query

# Run dbt from cloud run
gcloud beta run jobs execute ambiant-stone-dbt-p --region europe-west1 --args="run --profiles-dir "profiles/big_query""

gcloud beta run jobs execute ambiant-stone-dbt-p --region europe-west1 --args="run"