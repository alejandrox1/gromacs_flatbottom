# zsh configuration file for Gromacs
# First we remove old gromacs stuff from the paths
# by selecting everything else.
# This is not 100% necessary, but very useful when we
# repeatedly switch between gmx versions in a shell.

# First remove gromacs part of ld_library_path
tmppath=""
for i in `echo $LD_LIBRARY_PATH | sed "s/:/ /g"`; do
  if test "$i" != "$GMXLDLIB"; then
    tmppath=${tmppath}:$i
  fi
done
LD_LIBRARY_PATH=$tmppath

# remove gromacs part of path
tmppath=""
for i in `echo $PATH | sed "s/:/ /g"`; do
  if test "$i" != "$GMXBIN"; then
    tmppath=${tmppath}:$i
  fi
done
PATH=$tmppath

# and remove the gmx part of manpath
tmppath=""
for i in `echo $MANPATH | sed "s/:/ /g"`; do
  if test "$i" != "$GMXMAN"; then
    tmppath=${tmppath}:$i
  fi
done
MANPATH=$tmppath

##########################################################
# This is the real configuration part. We save the Gromacs
# things in separate vars, so we can remove them later.
# If you move gromacs, change the next four line.
##########################################################
export GMXBIN=/home/alarcj/gromacs_stampede/exe/gromacs-4.0.7_flatbottom/exec/bin
export GMXLDLIB=/home/alarcj/gromacs_stampede/exe/gromacs-4.0.7_flatbottom/exec/lib
export GMXMAN=/home/alarcj/gromacs_stampede/exe/gromacs-4.0.7_flatbottom/exec/share/man
export GMXDATA=/home/alarcj/gromacs_stampede/exe/gromacs-4.0.7_flatbottom/exec/share
	
# NB: The variables already begin with ':' now, or are empty
export LD_LIBRARY_PATH=${GMXLDLIB}${LD_LIBRARY_PATH}
export PATH=${GMXBIN}${PATH}
export MANPATH=${GMXMAN}${MANPATH}

# read zsh completions if understand how to use them
if compctl >& /dev/null; then
  if [ -f $GMXBIN/completion.zsh ]; then
    source $GMXBIN/completion.zsh; 
  fi
fi

