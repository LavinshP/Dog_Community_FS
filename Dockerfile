FROM mcr.microsoft.com/appsvc/python:latest

WORKDIR /app
ADD . /app
COPY ./requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt
COPY . /app
ENV PORT 8080
EXPOSE 8080

ENTRYPOINT ["gunicorn","-b", ":8080", "app:dog_community.wsgi"]