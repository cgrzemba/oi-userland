MAKE = /usr/bin/gmake
MAKECMDGOALS = publish
SRC = /code/github/oi-userland/i386/repo
DST = /var/tmp/packages-32.p5p

PKGS = library/brotli/32 \
	library/libsndfile/32 \
	audio/mpg123/32 \
	library/audio/pulseaudio/32 \
	library/brotli/32 \
	library/c++/harfbuzz/32 \
	library/pcre2/32 \
	library/sdl2/32 \
	x11/library/libxfont2/32	
#	compress/bzip/32 \
#	library/libffi/32 \
	
DIRS = library/libsndfile_32 \
	multimedia/mpg123_32 \
	desktop/pulseaudio_32 \
	library/brotli_32 \
	library/harfbuzz_32 \
	library/pcre2_32 \
	library/SDL2_32 \
	x11/libXfont2_32
#	archiver/bzip2_32 \
#	library/libffi_32 \

# STRIP_DIRS = $(strip $(DIRS))
# ifneq ($(STRIP_DIRS),)

# $(STRIP_DIRS):
# $(DIRS):
# 	$(MAKE) -C $@ $(MAKECMDGOALS)
# endif

DIRSPUB = $(addsuffix .pub, $(DIRS))

.PHONY: $(DIRS)

#$(DIRS):
#	$(MAKE) -C ./$@ $(MAKE) $(MAKECMDGOALS)
#	$(foreach dir, $(DIRS), $(call $(MAKE) -n -C ./$(dir) $(MAKECMDGOALS)))

define check_pkg
$(shell \
	echo $(1);
	diff -bwu $(1)/Makefile $(subst _32,,$(1))/Makefile)
endef

define publish_pkg
$(shell \
	cd $(1); \
	$(MAKE) $(MAKECMDGOALS))
endef

all:
	$(foreach dir, $(DIRS),$(info $(call check_pkg,$(dir))))
#	$(foreach dir, $(DIRS),$(info $(call publish_pkg,$(dir))))
	rm -f $(DST)
	pkgrecv -s $(SRC) -a -d $(DST) $(foreach p,$(PKGS),$(addsuffix @latest,$p))

print-%:
	echo $($@)

