awsmail-docker
==============

Postfix server configured to send mail to amazon.  Just add keys.

Usage
-----

Create the curent docker host as a mail relay host

     docker run -d --name mail -p 25:25 -e ID=myid -e KEY=mykey DOMAIN=mydomain.com deweysasser/awsmail

Setup a relay container for an e.g. jenkins container to use to send
mail to "mail:25":

     docker run -d --name mail -e ID=myid -e KEY=mykey DOMAIN=mydomain.com deweysasser/awsmail
     docker run -d --link mail:mail -p 8080:8080 jenkins

Mail Queue
----------

The mail queue is stored as a docker volume, so this is safe to
redeploy using 'docker-compose' or other volume preservation
techniques.