.PHONY: install uninstall help

INSTALL_PATH := /usr/local/bin
SCRIPT_NAME := ngreload
SCRIPT_PATH := bin/$(SCRIPT_NAME)

help:
	@echo "ngreload - Nginx configuration test and reload script"
	@echo ""
	@echo "Usage:"
	@echo "  make install          Install script to /usr/local/bin"
	@echo "  make install-local    Install script to ~/.local/bin"
	@echo "  make install-root     Install script to /root/bin"
	@echo "  make uninstall        Remove script from /usr/local/bin"
	@echo "  make uninstall-local  Remove script from ~/.local/bin"
	@echo "  make uninstall-root   Remove script from /root/bin"

check:
	@if [ ! -f "$(SCRIPT_PATH)" ]; then \
		echo "Error: $(SCRIPT_PATH) not found"; \
		exit 1; \
	fi
	@echo "✓ Script found: $(SCRIPT_PATH)"

install: check
	@echo "Installing $(SCRIPT_NAME) to $(INSTALL_PATH)..."
	sudo cp $(SCRIPT_PATH) $(INSTALL_PATH)/$(SCRIPT_NAME)
	sudo chmod +x $(INSTALL_PATH)/$(SCRIPT_NAME)
	@echo "✓ Installation complete. Try: $(SCRIPT_NAME)"

install-local: check
	@echo "Installing $(SCRIPT_NAME) to ~/.local/bin..."
	mkdir -p ~/.local/bin
	cp $(SCRIPT_PATH) ~/.local/bin/$(SCRIPT_NAME)
	chmod +x ~/.local/bin/$(SCRIPT_NAME)
	@echo "✓ Installation complete. Make sure ~/.local/bin is in your PATH"
	@echo "  Add to your shell profile if needed: export PATH=\"$$HOME/.local/bin:$$PATH\""

install-root: check
	@echo "Installing $(SCRIPT_NAME) to /root/bin..."
	sudo mkdir -p /root/bin
	sudo cp $(SCRIPT_PATH) /root/bin/$(SCRIPT_NAME)
	sudo chmod +x /root/bin/$(SCRIPT_NAME)
	@echo "✓ Installation complete."

uninstall:
	@echo "Removing $(SCRIPT_NAME) from $(INSTALL_PATH)..."
	sudo rm -f $(INSTALL_PATH)/$(SCRIPT_NAME)
	@echo "✓ Uninstall complete."

uninstall-local:
	@echo "Removing $(SCRIPT_NAME) from ~/.local/bin..."
	rm -f ~/.local/bin/$(SCRIPT_NAME)
	@echo "✓ Uninstall complete."

uninstall-root:
	@echo "Removing $(SCRIPT_NAME) from /root/bin..."
	sudo rm -f /root/bin/$(SCRIPT_NAME)
	@echo "✓ Uninstall complete."
