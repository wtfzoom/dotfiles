# 🌑 Deep Blood Red - Hyprland Dotfiles

Meu setup pessoal do Hyprland. Focado em tons vermelho sangue e cinza escuro (estética Berserk).

> "O homem não tem controle sequer sobre sua própria vontade."

---

## 📸 Screenshots

| Desktop Clean | Workspaces / Janelas |
| :---: | :---: |
| <img src="https://github.com/user-attachments/assets/1f47ddc7-a4ba-4ba2-bc76-21ccd8a7df7c" width="450" /> | <img src="https://github.com/user-attachments/assets/d2bd3d5a-e410-42b7-9e15-43eb4113d3ef" width="450" /> |

---

## 🛠️ O que tem aqui?

* **WM:** Hyprland
* **Barra:** Waybar (Relógio em PT-BR, ícones de sistema)
* **Launcher:** Wofi (Tema customizado)
* **Terminal:** Kitty
* **Notificações:** SwayNC
* **Temas:** Sunset-Dark + Ícones Tela-circle-red / Tokyonight-Light
* **Cursor:** Rage-Cursor

---

## 🚀 Como instalar (Auto-install)

Eu fiz um script que resolve tudo sozinho. Ele vai:

1. Instalar o `yay` se você não tiver.
2. Baixar todos os pacotes oficiais e do AUR.
3. Configurar seu **teclado** e **fuso horário**.
4. Arrumar o relógio pra ficar em português.
5. Linkar os arquivos via **Stow**.

### Rodando o script:

```bash
git clone [https://github.com/wtfzoom/dotfiles.git](https://github.com/wtfzoom/dotfiles.git)
cd dotfiles
chmod +x install.sh
./install.sh
