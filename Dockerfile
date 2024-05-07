FROM ruby:3.3.1-alpine3.19

# Define custom function directory
ARG FUNCTION_DIR="/function"

# Install ruby
# RUN amazon-linux-extras install -y ruby3.2

# Install bundler
RUN gem install bundler

# Install the Runtime Interface Client
RUN gem install aws_lambda_ric

# Copy function code
RUN mkdir -p ${FUNCTION_DIR}
COPY app.rb ${FUNCTION_DIR}

WORKDIR ${FUNCTION_DIR}

ENTRYPOINT ["/usr/local/bin/aws_lambda_ric"]
CMD ["app.App::Handler.process"]
