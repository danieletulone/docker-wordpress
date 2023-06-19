standard:
	docker compose up -d

theme:
	docker compose -f docker-compose.yml -f docker-compose.theme.yml up -d

stop:
	docker compose down 

clean:
	docker compose down -v