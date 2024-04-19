FROM python:3.8-alpine AS builder
RUN apk update && \
    apk add --no-cache gcc musl-dev libffi-dev openssl-dev && \
    pip install --upgrade pip

COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

FROM python:3.8-alpine
RUN apk add libpq
COPY --from=builder /usr/local/lib/python3.8/site-packages/ /usr/local/lib/python3.8/site-packages/
COPY --from=builder /usr/local/bin/ /usr/local/bin/
COPY . /app

ENV DJANGO_ALLOWED_HOSTS="*"
ENV DEVELOPMENT_MODE=False
ENV DEBUG=False

WORKDIR /app

EXPOSE 8000
RUN python manage.py collectstatic --no-input
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "--worker-tmp-dir", "/dev/shm", "mysite.wsgi"]