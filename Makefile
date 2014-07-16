# Makefile for deriving various sintel encodings.
#
SRCDIR := /data/media.xiph.org/sintel/sintel-4k-png16

PNGS := $(notdir $(wildcard $(SRCDIR)/*.png))

all:
	@echo $(PNGS)

1280-png: $(addprefix 1280-png/,$(PNGS))

1280-png/%.png: $(SRCDIR)/%.png
	mkdir -p $(dir $@)
	convert $< -alpha off -depth 16 -gamma 0.454545454545454545 \
	  -scale 1280 -gamma 2.2 $@
