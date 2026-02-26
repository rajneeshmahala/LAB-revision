.PHONY: install install-apt install-rpm detect

install: detect

detect:
	@if command -v apt >/dev/null 2>&1; then \
		$(MAKE) install-apt; \
	elif command -v dnf >/dev/null 2>&1; then \
		$(MAKE) install-rpm; \
	elif command -v yum >/dev/null 2>&1; then \
		$(MAKE) install-rpm; \
	else \
		echo "Unsupported package manager."; \
		exit 1; \
	fi

install-apt:
	sudo apt update -y
	sudo apt install -y vim
	@echo "Vim installed using APT"

install-rpm:
	sudo dnf install -y vim || sudo yum install -y vim
	@echo "Vim installed using RPM-based manager"