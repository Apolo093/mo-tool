#!/bin/bash

RED='\033[0;91m'
GREEN='\033[0;92m'
YELLOW='\033[0;93m'
BLUE='\033[0;94m'
PURPLE='\033[0;95m'
NC='\033[0m'
BOLD='\033[1m'

show_header() {
    clear
    echo -e "${RED}"
    cat << "EOF"
  ███╗   ███╗ ██████╗ 
  ████╗ ████║██╔═══██╗
  ██╔████╔██║██║   ██║
  ██║╚██╔╝██║██║   ██║
  ██║ ╚═╝ ██║╚██████╔╝
  ╚═╝     ╚═╝ ╚═════╝ 
EOF
    echo -e "${NC}"
    echo -e "${YELLOW}${BOLD}┌────────────────────────────────┐${NC}"
    echo -e "${RED}${BOLD}        MO TOOL INSTALLER         ${NC}"
    echo -e "${YELLOW}${BOLD}└────────────────────────────────┘${NC}"
    echo ""
}

log_message() {
    case $1 in
        "success") echo -e "${GREEN}${BOLD}✅ $2${NC}" ;;
        "error") echo -e "${RED}${BOLD}❌ $2${NC}" ;;
        "warning") echo -e "${YELLOW}${BOLD}⚠️ $2${NC}" ;;
        "progress") echo -e "${PURPLE}${BOLD}⏳ $2${NC}" ;;
        "info") echo -e "${BLUE}${BOLD}⭕ $2${NC}" ;;
        *) echo -e "${PURPLE}${BOLD}🔹 $2${NC}" ;;
    esac
}

check_termux() {
    [ ! -d "/data/data/com.termux/files/usr" ] && {
        log_message "error" "This script is designed for Termux only!"
        log_message "warning" "Please run this on Termux app"
        exit 1
    }
}

show_menu() {
    echo -e "${BLUE}${BOLD}"
    echo "┌────────────────────────────────────┐"
    echo "│           SELECT OPTION            │"
    echo "├────────────────────────────────────┤"
    echo "│  1. INSTALL ALL REQUIREMENTS       │"
    echo "│  2. RUN MO TOOL (SPAM SMS)         │"
    echo "│  3. SPAM CALLS WEBSITE             │"
    echo "│  4. TOOL INFO & DEVELOPER          │"
    echo "│  5. EXIT                           │"
    echo "└────────────────────────────────────┘"
    echo -e "${NC}"
    echo -n -e "${YELLOW}${BOLD}SELECT OPTION (1-5): ${NC}"
}

install_requirements() {
    log_message "progress" "Updating Termux packages..."
    pkg update -y && pkg upgrade -y || {
        log_message "error" "Failed to update packages"
        return 1
    }

    log_message "progress" "Installing Python 3..."
    pkg install python -y || {
        log_message "error" "Failed to install Python"
        return 1
    }

    log_message "progress" "Installing PIP..."
    pkg install python-pip -y || {
        log_message "error" "Failed to install PIP"
        return 1
    }

    log_message "progress" "Installing required libraries..."
    pip install requests || {
        log_message "error" "Failed to install requests"
        return 1
    }

    log_message "progress" "Installing additional tools..."
    pkg install git curl wget -y

    python3 -c "import requests" || {
        log_message "error" "Failed to verify installation"
        return 1
    }

    log_message "success" "Installation completed!"
    log_message "info" "Now you can run: python3 mo-tool.py"
    
    read -p "$(echo -e "${YELLOW}${BOLD}Run MO Tool now? (y/n): ${NC}")" -n 1
    echo
    [[ $REPLY =~ ^[Yy]$ ]] && python3 mo-tool.py
}

run_mo_tool() {
    [ -f "mo-tool.py" ] && {
        log_message "progress" "Running MO Tool..."
        python3 mo-tool.py
    } || {
        log_message "error" "MO Tool not found!"
        log_message "info" "Please install requirements first (Option 1)"
    }
}

