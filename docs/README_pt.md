# 🎨 PhotoGIMP

<img src="../.local/share/icons/hicolor/256x256/256x256.png" align="right" alt="PhotoGimp application icon" title="PhotoGimp application icon">

Um patch para otimizar o GIMP 3.0+ para usuários do Adobe Photoshop, incluindo recursos como:

* Organização de ferramentas para imitar a posição do Adobe Photoshop;
* Nova tela inicial;
* Novas configurações padrão para maximizar o espaço na tela;
* Atalhos semelhantes aos do Photoshop para Windows, seguindo a Documentação da Adobe;
* Novo ícone e nome do arquivo .desktop personalizado.

## 📷 Capturas de Tela

<p>
  <img src="../.config/GIMP/3.0/splashes/splash-screen-2025-v2.png" alt="PhotoGIMP Diolinux Splash Art">
  <em>PhotoGIMP Diolinux Splash Art</em>
</p>

<p>
  <img src="../screenshots/photogimp_3_-_diolinux.png" alt="PhotoGIMP 3">
  <em>GIMP 3.0 com o patch PhotoGIMP aplicado</em>
</p>

## ⚙ Como Instalar

Este patch foi originalmente desenvolvido para funcionar com a versão Flatpak do GIMP para Linux, mas pode ser usado em quase qualquer formato de pacote sem restrição, extraindo os arquivos nas pastas corretas.

### Flatpak (Linux)

Para instalar a versão mais recente do PhotoGIMP no seu sistema Linux usando Flatpak, siga estes passos simples:

<img src="https://skillicons.dev/icons?i=linux" align="right" width="40" />

