#!/usr/bin/env bash

#PBS -N install_packages
#PBS -l ncpus=4
#PBS -l mem=2GB
#PBS -l walltime=02:00:00
#PBS -o install_python_packages_stdout.out
#PBS -e install_python_packages_stderr.out

# More info on PBS directives can be found here
# http://qcd.phys.cmu.edu/QCDcluster/pbs/run_serial.html



###############################################
#
#
#  Display PBS info
#
#
###############################################
print_pbs_info(){
    echo ------------------------------------------------------
    echo -n 'Job is running on node '; cat $PBS_NODEFILE
    echo ------------------------------------------------------
    echo PBS: qsub is running on $PBS_O_HOST
    echo PBS: originating queue is $PBS_O_QUEUE
    echo PBS: executing queue is $PBS_QUEUE
    echo PBS: working directory is $PBS_O_WORKDIR
    echo PBS: execution mode is $PBS_ENVIRONMENT
    echo PBS: job identifier is $PBS_JOBID
    echo PBS: job name is $PBS_JOBNAME
    echo PBS: node file is $PBS_NODEFILE
    echo PBS: current home directory is $PBS_O_HOME
    echo PBS: PATH = $PBS_O_PATH
    echo ------------------------------------------------------

    # displaying some additional node info
    # is handy for debugging some things or know if you are
    # encountering any problematic nodes
    echo ""
    echo ------------------------------------------------------
    pbsnodeinfo | head -n 2
    pbsnodeinfo | grep $HOSTNAME
}

###############################################
#
#
#  Helper/Setup Functions
#
#
###############################################

load_modules(){
    #activate module environment
    #NOTE: a recent HPC update means that you shouldn't need
    #to do this anymore, but I have included as a sanity check
    source /etc/profile.d/modules.sh

    #load python
    module load python/3.7.4-gcccore-8.3.0
    # activate the virtual environment we need
    source ~/p_3.7.4/bin/activate
}


copy_in(){
    #copy some data to  your input directory
    #nothing to copy in on this script
    #For empty bash functions, must put a colon in them,
    #otherwise it will throw an error
    :
}


copy_out(){
    #nothing to copy out on this script
    #For empty bash functions, must put a colon in them,
    #otherwise it will throw an error
    :
}



run_program(){
    # a bit easier than the R version, can
    # just call pip install from here
    pip install numpy scikit-learn opencv-python opencv-contrib-python
}


run_clean(){
    #nothing to clean for this script
    #For empty bash functions, must put a colon in them,
    #otherwise it will throw an error
    :
}

###############################################
#
#
#  Running everything
#
#
###############################################

print_pbs_info
load_modules
copy_in
copy_out
run_program
run_clean
