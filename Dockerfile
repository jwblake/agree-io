FROM centos
MAINTAINER Jonathan Blake <jona.wayne.blake@gmail.com>

# Install Ruby 2.1.0
ADD install_ruby.sh /tmp/
RUN /tmp/install_ruby.sh

# Install Rubygems
RUN gem install "rubygems-update:<3.0.0" --no-document
RUN update_rubygems
