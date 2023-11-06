#!/bin/bash

# User Interaction
read -p "Enter your name: " user

echo ""

echo "Hello there $user, Welcome to Project Executor."

echo ""

# creating a menu function for the various projects
menu_function () {
echo "Which project do you want to execute:

	1. Bash
	2. Python
	3. Exit()
     "

read user_choice

}

# Getting a project name  & Creating project directory
# This part of the script will prompt the user for the prolect name which will be used to  create a directory.
read -p "Enter a project name: " project_name

echo ""

 # Create a directory using the project name
mkdir "$project_name"

echo ""

  # Provide feedback to the user
echo "Directory '$project_name' created successfully."

echo ""

 # Call back the above function
menu_function
case $user_choice in
  1)
     # Bash Script
     echo "      **********  Bash Script  **********     "

    ;;

  2) 
echo "      ********** Python ********      "
     # Python Environment
     # A virtual environment is needed to carryout this part of the project. The following steps below will be used to create a venv.
     # This script assumes that python3 has been installed by the user
    echo "To carry out this task, a virtual environment is needed. $user kindly provide the neccessary data needed below"

echo ""
     # we commence by prompting the user for the venv name
     read -p "Enter your virual environment name to be created: " name_of_venv

echo ""

     # Create a venv with the provided name
     python3 -m venv $name_of_venv

echo ""

     # The script activates the venv 
     source $name_of_venv/bin/activate

echo ""

     # The script install libraries such as pandas and seaborn
     pip install pandas
     pip install seaborn 

echo ""

     # Script runs the pip freeze / pip list and redirects the output to a requirements.txt file 
     # pip list > requirements.txt
     pip freeze > requirements.txt

echo ""

     # This script will deactivate the venv after the above task have been completed and return the user to the directory
     deactivate
    ;;
esac

   # The above script is used for;
   # - Starts by asking the user for his/her name.
   # - Giving the user a menu of projects to choose from (Bash or Python)
   # - The script creates a python virtual environment(when the Python option is chosen), installing python libraaries such as seaborn and  pandas. After the installation, the 
   # freeze command is used an the output is redirected to a newly created requirements.txt file. After the above steps are completed, the script, then deactivates the venv.
   # - THe script also creates a README file (when the Bash option is chosen) which contains instructions on how to run the script.
