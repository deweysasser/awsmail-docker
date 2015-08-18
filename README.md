awsmail-docker
==============

Postfix server configured to send mail to amazon.  Just add keys.

Usage
-----

Create the curent docker host as a mail relay host

     docker run -d --name mail -p 25:25 -e ID=myid -e KEY=mykey FROM=me@mydomain.com deweysasser/awsmail

Setup a relay container for an e.g. jenkins container to use

     docker run -d --name mail -e ID=myid -e KEY=mykey FROM=me@mydomain.com deweysasser/awsmail
     docker run -d --link mail:mail -p 8080:8080 jenkins