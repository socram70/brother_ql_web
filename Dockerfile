FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    poppler-utils \
    fonts-dejavu \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    poppler-utils \
    fonts-dejavu \
    fontconfig \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8013

CMD ["python", "run.py"]
