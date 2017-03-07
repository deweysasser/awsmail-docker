Release 1.0
============

* Merged in makelib for release controL

* Base dockerfile on debian:jessie for smaller image

* use Yelp's dumb-init process to make a nicer PID1

* Refactor run script primarily so configuration occurs once, not each startup

* change configured networks to use environment variable directly

* Fixed configuration bugs in run

* Put postconf commands on a single line to minimize docker layers

* Ensure that the run script is executable instead of relying on proper permissions in the local file system

* Working with fixed FROM address


