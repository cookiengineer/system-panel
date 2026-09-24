.PHONY: build install uninstall clean run

BINARY := system-panel
GO := go
PREFIX := /usr

build:
	$(GO) build -o $(BINARY) .

install: build
	install -Dm755 $(BINARY) $(DESTDIR)$(PREFIX)/bin/$(BINARY)
	install -Dm644 assets/system-panel.desktop $(DESTDIR)$(PREFIX)/share/applications/system-panel.desktop

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/$(BINARY)
	rm -f $(DESTDIR)$(PREFIX)/share/applications/system-panel.desktop

clean:
	rm -f $(APP_NAME)

run: build
	./$(APP_NAME)
