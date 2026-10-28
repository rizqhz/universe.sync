world-set: set.sh
	@if [ ! -e /docker ]; then \
		echo -n "[!] preparing the docker root folder..."; \
		sudo ./${?} /docker >/dev/null && echo " \e[32m✔\e[m " || exit 1; \
		echo "    path: /docker (\e[32mCreated\e[0m)"; \
	else \
		echo "[!] docker root folder already exists"; \
		echo "    path: /docker (\e[32mSkipped\e[m)"; \
	fi
	@sudo docker compose up --detach

world-end: unset.sh
	@sudo docker compose down --volumes
	@if [ -e /docker ]; then \
		echo -n "[!] removing the docker root folder..."; \
		sudo ./${?} /docker >/dev/null && echo " \e[32m✔\e[m " || exit 1; \
		echo "    path: /docker (\e[32mRemoved\e[0m)"; \
	else \
		echo "[!] docker root folder already removed"; \
		echo "    path: /docker (\e[32mSkipped\e[m)"; \
	fi