1. Certifique-se de que você já tem o GIMP instalado [pelo Flathub](https://flathub.org/apps/org.gimp.GIMP);
2. **Inicie e saia do GIMP após a instalação antes de continuar!**
3. Baixe os arquivos deste repositório [ou clique aqui](https://github.com/Diolinux/PhotoGIMP/releases/download/3.0/PhotoGIMP-linux.zip);
4. Extraia o conteúdo do arquivo zip para sua pasta home (`.config` e `.local` - são os importantes) e substitua os arquivos se necessário;
5. Pronto, aproveite! :smile:

<hr>

### Windows

<img src="https://skillicons.dev/icons?i=windows" align="right" />

Para instalar a versão mais recente do PhotoGIMP no Windows:

1. Certifique-se de que você já tem o [GIMP instalado pelo site oficial](https://www.gimp.org/downloads/);
2. **Inicie e saia do GIMP após a instalação antes de continuar!**
3. Baixe os arquivos deste repositório ou [clique aqui](https://github.com/Diolinux/PhotoGIMP/releases/download/3.0/PhotoGIMP.zip);
4. Extraia o conteúdo de `PhotoGIMP.zip` para uma pasta de sua preferência;
5. Copie a pasta `3.0`;
6. Pressione a tecla <kbd>Windows</kbd> e <kbd>R</kbd> para abrir o diálogo *Executar*;
7. Digite `%APPDATA%\GIMP` no diálogo e pressione <kbd>Enter</kbd>;
8. Cole a pasta `3.0` dentro da pasta do GIMP que você acabou de abrir;
9. Quando perguntado sobre arquivos existentes, selecione "Substituir os arquivos no destino";
10. Pronto, aproveite! :smile:

:bulb: Dicas:
- Opcionalmente, você também pode baixar o [photogimp.ico](https://github.com/Diolinux/PhotoGIMP/releases/download/3.0/photogimp.ico) e atualizar o ícone do atalho em `%appdata%\Microsoft\Windows\Start Menu\Programs\GIMP 3.0.0`;
- Se você quiser fazer backup das suas configurações atuais do GIMP antes de instalar o PhotoGIMP, copie toda a pasta `3.0` de `%APPDATA%\GIMP` para um local seguro antes de prosseguir com a instalação.

### macOS

<img src="https://skillicons.dev/icons?i=macos" align="right" />

Para instalar a versão mais recente do PhotoGIMP no seu macOS:

1. Certifique-se de que você já tem o [GIMP instalado pelo site oficial](https://www.gimp.org/downloads/);
2. **Inicie e saia do GIMP após a instalação antes de continuar!**
3. Baixe os arquivos deste repositório ou [clique aqui](https://github.com/Diolinux/PhotoGIMP/releases/download/3.0/PhotoGIMP.zip);
4. Extraia o conteúdo de `PhotoGIMP.zip` para uma pasta de sua preferência;
5. Copie a pasta `3.0`;
6. Abra o Finder, pressione <kbd>Cmd</kbd> + <kbd>Shift</kbd> + <kbd>G</kbd> para abrir "Ir para a pasta";
7. Digite `~/Library/Application Support/GIMP` e pressione <kbd>Enter</kbd>;
8. Se você tiver uma pasta `2.10` de uma instalação anterior, exclua-a para evitar conflitos;
9. Cole a pasta `3.0` dentro da pasta do GIMP;
10. Quando perguntado sobre arquivos existentes, selecione "Substituir" ou "Mesclar";
11. Pronto, aproveite! :smile:

:bulb: Dicas:
- Se você quiser fazer backup das suas configurações atuais do GIMP antes de instalar o PhotoGIMP, copie toda a pasta GIMP de `~/Library/Application Support/GIMP` para um local seguro antes de prosseguir com a instalação.

## ⚠ Solução de Problemas

### PhotoGIMP não está carregando / GIMP parece igual

**Solução:**
1. Certifique-se de ter iniciado o GIMP pelo menos uma vez antes de instalar o PhotoGIMP
2. Verifique se os arquivos estão no local correto:
   - **Windows:** `%APPDATA%\GIMP\3.0\` deve conter pastas como `themes`, `splashes`, etc.
   - **Linux (Flatpak):** `~/.var/app/org.gimp.GIMP/config/GIMP/3.0/`
   - **Linux (nativo):** `~/.config/GIMP/3.0/`
   - **macOS:** `~/Library/Application Support/GIMP/3.0/`
3. Reinicie o GIMP completamente (feche todas as janelas)
4. Verifique se a tela inicial mostra "PhotoGIMP" quando o GIMP iniciar

### Os atalhos de teclado não estão funcionando

**Solução:**
1. Verifique se o arquivo `shortcutsrc` existe na pasta de configuração do GIMP
2. Alguns atalhos podem conflitar com atalhos do sistema operacional
3. Você pode personalizar atalhos no GIMP: Editar > Atalhos de Teclado
4. Certifique-se de usar a tecla modificadora correta:
   - Windows/Linux: `Ctrl`
   - macOS: `Cmd` (Command)

### O GIMP não inicia após instalar o PhotoGIMP

**Solução:**
1. Restaure seu backup (se você criou um)
2. Ou delete a pasta de configuração do GIMP e reinstale:
   - **Windows:** Delete `%APPDATA%\GIMP\3.0\`
   - **Linux:** Delete `~/.config/GIMP/3.0/` ou `~/.var/app/org.gimp.GIMP/config/GIMP/3.0/`
   - **macOS:** Delete `~/Library/Application Support/GIMP/3.0/`
3. Inicie o GIMP (ele criará as configurações padrão)
4. Tente instalar o PhotoGIMP novamente, seguindo todos os passos cuidadosamente

### O ícone/nome não mudou (apenas Linux)

**Solução:**
1. Certifique-se de ter copiado a pasta `.local` para seu diretório home
2. Atualize o banco de dados do desktop:
   ```bash
   update-desktop-database ~/.local/share/applications/
   ```
3. Para Flatpak, o ícone pode não mudar em alguns ambientes desktop - isso é esperado

### Erro: "Permissão negada" ou "Acesso negado"

**Solução:**
- **Windows:** Execute o Explorador de Arquivos como administrador, ou verifique se o GIMP está em execução
- **Linux/macOS:** Verifique as permissões dos arquivos. Você não deve precisar de sudo para arquivos de configuração de usuário
- Certifique-se de que o GIMP está completamente fechado antes de copiar os arquivos

### Como desinstalar o PhotoGIMP

**Para restaurar o GIMP ao padrão:**
1. Se você criou um backup, restaure-o copiando de volta para a pasta de configuração do GIMP
2. Se você não criou um backup:
   - Feche o GIMP completamente
   - Delete a pasta de configuração do GIMP (locais listados acima)
   - Inicie o GIMP - ele criará uma configuração padrão nova

### Ainda tendo problemas?

1. Verifique as [Issues do GitHub](https://github.com/Diolinux/PhotoGIMP/issues) existentes - seu problema pode já ter sido resolvido
2. Crie uma nova issue usando o template "Installation Help"
3. Inclua: Seu SO, versão do GIMP, mensagem de erro exata e os passos que você seguiu

## Créditos

* Este projeto não seria possível sem a incrível equipe do GIMP.
* Um GRANDE obrigado a todos os apoiadores do Diolinux no [YouTube](https://youtube.com/Diolinux).
* Tela inicial e ícones de [Adriel Filipe Design](https://bento.me/adrielfilipedesign)

## Contribuidores
<a align="center" href="https://github.com/Diolinux/PhotoGIMP/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=Diolinux/PhotoGIMP" />
</a>
