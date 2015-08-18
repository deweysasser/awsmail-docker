FROM ubuntu:trusty
MAINTAINER Dewey Sasser <dewey@sasser.com>

######################################################################
# Configuration Section

# Allow mail from all private addresses by default for easy setup
#  while still being reasonably secure
ENV NETWORKS 127.0.0.0/8 10.0.0.0/8 172.16.0.0/12 192.168.0.0/16

# AWS credentials
ENV ID "put your aws ID here"
ENV KEY "put your aws secret here"

# Add a domain when none exists
ENV DOMAIN example.com

# We'll default to the us-east mail endpoint.  Feel free to substitute your own
ENV SES_ENDPOINT email-smtp.us-east-1.amazonaws.com

# End configuration
######################################################################

RUN apt-get update

# Set our system into the proper timezone, for convenience

RUN ln -sf /usr/share/zoneinfo/posixrules  /etc/localtime

RUN apt-get -y install ca-certificates

# For testing our mail configuration, try "date | mail -s testing
#  user@example.com"

RUN apt-get -y install mailutils telnet psmisc

# Most of the postscript configuration.  The parts that are dependent
#  on environment variables are actually in the 'run' script

RUN postconf -e 'smtp_sasl_auth_enable = yes'
RUN postconf -e 'smtp_sasl_password_maps = hash:/etc/postfix/sasl-passwords'
RUN postconf -e 'smtp_sasl_security_options = noanonymous'
RUN postconf -e 'smtp_use_tls = yes'
RUN postconf -e 'smtp_tls_security_level = encrypt'
RUN postconf -e 'smtp_tls_note_starttls_offer = yes'
RUN postconf -e 'smtp_tls_CAfile = /etc/ssl/certs/ca-certificates.crt'

EXPOSE 25
VOLUME /var/spool/postfix

COPY run /root/run
ENTRYPOINT ["/root/run"]


