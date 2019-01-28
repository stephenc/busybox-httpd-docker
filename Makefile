APP_NAME=basic-http-server

.PHONY: clean
clean:
	docker rmi $(APP_NAME):latest

.PHONY: image
image: 
	docker build --tag $(APP_NAME):latest .

.PHONY: run
run: image
	docker run --rm -p 8080:80 -ti $(APP_NAME):latest