date
#+-------------------------------
CWD_GG=`pwd`
REPOFILE="$CWD_GG/tmp/listAll.txt"
GOOGLEURL="https://android.googlesource.com"
GIT_CLONE="git clone --mirror"
GIT_FETCH="git fetch"
#+-------------------------------
mkdir -p tmp
wget https://android.googlesource.com/?format=TEXT --no-check-certificate -O $REPOFILE
if [ $? -ne 0 ]; then
	echo Can not wget listAll!
	exit 1
fi
#+-------------------------------
######################
##   git clone       #
######################

echo ---------git clone1---------
for REPOTMP in `cat $REPOFILE | grep platform`
do
	echo ---------------- ${REPOTMP} --- start `date`
	mkdir -p ${REPOTMP}.git
	cd  ${REPOTMP}.git
	if [ -f HEAD ]; then
		time $GIT_FETCH $GOOGLEURL/${REPOTMP}
	else
		git init --bare
		time $GIT_FETCH $GOOGLEURL/${REPOTMP}
	fi
	echo ---------------- ${REPOTMP} === end `date`
	cd $CWD_GG
done
#+-------------------------------

exit 0
echo ---------------- ${REPOTMP} --- start `date`
	if [ -d ${REPOTMP}.git ]; then
		cd ${REPOTMP}.git
		time ${GIT_FETCH} ${GOOGLEURL}/${REPOTMP}
	else
		mkdir -p ${REPOTMP}.git
		cd ${REPOTMP}.git
		git init --bare
		time ${GIT_FETCH} ${GOOGLEURL}/${REPOTMP}
	fi
	
	echo ---------------- ${REPOTMP} === end `date`
cd $CWD_GG
