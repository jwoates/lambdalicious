FROM public.ecr.aws/lambda/ruby:3.2

COPY Gemfile Gemfile.lock ${LAMBDA_TASK_ROOT}/

RUN gem install bundler:2.4.20 && \
    bundle config set --local path 'vendor/bundle' && \
    bundle install

COPY app.rb ${LAMBDA_TASK_ROOT}/

CMD [ "app.App::Handler.process" ]
