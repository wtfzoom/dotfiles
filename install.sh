#!/bin/bash

GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m'

set -e

echo -e "${GREEN}### Iniciando a Instalação Deep Blood Red ###${NC}"

# --- 1. Configurar Teclado ---
echo -e "${BLUE}Configuração de Teclado:${NC}"
read -p "Digite o layout (ex: br, us): " kblayout
read -p "Digite a variante (ex: abnt2, intl ou deixe vazio): " kbvariant

sed -i "s/kb_layout = .*/kb_layout = $kblayout/" .config/hypr/hyprland.conf
sed -i "s/kb_variant = .*/kb_variant = $kbvariant/" .config/hypr/hyprland.conf

# --- 2. Configurar Fuso Horário ---
echo -e "${BLUE}Configuração de Horário:${NC}"
echo "1) America/Sao_Paulo"
echo "2) America/Manaus"
echo "3) America/Cuiaba"
echo "4) America/Fortaleza"
echo "5) Outro (digitar manualmente)"
read -p "Escolha uma opção (1-5): " tz_choice

case $tz_choice in
    1) timezone="America/Sao_Paulo" ;;
    2) timezone="America/Manaus" ;;
    3) timezone="America/Cuiaba" ;;
    4) timezone="America/Fortaleza" ;;
    5) read -p "Digite o timezone (ex: Europe/London): " timezone ;;
    *) timezone="America/Sao_Paulo" ;;
esac

sudo timedatectl set-timezone $timezone

# --- 3. Verificar/Instalar Yay ---
if ! command -v yay &> /dev/null; then
    echo -e "${YELLOW}Instalando Yay...${NC}"
    sudo pacman -S --needed --noconfirm base-devel git
    git clone https://aur.archlinux.org/yay-bin.git
    cd yay-bin && makepkg -si --noconfirm && cd .. && rm -rf yay-bin
fi

# --- 4. Pacotes Oficiais ---
sudo pacman -S --needed --noconfirm \
    stow hyprland waybar kitty wofi swaync starship \
    thunar swww grim slurp wl-clipboard pavucontrol \
    hyprlock xdg-desktop-portal-hyprland qt6ct gnome-keyring \
    ttf-jetbrains-mono-nerd otf-font-awesome gnu-free-fonts

# --- 5. Temas e Ícones (AUR) ---
echo -e "${YELLOW}Instalando Temas e Ícones...${NC}"
yay -S --needed --noconfirm \
    sunset-theme-git \
    tela-circle-icon-theme-git \
    tokyonight-gtk-theme-git \
    rage-cursor-theme-git

# --- 6. Configuração de Diretórios e Stow ---
mkdir -p ~/.config
mkdir -p ~/Imagens/wallpapers

stow .
chmod +x install.sh

echo -e "${GREEN}### Instalação concluída! ###${NC}"