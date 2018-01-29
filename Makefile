
TEST_DIR  := $(CURDIR)/t

CRAM_OPTS := --shell=zsh

itest: CRAM_OPTS += -i
itest: test

test:
	ZDOTDIR="$(TEST_DIR)" PROJECT="$(CURDIR)" cram $(CRAM_OPTS) $(TEST_DIR)

.PHONY: itest test
