# Check for coding style errors
cs ()
{
  NC='\033[0m' # No Color
  RED='\033[0;31m'
  GRN='\033[0;32m' # Green
  YLW='\033[0;33m' # Yellow
  BLU='\033[0;34m' # Blue
  PPL='\033[0;35m' # Purple
  CYN='\033[0;36m' # Cyan
  WHT='\033[0;37m' # White
  GRY='\033[0;90m' # Gray
  BLD='\033[1m'    # Bold
  UNDRLN='\033[4m' # Underline
  ITLC='\033[3m'   # Italic

  exec_abricot()
  {
    echo -e "Executing ${YLW}abricot${NC}"
    echo -n "check for all errors? [Y/n] (default: yes) "
    read input2
    if [ "$input2" = 'N' ] || [ "$input2" = 'n' ]; then
      echo -e "Checking ${YLW}abricot${NC}..."
      abricot --ignore
    else
      echo -e "Checking ${YLW}abricot --all --nofunc${NC}..."
      abricot --all --ignore --nofunc
    fi
  }

  exec_coding_style()
  {
    echo -e "Checking ${CYN}coding style${NC}..."
    coding-style . . 2>&1 | tail -n 1 > .cst
    if cat .cst | grep -q "0 major, 0 minor, 0 info"; then
      echo -e "${GRN}Coding style OK${NC}"
    else
      echo -ne "${RED}"; cat .cst; echo -ne "${NC}"
      if ! command -v bat &> /dev/null ; then
        cat coding-style-reports.log
      else
        bat -p coding-style-reports.log
      fi
    fi
    rm -rf coding-style-reports.log .cst
  }

  clear
  if [ -n "$(find . -name '*.o')" ] || [ -n "$(find . -name '*.a')" ]; then
    echo -e "${ITLC}Found .o or .a files${NC}"
    echo -n "Make fclean? [Y/n] (default: yes) "
    read input
    if [ "$input" = 'n' ]; then
      echo -e "${RED}No Make fclean${NC}"
    else
      make fclean
      echo -e "${GRN}Make fclean OK${NC}"
    fi
  fi

  if command -v coding-style &> /dev/null || command -v abricot &> /dev/null; then
    if command -v coding-style &> /dev/null && ! command -v abricot &> /dev/null; then
      exec_coding_style
      return 0
    fi
    if ! command -v coding-style &> /dev/null && command -v abricot &> /dev/null; then
      exec_abricot
      return 0
    fi

    echo -e "Found both ${YLW}abricot${NC} and ${CYN}coding-style${NC} scripts"
    echo -n "Execute coding-style instead of abricot? [Y/n] (default: yes) "
    read input
    if [ "$input" = 'n' ]; then
      exec_abricot
    else
      exec_coding_style
    fi
  else
    echo -e "${RED}No coding-style or abricot script found.${NC}"
    echo -e "Please install ${UNDRLN}abricot${NC} or ${UNDRLN}coding-style${NC} scripts."
    echo "Exiting..."
    return 1
  fi
}
