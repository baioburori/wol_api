FROM ruby:latest

WORKDIR /app
COPY app.rb /app/app.rb
RUN mkdir /app/response
COPY response/sample.json /app/response/sample.json


RUN gem install 'sinatra'
RUN gem install 'sinatra-contrib'
RUN gem install 'wol'

#RUN ["apt-get", "update"]
#RUN ["apt-get", "install", "-y", "vim"]

EXPOSE 80

CMD ["ruby", "app.rb", "-p", "80", "-o", "0.0.0.0"]

