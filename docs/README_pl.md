# 🎨 PhotoGIMP

<img src="../.local/share/icons/hicolor/256x256/256x256.png" align="right" alt="PhotoGimp application icon" title="PhotoGimp application icon">

Prosta modyfikacja do GIMP-a 3.0+, aby pomóc użytkownikom Adobe Photoshop, zawierająca funkcje takie jak:

* Zmiana położenia narzędzi, podobna do Adobe Photoshop-a;
* Nowy Ekran Ładowania;
* Nowe domyślne ustawienia, zwiększające przestrzeń roboczą;
* Skróty klawiaturowe, przypominające z Photoshop-a, wzorowane na dokumentacji Adobe;
* Nowa ikona i nazwa dla dowolnego pliku .desktop.

## 📷 Zrzuty Ekranu

<p>
  <img src="../.config/GIMP/3.0/splashes/splash-screen-2025-v2.png" alt="PhotoGIMP Diolinux Splash Art">
  <em>PhotoGIMP Diolinux Splash Art</em>
</p>

<p>
  <img src="../screenshots/photogimp_3_-_diolinux.png" alt="PhotoGIMP 3">
  <em>GIMP 3.0 z zastosowanym patchem PhotoGIMP</em>
</p>

## ⚙ Jak Zainstalować

Ten patch został pierwotnie opracowany do pracy z wersją Flatpak GIMP-a dla Linuxa, ale może być używany w prawie każdym formacie pakietu bez ograniczeń, poprzez wyodrębnienie plików do odpowiednich folderów.

### Instalacja skryptem (beta)

- **Linux/macOS:**
   ```bash
   chmod +x install.sh
   ./install.sh
   ```
- **Windows (PowerShell):**
   ```powershell
   powershell -ExecutionPolicy Bypass -File install.ps1
   ```

Skrypty tworzą kopię zapasową z datą/czasem Twojej obecnej konfiguracji `3.0` GIMP-a przed zastosowaniem PhotoGIMP.

### Flatpak (Linux)

Aby zainstalować najnowszą wersję PhotoGIMP na swoim systemie Linux używając Flatpak, wykonaj następujące proste kroki:

<img src="https://skillicons.dev/icons?i=linux" align="right" width="40" />

