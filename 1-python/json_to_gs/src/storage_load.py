from google.cloud import storage
from pathlib import Path

BUCKET_NAME = "terraform-ambient-stone-394013"

ROOT_PATH = Path(__file__).parent
FILES = [ROOT_PATH / "customers.ndjson", ROOT_PATH / "shops.ndjson"]


def upload_data(bucket_name: str = BUCKET_NAME, files: Path = FILES):
    storage_client = storage.Client()

    bucket = storage_client.bucket(BUCKET_NAME)

    for file in files:
        file_blob = bucket.blob(f"data/{file.name}")
        file_blob.upload_from_filename(file)


if __name__ == "__main__":
    upload_data()
    print("Successfully uploaded data")
