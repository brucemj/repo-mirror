date
#+-------------------------------
CWD_GG=`pwd`
REPOFILE="$CWD_GG/tmp/listAll.txt"
ERRORFILE="$CWD_GG/tmp/error.txt"
GOOGLEURL="https://android.googlesource.com"
GIT_CLONE="git clone --mirror"
GIT_FETCH="git fetch"
#+-------------------------------

#+-------------------------------
######################
##   repair repo
######################

for REPOTMP in `cat ${ERRORFILE} | cut -b 3-`
do
	cd $CWD_GG
	echo -------$REPOTMP --- 
	if [ -d $REPOTMP ]; then
		cd $REPOTMP
	else
		continue
	fi
	
	git lg -1 &>/dev/null
	if [ $? -ne 0 ]; then
		cd ..
		rm -rf $CWD_GG/$REPOTMP
		time $GIT_CLONE $GOOGLEURL/${REPOTMP}
	else
		continue
	fi
done
