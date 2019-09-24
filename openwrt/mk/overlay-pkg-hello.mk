# NOTE: overlay feature is too tricky to get right and the build system has
# dropped support for it
#
# The gist is still here just for archive purposes
#
# To customize build behaviours, there are better cleaner ways
#
# - Edit directly the code at your hand and try pushing it to the mainstream if
#   you think the change can also benefit broadwide others.
# - or, create a feed of packages of your own and tell scripts/feeds to prefer
#   them instead of the original ones by using the "-p feedname" option.
#
#
#
# Demo for example usage of OpenWrt/LEDE BuildOverlay.
#
# Originally posted to lede-dev mailing list through a link to github gist:
# https://gist.github.com/yousong/1df4fcee324dd6b6095e6b551e2806a9
#
# The file needs to be named as $(PKG_DIR_NAME).mk and placed in a subdir of $(TOPDIR)/overlay/

# Place an empty line at the end of "pre" definition
define Package/hello/install/pre
	echo 'install/pre: $(1)'

endef

# Place an empty line at the begining of "post" definition
define Package/hello/install/post

	echo 'install/after: $(1)'
endef

# Store the original "install" definition to work around recursive expansion
# issue.  This is not necessary if only "post" hook is needed.
Package/hello/install/orig := $(Package/hello/install)

# backslash for line continuation won't work as it will prepend blank spaces
# to each line of recipes
#
#Package/hello/install=\
#	$(Package/hello/install/pre)\
#	$(Package/hello/install/orig)\
#	$(Package/hello/install/post)
#

Package/hello/install=$(Package/hello/install/pre)$(Package/hello/install/orig)$(Package/hello/install/post)
