clean-files += Makefile.config

GLOBAL_CXXFLAGS += -Wno-deprecated-declarations

$(foreach i, config.h $(wildcard src/lib*/*.hh), \
  $(eval $(call install-file-in, $(i), $(includedir)/nix, 0644)))

$(GCH): src/libutil/util.hh config.h

GCH_CXXFLAGS = -I src/libutil


ifeq ($(MAKECMDGOALS), dist)
  dist-files += $(shell cat .dist-files)
endif

dist-files += configure config.h.in
dist-files += src/libexpr/parser-tab.cc src/libexpr/parser-tab.hh
dist-files += src/libexpr/lexer-tab.cc src/libexpr/lexer-tab.hh