1. Upewnij się, że masz już zainstalowany GIMP [z Flathub](https://flathub.org/apps/org.gimp.GIMP);
2. **Uruchom i zamknij GIMP-a po instalacji przed kontynuowaniem!**
3. Pobierz pliki z tego repozytorium [lub kliknij tutaj](https://github.com/Diolinux/PhotoGIMP/releases/download/3.0/PhotoGIMP-linux.zip);
4. Rozpakuj zawartość pliku zip do folderu domowego (`.config` i `.local` - to są ważne) i nadpisz pliki jeśli to konieczne;
5. Gotowe, ciesz się! :smile:

<hr>

### Windows

<img src="https://skillicons.dev/icons?i=windows" align="right" />

Aby zainstalować najnowszą wersję PhotoGIMP na Windows:

1. Upewnij się, że masz już zainstalowany [GIMP ze strony oficjalnej](https://www.gimp.org/downloads/);
2. **Uruchom i zamknij GIMP-a po instalacji przed kontynuowaniem!**
3. Pobierz pliki z tego repozytorium lub [kliknij tutaj](https://github.com/Diolinux/PhotoGIMP/releases/download/3.0/PhotoGIMP.zip);
4. Rozpakuj zawartość pliku `PhotoGIMP.zip` do folderu według własnego wyboru;
5. Skopiuj folder `3.0`;
6. Przytrzymaj klawisz <kbd>Windows</kbd> i naciśnij <kbd>R</kbd>, aby otworzyć okno dialogowe *Uruchom*;
7. Wpisz `%APPDATA%\GIMP` w oknie dialogowym i naciśnij <kbd>Enter</kbd>;
8. Wklej folder `3.0` do folderu GIMP-a, który właśnie otworzyłeś;
9. Gdy pojawi się pytanie o istniejące pliki, wybierz "Zastąp pliki w miejscu docelowym";
10. Gotowe, ciesz się! :smile:

:bulb: Wskazówki:
- Opcjonalnie możesz również pobrać [photogimp.ico](https://github.com/Diolinux/PhotoGIMP/releases/download/3.0/photogimp.ico) i zaktualizować ikonę skrótu w `%appdata%\Microsoft\Windows\Start Menu\Programs\GIMP 3.0.0`;
- Jeśli chcesz wykonać kopię zapasową swoich obecnych ustawień GIMP-a przed instalacją PhotoGIMP, skopiuj cały folder `3.0` z `%APPDATA%\GIMP` w bezpieczne miejsce przed kontynuowaniem instalacji.

### macOS

<img src="https://skillicons.dev/icons?i=macos" align="right" />

Aby zainstalować najnowszą wersję PhotoGIMP na macOS:

1. Upewnij się, że masz już zainstalowany [GIMP ze strony oficjalnej](https://www.gimp.org/downloads/);
2. **Uruchom i zamknij GIMP-a po instalacji przed kontynuowaniem!**
3. Pobierz pliki z tego repozytorium lub [kliknij tutaj](https://github.com/Diolinux/PhotoGIMP/releases/download/3.0/PhotoGIMP.zip);
4. Rozpakuj zawartość pliku `PhotoGIMP.zip` do folderu według własnego wyboru;
5. Skopiuj folder `3.0`;
6. Otwórz Finder, naciśnij <kbd>Cmd</kbd> + <kbd>Shift</kbd> + <kbd>G</kbd>, aby otworzyć "Idź do folderu";
7. Wpisz `~/Library/Application Support/GIMP` i naciśnij <kbd>Enter</kbd>;
8. Jeśli masz folder `2.10` z poprzedniej instalacji, usuń go, aby uniknąć konfliktów;
9. Wklej folder `3.0` do folderu GIMP;
10. Gdy pojawi się pytanie o istniejące pliki, wybierz "Zastąp" lub "Scal";
11. Gotowe, ciesz się! :smile:

:bulb: Wskazówki:
- Jeśli chcesz wykonać kopię zapasową swoich obecnych ustawień GIMP-a przed instalacją PhotoGIMP, skopiuj cały folder GIMP z `~/Library/Application Support/GIMP` w bezpieczne miejsce przed kontynuowaniem instalacji.
## ⚠ Rozwiązywanie Problemów

### PhotoGIMP nie ładuje się / GIMP wygląda tak samo

**Rozwiązanie:**
1. Upewnij się, że uruchomiłeś GIMP-a przynajmniej raz przed instalacją PhotoGIMP
2. Sprawdź, czy pliki są we właściwej lokalizacji:
   - **Windows:** `%APPDATA%\GIMP\3.0\` powinien zawierać foldery takie jak `themes`, `splashes`, itp.
   - **Linux (Flatpak):** `~/.var/app/org.gimp.GIMP/config/GIMP/3.0/`
   - **Linux (natywny):** `~/.config/GIMP/3.0/`
   - **macOS:** `~/Library/Application Support/GIMP/3.0/`
3. Uruchom ponownie GIMP-a całkowicie (zamknij wszystkie okna)
4. Sprawdź, czy ekran powitalny pokazuje "PhotoGIMP" podczas uruchamiania GIMP-a

### Skróty klawiaturowe nie działają

**Rozwiązanie:**
1. Sprawdź, czy plik `shortcutsrc` istnieje w folderze konfiguracji GIMP-a
2. Niektóre skróty mogą kolidować ze skrótami systemowymi
3. Możesz dostosować skróty w GIMP: Edycja > Skróty Klawiaturowe
4. Upewnij się, że używasz właściwego klawisza modyfikatora:
   - Windows/Linux: `Ctrl`
   - macOS: `Cmd` (Command)

### GIMP nie uruchamia się po instalacji PhotoGIMP

**Rozwiązanie:**
1. Przywróć kopię zapasową (jeśli ją utworzyłeś)
2. Lub usuń folder konfiguracji GIMP-a i zainstaluj ponownie:
   - **Windows:** Usuń `%APPDATA%\GIMP\3.0\`
   - **Linux:** Usuń `~/.config/GIMP/3.0/` lub `~/.var/app/org.gimp.GIMP/config/GIMP/3.0/`
   - **macOS:** Usuń `~/Library/Application Support/GIMP/3.0/`
3. Uruchom GIMP-a (utworzy domyślną konfigurację)
4. Spróbuj zainstalować PhotoGIMP ponownie, dokładnie wykonując wszystkie kroki

### Ikona/nazwa nie zmieniła się (tylko Linux)

**Rozwiązanie:**
1. Upewnij się, że skopiowałeś folder `.local` do katalogu domowego
2. Zaktualizuj bazę danych pulpitu:
   ```bash
   update-desktop-database ~/.local/share/applications/
   ```
3. Dla Flatpak, ikona może nie zmienić się w niektórych środowiskach pulpitu - to jest oczekiwane

### Błąd: "Odmowa dostępu" lub "Access denied"

**Rozwiązanie:**
- **Windows:** Uruchom Eksplorator plików jako administrator lub sprawdź, czy GIMP jest uruchomiony
- **Linux/macOS:** Sprawdź uprawnienia plików. Nie powinieneś potrzebować sudo dla plików konfiguracyjnych użytkownika
- Upewnij się, że GIMP jest całkowicie zamknięty przed kopiowaniem plików

### Jak odinstalować PhotoGIMP

**Aby przywrócić GIMP do ustawień domyślnych:**
1. Jeśli utworzyłeś kopię zapasową, przywróć ją, kopiując z powrotem do folderu konfiguracji GIMP-a
2. Jeśli nie utworzyłeś kopii zapasowej:
   - Zamknij GIMP-a całkowicie
   - Usuń folder konfiguracji GIMP-a (lokalizacje wymienione powyżej)
   - Uruchom GIMP-a - utworzy świeżą domyślną konfigurację

### Nadal masz problemy?

1. Sprawdź istniejące [GitHub Issues](https://github.com/Diolinux/PhotoGIMP/issues) - Twój problem mógł już zostać rozwiązany
2. Utwórz nowe zgłoszenie używając szablonu "Installation Help"
3. Dołącz: Twój system operacyjny, wersję GIMP-a, dokładny komunikat błędu i kroki, które wykonałeś
## Podziękowania

* Ten projekt nie byłby możliwy bez wspaniałego zespołu GIMP-a.
* Wielkie podziękowania dla wszystkich zwolenników Diolinux na [YouTube](https://youtube.com/Diolinux).
* Ekran powitalny i ikony od [Adriel Filipe Design](https://bento.me/adrielfilipedesign)

## Współtwórcy
<a align="center" href="https://github.com/Diolinux/PhotoGIMP/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=Diolinux/PhotoGIMP" />
</a>
