FROM python:3.10
ENV PYTHONUNBUFFERED 1
WORKDIR /app
ADD . /app
COPY ./requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt
COPY . /app
ENV PORT 8080
EXPOSE 8080

ENTRYPOINT ["gunicorn", "-b", ":8080", "application:app"]