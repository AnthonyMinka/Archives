Install procedure:
	sudo apt-get update
	sudo apt-get install php5-curl php5-mcrypt
	# Add this in following file near other extension words: extension=php_curl.dll
	sudo gedit /etc/php5/apache2/php.ini
	sudo service apache2 restart
	sudo ln -s /etc/php5/conf.d/mcrypt.ini /etc/php5/mods-available
	sudo php5enmod mcrypt
	sudo service apache2 restart
	mkdir ~/phpVideoDownload
	wget "https://raw.githubusercontent.com/K-S-V/Scripts/master/AdobeHDS.php"
	mv AdobeHDS.php ~/phpVideoDownload
	cp download.sh ~/phpVideoDownload
	chmod +x ~/phpVideoDownload/download.sh
	chmod +x ~/phpVideoDownload/AdobeHDS.php

Usage procedure:
	# First argument is the amount of fragments, often 300, second argument is the partial link to the
	# fragment file, ex: http://ns5-vh.akamaihd.net/z/zeetv/93_160404003002.mp4/0_da3fc2b5b799e9ae_Seg1-Frag
	~/phpVideoDownload/download.sh X Y
	# First argument is the file name of the partial link to the fragments, ex: 0_da3fc2b5b799e9ae_Seg1-Frag
	~/phpVideoDownload/AdobeHDS.php Y
	# The file 0_da3fc2b5b799e9ae_Seg1-Frag.flv will be created, its the video file.
	# Dont forget to clean the files downloaded, or else you will have no more space :)
# Note: the video player VLC can view the videos.
