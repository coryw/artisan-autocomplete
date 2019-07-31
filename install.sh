#!/bin/bash
install_path="/usr/local/bin"
original_path=$(pwd)
completion_path="/etc/bash_completion.d"
command_name="artisan"
# Check to see if symlink is already created
if ! [ -L "$install_path/$command_name" ];then
    # Check to see if file exists with this name
    if [ -f "$install_path/$command_name" ];then
        echo "Warning: found existing file named $command_name, renaming to ${command_name}_OLD"
        sudo mv $install_path/$command_name $install_path/${command_name}_OLD
    fi
    cd $install_path
    sudo ln -s $original_path/$command_name $command_name
    echo "Successfully created symlink in $install_path"
else
    echo "Executable symlink already created; nothing to do here"
fi
sudo chmod +x $command_name
# Check to see if symlink is already created
if ! [ -L "$completion_path/$command_name" ];then
    # Check to see if file exists with this name
    if [ -f "$completion_path/$command_name" ];then
        echo "Warning: found existing file named $command_name, renaming to ${command_name}_OLD"
        sudo mv $completion_path/$command_name $completion_path/${command_name}_OLD
    fi
    cd $completion_path
    sudo ln -s $original_path/bash_completion.d/$command_name $command_name
    echo "Successfully created symlink in $completion_path"
else 
    echo "Completion script symlink already created; nothing to do here"
fi
