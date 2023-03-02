FROM python:3.6-slim-buster

WORKDIR /app

RUN apt update -y \
    && apt install -y --no-install-recommends \
    && apt clean

COPY requirements.txt .

RUN pip install -U pip \
    && pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8011

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
