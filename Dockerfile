FROM python:3.11-slim as base
WORKDIR /app
COPY requirements.txt .
RUN apt-get update && apt-get install -y --no-install-recommends build-essential
RUN pip install --no-cache-dir --target=/app/requirements -r requirements.txt

FROM python:3.11-slim
WORKDIR /app
COPY --from=base /app/requirements /usr/local/lib/python3.11/site-packages/
COPY . .
EXPOSE 8000
RUN useradd -m appuser
USER appuser
#CMD ["python", "-m", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8004"]
CMD [ "python", "app/main.py"]