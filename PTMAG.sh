#Global Color Variables
RED='\033[01;31m'
NC='\033[01;0m'
GREEN='\033[01;32m'
BLUE='\033[01;34m'
YELLOW='\033[01;33m'

#Global functions
valid_option () {
  echo -ne "Please select a valid option.\r";
}

#Figlet will need to be installed by user unless dependency added
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

#Menu variables
working="${GREEN}Work in progress${NC}"
upgrade="${BLUE}Future Upgrade${NC}"
unsupported="${YELLOW}Module not yet added${NC}"

#Start Enum help menu function
enum_help () {
  clear
  enum_help_question () {
    echo -n "Select a number and press [Enter]: "
    read number;
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
  echo -e "When all else fails here are some ideas that can help:\n+ Google is your friend\n+ Take a break, step back, refresh\n+ Talk your situation out with a peer\n+ Youtube is also a good resource\n\n "
  echo -e "Enumeration Help Menu: \n1. Previous Menu\n2. Main Menu"
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
  echo -e "2. I've done everything! What now!?!: $upgrade"
  echo -e "3. Main Menu\n"
  enum_question
}

#Start Main Menu Function here
main_menu () {
  main_question () {
    echo -n "What step are you on? Select a number and press [Enter]: "
    read step;
    if [ $step == 1 ]
    then
      enum_menu
    else
      echo -ne "Module not added yet! Standby for upgrades...\r"
      sleep 2
      main_question
    fi
  }
  echo "Main Menu:"
  echo -e "1. Enumeration: $working"
  echo -e "2. Exploitation: $upgrade"
  echo -e "3. Privilege Escalation: $unsupported"
  echo -e "4. Post-Exploitation/Information Gathering: $unsupported\n\n";
  main_question
#  if [ $step == 1 ]
#  then
#    enum_menu
#  else
#    echo "That module has not been added yet! Standby for upgrades...\r";
#    sleep 2
#    question
#  fi
}
main_menu
