FROM 554386539706.dkr.ecr.us-east-1.amazonaws.com/ruby-2.1:latest

ADD . /app

WORKDIR /app
RUN bundle install
RUN rake db:migrate RAILS_ENV=development

EXPOSE 3000

CMD ["rails", "server"]