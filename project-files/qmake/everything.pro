########################
#    everything.pro    #
########################
#  This Qt4/5 project  #
#  file will build all #
#  applications        #
########################

TEMPLATE = subdirs
CONFIG += ordered

##########################
# Linux/Unix             #
##########################

unix {
SUBDIRS  = \
../../thumbnailer-kde4 \
../../libembroidery-convert \
../../embroidermodder2 \

QMAKE_STRIP    = echo                       #Suppress strip errors "File format not recognized"
QMAKE_DEL_DIR += --ignore-fail-on-non-empty #Suppress rmdir errors "Directory not empty"

usrbin.path    = "/usr/bin"
usrbin.files   = "../debian/data/usr/bin/embroidermodder2"

libmime.path   = "/usr/lib/mime/packages"
libmime.files  = "../debian/data/usr/lib/mime/packages/embroidermodder2"

appregistry.path   = "/usr/share/application-registry"
appregistry.files  = "../debian/data/usr/share/application-registry/embroidermodder2.applications"

applications.path   = "/usr/share/applications"
applications.files  = "../debian/data/usr/share/applications/embroidermodder2.desktop"

doc.path   = "/usr/share/doc"
doc.files  = "../debian/data/usr/share/doc/embroidermodder2"

man.path   = "/usr/share/man/man1"
man.files  = "../debian/data/usr/share/man/man1/embroidermodder2.1.gz"

menu.path   = "/usr/share/menu"
menu.files  = "../debian/data/usr/share/menu/embroidermodder2"

mimexml.path   = "/usr/share/mime/application"
mimexml.files  = "../debian/data/usr/share/mime/application/x-embroidermodder.xml"

mimeinfo.path   = "/usr/share/mime-info"
mimeinfo.files  = "../debian/data/usr/share/mime-info/embroidermodder2.keys" \
                  "../debian/data/usr/share/mime-info/embroidermodder2.mime"

pixmaps.path   = "/usr/share/pixmaps"
pixmaps.files  = "../debian/data/usr/share/pixmaps/embroidermodder2.png"

INSTALLS += usrbin       \
            libmime      \
            appregistry  \
            applications \
            doc          \
            man          \
            menu         \
            mimexml      \
            mimeinfo     \
            pixmaps      \

}

##########################
# Windows                #
##########################

win32 {
SUBDIRS  = \
../../libembroidery-convert \
../../embroidermodder2 \

nullsoft.path = "/tmp"
nullsoft.files = ""
nullsoft.extra = "makensis ../nsis/embroidermodder-installer.nsi;"

INSTALLS += nullsoft

}

##########################
# Mac OSX                #
##########################

macx {
SUBDIRS  = \
../../libembroidery-convert \
../../embroidermodder2 \

dmgcreator.path = "/tmp"
dmgcreator.files = ""
dmgcreator.extra = ""

INSTALLS += dmgcreator

}
