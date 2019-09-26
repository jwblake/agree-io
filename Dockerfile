FROM 554386539706.dkr.ecr.us-east-1.amazonaws.com/ruby-2.1:latest

ADD . /app

WORKDIR /app
RUN bundle install

EXPOSE 3000

CMD ["rails", "server"]