open_url() {
    log_message "info" "$2"
    echo -e "${RED}🔗 $1${NC}"
    
    if command -v termux-open-url &> /dev/null; then
        termux-open-url "$1"
    elif command -v am &> /dev/null; then
        am start -a android.intent.action.VIEW -d "$1"
    else
        log_message "warning" "Cannot open automatically"
        log_message "info" "Please visit: $1"
    fi
}

open_spam_website() {
    echo -e "${RED}${BOLD}"
    echo "┌────────────────────────────────────┐"
    echo "│     OPENING SPAM CALLS WEBSITE     │"
    echo "└────────────────────────────────────┘"
    echo -e "${NC}"
    open_url "https://spam.arab-hacking.com" "Opening Spam Calls Website..."
}

show_tool_info() {
    while true; do
        clear
        echo -e "${PURPLE}"
        echo "┌────────────────────────────────────────────┐"
        echo "│             TOOL INFORMATION               │"
        echo "├────────────────────────────────────────────┤"
        echo "│                                            │"
        echo -e "│   ${YELLOW}🔹 Name: MO Tool${PURPLE}                         │"
        echo -e "│   ${YELLOW}🔹 Version: 1.0${PURPLE}                          │"
        echo -e "│   ${YELLOW}🔹 Function: Spam SMS Only!${PURPLE}              │"
        echo -e "│   ${YELLOW}🔹 Developer: Mahmoud Osman${PURPLE}              │"
        echo "│                                            │"
        echo -e "│   ${GREEN}📞 WhatsApp: +201032811141${PURPLE}               │"
        echo -e "│   ${RED}📺 YouTube: @arabhacking${PURPLE}                 │"
        echo -e "│   ${BLUE}🌐 Website: arab-hacking.com${PURPLE}             │"
        echo "│                                            │"
        echo "└────────────────────────────────────────────┘"
        echo -e "${NC}"
        
        echo -e "${YELLOW}${BOLD}Select contact method:${NC}"
        echo "1. 📞 WhatsApp"
        echo "2. 📺 YouTube" 
        echo "3. 🌐 Website"
        echo "4. 📢 Telegram"
        echo "5. 💻 GitHub"
        echo "6. ↩️ Back to main menu"
        
        read -p "$(echo -e "${YELLOW}${BOLD}Choose (1-6): ${NC}")" -n 1
        echo
        
        case $REPLY in
            1) open_url "https://wa.me/201032811141" "Opening WhatsApp..." ;;
            2) open_url "https://youtube.com/@arabhacking" "Opening YouTube..." ;;
            3) open_url "https://arab-hacking.com" "Opening Website..." ;;
            4) open_url "https://t.me/arabhackiing" "Opening Telegram..." ;;
            5) open_url "https://github.com/arabhacking" "Opening GitHub..." ;;
            6) break ;;
            *) log_message "error" "Invalid choice!" ;;
        esac
        
        [ "$REPLY" != "6" ] && read -p "$(echo -e "${YELLOW}${BOLD}Press Enter to continue...${NC}")"
    done
}

check_termux
show_header

while true; do
    show_menu
    read -r choice
    
    case $choice in
        1)
            echo -e "${RED}${BOLD}"
            echo "┌────────────────────────────────────┐"
            echo "│    INSTALLING REQUIREMENTS...      │"
            echo "└────────────────────────────────────┘"
            echo -e "${NC}"
            install_requirements
            ;;
        2)
            echo -e "${RED}${BOLD}"
            echo "┌────────────────────────────────────┐"
            echo "│       RUNNING MO TOOL...           │"
            echo "└────────────────────────────────────┘"
            echo -e "${NC}"
            run_mo_tool
            ;;
        3) open_spam_website ;;
        4) show_tool_info ;;
        5)
            echo -e "${RED}${BOLD}"
            echo "┌────────────────────────────────────┐"
            echo "│         EXITING PROGRAM...         │"
            echo "└────────────────────────────────────┘"
            echo -e "${NC}"
            exit 0
            ;;
        *) log_message "error" "Invalid option! Please choose 1-5" ;;
    esac
    
    echo
    read -p "$(echo -e "${YELLOW}${BOLD}Press Enter to continue...${NC}")"
    show_header
done
