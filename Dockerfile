# Stage 1
FROM python:3.8-slim


WORKDIR /app


COPY . /app/


RUN apt-get update && apt-get install -y \
gcc \
python3-dev \
libmariadb-dev \
pkg-config


EXPOSE 3000


CMD ["python3", "-m", "http.server", "3000"]
