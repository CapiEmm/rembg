FROM python:3.11-slim

WORKDIR /rembg

RUN pip install --no-cache-dir rembg[cpu,cli]

RUN rembg d u2net

EXPOSE 7000

CMD ["rembg", "s", "--host", "0.0.0.0", "--port", "7000"]
