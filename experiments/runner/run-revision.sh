#!/bin/bash

# TODO: may need exp example shebang: ! / usr / bin /env bash

#echo "Cleaning output directory ..."
#rm -rf ./out && mkdir ./out

output="./out/run-$(date +%Y%m%d.%H%M.%S).out"
echo "$output"
echo "LOG FILE" > $output

task_time_s="${1:-30}"
num_cores=$(nproc)

echo "Task time: ${task_time_s}s" >> $output
echo "Number of cores: ${num_cores}" >> $output

# CURRENT STEPS
#video-mul-1 video-mul-6 video-mul-11 video-mul-13 video-mul-16
#sudo -s
#perf stat -e power/energy-pkg/,power/energy-ram/ /home/cc/miniconda3/envs/central/bin/python3 runner_script.py --config-name video-mul-1

#conda activate central
#sudo -s
sudo su
source /home/cc/miniconda3/etc/profile.d/conda.sh
source /home/cc/miniconda3/bin/activate central

run_task() {
  #"$@" >> $output
  sudo perf stat -e power/energy-pkg/,power/energy-ram/ "$@"
}

#conda install numpy

#python3 runner_script.py --config-name tmp
perf stat -e power/energy-pkg/,power/energy-ram/ python3 runner_script.py --config-name tmp
#&>> $output
#run_task python3 runner_script.py --config-name tmp &>> $output
#run_task python3 runner_script.py --config-name video-mul-1 &>> $output
#sleep 60
#python runner_script.py --config-name video-mul-6
#sleep 60
#python runner_script.py --config-name video-mul-11
#sleep 60
#python runner_script.py --config-name video-mul-13
#sleep 60
#python runner_script.py --config-name video-mul-16
#sleep 60

# Draw the results of the experiment
#jupyter nbconvert --execute --to notebook --inplace ~/ipa/experiments/runner/notebooks/Jsys-reviewers-revision.ipynb
