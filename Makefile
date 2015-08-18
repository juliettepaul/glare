NAME=glare
VERSION=0.0.3

DIRS=etc lib bin sbin share
INSTALL_DIRS=`find $(DIRS) -type d 2>/dev/null`
INSTALL_FILES=`find $(DIRS) -type f 2>/dev/null`

PKG_DIR=BUILD
PKG_NAME=$(NAME)-$(VERSION)
PKG=$(PKG_DIR)/$(PKG_NAME).tar.gz

PREFIX?=/usr/local

pkg:
	mkdir -p $(PKG_DIR)

$(PKG): pkg
	git archive --output=$(PKG) --prefix=$(PKG_NAME)/ HEAD

build: $(PKG)

clean:
	rm -f $(PKG)

all: $(PKG)

test:

tag:
	git tag v$(VERSION)
	git push --tags

release: $(PKG) tag

install:
	for file in $(INSTALL_FILES); do install -D $$file $(PREFIX)/$$file; done

uninstall:
	for file in $(INSTALL_FILES); do rm -f $(PREFIX)/$$file; done

.PHONY: build sign clean test tag release install uninstall all
