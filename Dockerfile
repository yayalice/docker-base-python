FROM python:2.7.11

# Get noninteractive frontend for Debian to avoid some install problems
ENV DEBIAN_FRONTEND noninteractive
ENV PYTHONUNBUFFERED 1

# OS Updates, python packages and postgres client
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get update \
 && apt-get upgrade -y

RUN apt-get install -y apt-utils
RUN apt-get install -y libssl-dev libffi-dev
RUN apt-get install -y nginx

# build dependencies for postgres
RUN apt-get install -y postgresql-client-9.5
RUN apt-get install -y python-psycopg2

RUN apt-get autoremove -y
RUN apt-get clean -y
