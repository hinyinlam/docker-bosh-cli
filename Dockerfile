FROM ubuntu:14.04
MAINTAINER Hin Lam (hlam@pivotal.io)
USER root
RUN apt-get update && apt-get install -y build-essential\
   				         ruby\   
   				         ruby-dev\
				         libxml2-dev\
				         libsqlite3-dev\
				         libxslt1-dev\
				         libpq-dev\
				         libmysqlclient-dev\
					 git-core\
					 curl\
					 libxslt-dev\
					 zlib1g-dev\
					 openssl\
					 libssl-dev\
					 wget
RUN git clone git://github.com/sstephenson/rbenv.git /root/.rbenv
RUN echo 'export PATH="/root/.rbenv/bin:$PATH"' >> /root/.bash_profile
RUN echo 'eval "$(rbenv init -)"' >> /root/.bash_profile
RUN echo 'source /root/.bash_profile' >> /root/.bashrc #make sure non-login bash load everything like interactive session
WORKDIR /root/
RUN wget -O /root/ruby-2.1.2.tar.gz http://ftp.ruby-lang.org/pub/ruby/2.1/ruby-2.1.2.tar.gz
RUN tar -C /root -zxvf /root/ruby-2.1.2.tar.gz
WORKDIR /root/ruby-2.1.2
RUN ./configure --prefix=/root/.rbenv/versions/2.1.2/
RUN make && make install 
#ToDo: Any way to source .bash_profile when run in non-interactive mode?
ENV PATH="/root/.rbenv/bin:$PATH"
RUN /bin/bash -c "source /root/.bash_profile && rbenv global 2.1.2\
&& gem pristine rake \
&& rbenv rehash \
&& gem update --system \
&& gem install bundler \
&& rbenv rehash \
&& gem install bosh_cli bosh_cli_plugin_micro bosh_cli_plugin_aws"

WORKDIR /root/
ENTRYPOINT /bin/bash
