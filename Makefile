# Builds a mkdocs-enabled development server image
build-mkdocs:
	docker build -t mkdocs-server .

# Runs the mkdocs development server
docs: build-mkdocs
	docker run --rm -it --name mkdocs-server \
		--volume ${PWD}:/mkdocs \
		--publish 8000:8000 \
		mkdocs-server

clean:
	docker rmi mkdocs-server