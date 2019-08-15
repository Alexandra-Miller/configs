default:
	@echo "error: run 'make backup' or 'make restore' instead."

restore:
	./src/restore.sh

backup:
	./src/backup.sh
