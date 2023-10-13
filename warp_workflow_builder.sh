#!/usr/bin/env bash
# -*- coding:  utf-8 -*-
# Author: Gaurav Sablok
# date: 2023-10-13
# MIT License
echo "This is a warp workflow builder which uses the shell in built
        array addition and adds your commands to the in-built array
                declaration"
echo "Gaurav sablok" 
echo "lets build your workflow"               
read -r -p "enter the number of the commands you have to add:" command
read -r -p "enter the name of the workflow:" workflow
read -r -p "ennter the name of the tag:" tag
read -r -p "enter the description of the warp workflow:" description
read -r -p "enter the source url:" source_url
read -r -p "enter the author name:" author_name
read -r -p "enter the author source code url": source_code_url
warpstart="---"
warpcommand="command: |-\n"
warpend="shells: []"
indent="-"
if [[ $command == 0 ]]
then
    echo "warp workflows cant be empty"
    exit
else
    count=0
    array=()
    while [[ "$count" -lt $command ]]; do
        read -r -p "enter the command please:" commands
        array+=("$commands")
        count=$((count+1))
    done
    echo "finished taking all the commands"
        printf "%s$warpstart\n"
    # The name of the workflow.
        printf "name: %s$workflow\n"
    # The corresponding command for the workflow. Any arguments should be surrounded 
    # with two curly braces. E.g `command {{arg}}`
        printf "%s$warpcommand"
    for i in "${array[@]}"
    do 
        printf "%s$i\n"
    done
    # Any tags that the workflow should be categorized with.
    printf "tags:\n"
    printf "%s$indent%s$tag\n"
    # A description of the workflow.
    printf "description: %s$description\n"
    # The source URL for where the workflow was generated from, if any.
    printf "source_url: %s$source_url\n"
    # The author of the workflow.
    printf "author: %s$author_name\n"
    # The URL of original author of the Workflow. For example, if this workflow was generated 
    # from StackOverflow, the `author_url` would be the StackOverflow author's profile page.
    printf "author_url: %s$source_code_url\n"
    printf "%s$warpend\n"
fi 
