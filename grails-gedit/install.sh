#!/bin/sh

#Added directory structure verification
# Changes for ubuntu 11.04 Natty - gnome-shell

MIME_PACKAGES="/usr/share/mime/packages/"
GTKSOURCEVIEW="/usr/share/gtksourceview-3.0/language-specs/"
TAGLIST="/usr/share/gedit/plugins/taglist/"
BASH_COMPLETION="/etc/bash_completion.d"
PLUGINS="/usr/share/gedit/plugins/"
SNIPPETS="/usr/share/gedit/plugins/snippets/"
STYLES="/usr/share/gtksourceview-3.0/styles/"
SCRIPTS="/usr/local/bin/"


if [ ! -d $MIME_PACKAGES ]; then
	echo "$MIME_PACKAGES doesn't exist. Creating..."
	sudo mkdir $MIME_PACKAGES
fi

if [ ! -d $GTKSOURCEVIEW ]; then
	echo "$GTKSOURCEVIEW doesn't exist. Creating..."
	sudo mkdir $GTKSOURCEVIEW
fi

if [ ! -d $TAGLIST ]; then
	echo "$TAGLIST doesn't exist. Creating..."
	sudo mkdir $TAGLIST
fi

if [ ! -d $PLUGINS ]; then
	echo "$PLUGINS doesn't exist. Creating..."
	sudo mkdir $PLUGINS
fi

if [ ! -d $SNIPPETS ]; then
	echo "$SNIPPETS doesn't exist. Creating..."
	sudo mkdir $SNIPPETS
fi

#All directories should exist now, proceed with copy
sudo cp ./groovy-mime.xml $MIME_PACKAGES
sudo cp ./groovy.lang $GTKSOURCEVIEW
sudo chmod 777 $GTKSOURCEVIEW/groovy.lang

sudo cp ./gsp-mime.xml $MIME_PACKAGES
sudo cp ./gsp.lang $GTKSOURCEVIEW

sudo chmod 777 $GTKSOURCEVIEW/gsp.lang
sudo cp ./grails_commands $BASH_COMPLETION
sudo cp ./gred $SCRIPTS

sudo chmod +x /usr/local/bin/gred
sudo cp ./Grails.tags.gz $TAGLIST
sudo chmod 777 $TAGLIST/Grails.tags.gz

#copy the styles

sudo cp ./styles/*.xml $STYLES
sudo chmod 777 -R $STYLES

#copy the snippets xml files
sudo cp ./snippets/groovy.xml $SNIPPETS
sudo chmod 777 $SNIPPETS/groovy.xml
sudo chmod 777 $SNIPPETS/gsp.xml

sudo update-mime-database /usr/share/mime
