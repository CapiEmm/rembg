FROM python:3.11-slim

WORKDIR /rembg

RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    libgomp1 \
    curl \
    git \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir rembg[cpu,cli]

RUN rembg d u2net

EXPOSE 7000

CMD ["rembg", "s", "--host", "0.0.0.0", "--port", "7000"]
