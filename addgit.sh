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
##   check repo
######################

REPOS_ALL=`find . -name "*.git"`
echo -------------------------- >> $ERRORFILE

for REPOTMP in ${REPOS_ALL}
do
	echo -------$REPOTMP --- 
	cd $REPOTMP
	git lg -1 &>/dev/null || echo $REPOTMP >> $ERRORFILE
	cd $CWD_GG
done
#+-------------------------------
