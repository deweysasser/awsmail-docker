IMAGE=deweysasser/awsmail

image:
	docker build -t $(IMAGE) .

readme: README.html

README.html: README.md
	markdown $? > $@
