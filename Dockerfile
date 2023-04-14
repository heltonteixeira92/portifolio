FROM python:3.6-slim-buster

WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt update -y \
    && apt install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    wait-for-it \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir ./staticfiles

COPY requirements.txt .

RUN pip install -U pip &&\
    pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
