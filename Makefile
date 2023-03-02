help:
	@echo "commands:"
	@echo "make env:	Create env file"
	@echo "make run		Run django local server"

env:
	cp contrib/env-sample .env

run:
	docker run --rm --name portifolio_container --env-file=.env -p 8000:8000 portifolio
