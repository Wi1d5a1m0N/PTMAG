#!/bin/bash
#Author Notes
#echo -e is used for escape functionality, also -n is added for no new line at end of line, and \r is so that there is no carriage return.
#figlet will need to be installed as well as an additional non-default fault called larry3d.flf, MAKE SURE YOU MAKE A SETUP.SH!!!!

#Global Variables
RED='\033[01;31m'
NC='\033[01;0m'
GREEN='\033[01;32m'
BLUE='\033[01;34m'
YELLOW='\033[01;33m'

#Menu variables
finished="${GREEN}Complete${NC}"
working="${YELLOW}Work in progress${NC}"
upgrade="${BLUE}Future Upgrade${NC}"
unsupported="${RED}Module not yet added${NC}"

#main page elements
main_page="Main"
main_page_list=("Enumeration" "Exploitation" "Privilege Escalation" "Post-Exploitation/Information Gathering" "Quit" )
main_keys=($main_page_list[0]=$working $main_page_list[1]=$upgrade $main_page_list[2]=$unsupported $main_page_list[3]=$unsupported $main_page_list[4]="")
#Global functions
#menu_func (page, page_list, keys) {
#  printf "$page Menu:"
#  for item in ${$page_list}; do
#      printf "$((item+1)). ${$page_list[item]}: ${$keys[$item]}";
#  printf "Select a number and press [Enter]: "
#  read number
#}
option () {
  printf "Select a number and press [Enter]: "
#  echo -n "Select a number and press [Enter]: "
  read number
return $number;
}
valid_option () {
  echo -ne "Please select a valid option.\r";
}

#Loading Prompt Here
echo -e "${RED}"
figlet -t -f larry3d.flf "Wi1d5a1m0N"
figlet -t -f larry3d.flf "Presents"
figlet -t -f larry3d.flf "PTMAG"
echo "Penetration Tester's Manual Attack Guide"
echo -ne 'Loading: [######                   ]   (25%)  Starting up Framework...\r'
sleep 2
echo -ne 'Loading: [###########              ]   (50%)  Gathering Resources...  \r'
sleep 2
echo -ne 'Loading: [#################        ]   (75%)  Checking for Updates... \r'
sleep 2
echo -ne 'Loading: [######################## ]   (99%)  Almost there...         \r'
sleep 2
echo -ne 'Loading: [#########################]   (100%) And Done...             \r'
sleep 1
echo -ne '\n\n'
echo -e "${NC}"
echo -ne "Welcome to Wi1d5a1m0N's Penetration Tester's Manual Attack Guide\n\n"
echo -ne "This guide is not the end all, be all, but I will certainly try my hardest.\n"
echo -ne "This is a work in progress, so updates will be following. This guide will give\nan idea on where to start with your pen-testing methodologies, process, and provide\nsample commands, resource links, and ideas to think about when you are testing a\nsystem.\n\n"

#Start Enum methods menu function
enum_methods () {
  clear
  enum_methods_question () {
    option
  }
  echo -e "${GREEN}Generally in a penetration test you would start with open-source/passive reconnaissance. I may or may not add information on that.\nAs of this version, clearly there is no support for it yet.${NC}\n\n"
  echo -e "Enumeration Methods Menu:"
  echo -e "1. IP/Network Enumeration: $working"
  echo -e "2. Port Scanning: $unsupported"
  echo -e "3. Service Enumeration: $unsupported"
  echo -e "4. OS Enumeration: $unsupported"
  echo -e "5. Previous Menu\n"
  enum_methods_question
}

#Start Enum help menu function
enum_help () {
  clear
  enum_help_question () {
    option
    if [ $number == 1 ]
    then
      enum_menu
    elif [ $number == 2 ]
    then
      clear
      main_menu
    else
      valid_option
      sleep 2
      enum_help_question
    fi
  }
  echo -e "${GREEN}Take heart you have not truly failed until you have given up...so, like many, before have said, TRY HARDER!!!${NC}\n\n"
  echo -e "When all else fails here are some ideas that can help: "
  echo -e "${GREEN}[+]${NC} Google is your friend --> https://www.google.com/"
  echo -e "${GREEN}[+]${NC} Take a break, step back, refresh, try a more simple approach"
  echo -e "${GREEN}[+]${NC} Talk your situation out with a peer"
  echo -e "${GREEN}[+]${NC} Youtube is also a good resource, specifically IppSec --> https://www.youtube.com/channel/UCa6eh7gCkpPo5XXUDfygQQA"
  echo -e "${GREEN}[+]${NC} Revert the system and start over  --> This is only if you have the ability (i.e. virtual labs)\n\n"
  echo -e "Enumeration Help Menu: \n1. Previous Menu\n2. Main Menu\n"
  enum_help_question
}
#Start Enumeration Menu Function here
enum_menu () {
  clear
  enum_question () {
    echo -n "Select a number and press [Enter]: "
    read number;
    if [ $number == 1 ]
    then
      enum_methods
    elif [ $number == 2 ]
    then
      enum_help
    elif [ $number == 3 ]
    then
      clear
      main_menu
    else
      echo -ne "Please select a valid option.\r"
      sleep 2
      enum_question
    fi
  }
  echo -e "${GREEN}Enumerate, Enumerate, Enumerate!!!\nWhen you think you have enumerated all you can, enumerate more...${NC}\n"
  echo "Enumeration Menu:"
  echo -e "1. Where to start: $working"
  echo -e "2. I've done everything! What now!?!: $finished"
  echo -e "3. Main Menu\n"
  enum_question
}

#Start Main Menu Function here
main_menu () {
  main_question () {
    option
    if [ $number == 1 ]
    then
      enum_menu
    elif [ $number == 5 ]
    then
      exit 0
    elif [ $number == 2 ] || [ $number == 3 ] || [ $number == 4 ]
    then
      printf "Module not added yet! Standby for upgrades...\n"
      sleep 2
      main_question
    else
      valid_option
    fi;
  }
  echo "Main Menu:"
  echo -e "1. Enumeration: $working"
  echo -e "2. Exploitation: $upgrade"
  echo -e "3. Privilege Escalation: $unsupported"
  echo -e "4. Post-Exploitation/Information Gathering: $unsupported";
  echo -e "5. Quit\n";
  main_question
}
main_menu
