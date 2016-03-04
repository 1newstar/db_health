#!/bin/bash
echo "<ul>"
while [[ $# != 0 ]]
do 
  echo "<li class=\"awr\"><a class=\"awr\" href=\"#$1\">$1</a></li>"
  shift;
done
echo "</ul>"
