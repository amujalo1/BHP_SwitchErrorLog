# BHP_SwitchErrorLog

## 🛠️ Opis
**BHP_SwitchErrorLog** je alat razvijen tokom prakse u Cisco odjelu BHPoste, s ciljem detekcije i prikaza grešaka u mrežnom prometu. Projekat je osmišljen za rad s **SolarWinds** softverom, koristeći lokalnu bazu Syslog podataka za analizu i identifikaciju kritičnih interfejsa ili mrežnih uređaja, poput switch-eva.

SolarWinds server automatski prenosi Syslog podatke na lokalni računar prilikom povezivanja s mrežom, čime se omogućava rad s bazom podataka. Pošto nije bilo moguće direktno mijenjati SolarWinds bazu, dodana je dopunska tabela za privremenu pohranu podataka, koja se redovno ažurira i čisti koristeći **Task Scheduler** u kombinaciji s **BAT** i **PowerShell** skriptama.

Ova aplikacija je implementirana kao web sajt korištenjem **Visual Studio** alata, s dodatnim funkcionalnostima za pregled i analizu mrežnog prometa, upravljanje greškama i prikaz kritičnih switch-eva.

---

## 📂 Struktura Projekta
- **`SwitchDeviceStatus`**: Visual Studio projekat (web aplikacija).
- **`Slikice`**: Slike izvorne web aplikacije (prikazi funkcionalnosti).
- **`SQLSkripte`**: Sve bitne SQL skripte za rad s dopunskom tabelom.
- **`TSkripte`**: BAT i PowerShell skripte koje pokreću SQL procedure za ažuriranje podataka.

---

## ⚙️ Funkcionalnosti
1. **Prikaz mrežnih grešaka:**
   - Detekcija najkritičnijih grešaka u mrežnom prometu.
   - Identifikacija problematičnih interfejsa i switch-eva.

2. **Rad s dopunskom tabelom:**
   - Periodično ažuriranje i brisanje zastarjelih podataka.
   - Koristi se kombinacija BAT i PowerShell skripti preko **Task Schedulera**.

3. **Integracija sa SolarWinds:**
   - Analiza Syslog podataka iz lokalne baze koju automatski prenosi SolarWinds server.

4. **Web aplikacija:**
   - Pregled podataka kroz web interfejs.
   - Prikaz mrežnih grešaka u realnom vremenu.

---

## 🖼️ Izgled Aplikacije
Unutar direktorija **`Slikice`** nalaze se slike koje prikazuju izgled i funkcionalnosti izvorne web aplikacije.

---

## 🔑 Tehnologije
- **Visual Studio**: Za razvoj web aplikacije (starija verzija korištena tokom prakse).
- **SQL Server**: Za rad s dopunskom tabelom i Syslog podacima.
- **SolarWinds**: Softver za prikupljanje i lokalno skladištenje Syslog podataka.
- **Task Scheduler**: Automatsko pokretanje BAT i PowerShell skripti.

---

## 🎯 Cilj
Cilj ovog projekta je osigurati pouzdano i efikasno rješenje za detekciju mrežnih grešaka i upravljanje kritičnim podacima u mrežnom prometu za BHPoste.

---

## ✍️ Autor
**Ime i Prezime**  
Student Fakulteta elektrotehnike, Sarajevo  
GitHub profil: [Vaš GitHub Username](https://github.com/amujalo1)  

📧 Kontakt: **amujalo1@etf.unsa.ba**

---

## 🚀 Pokretanje Projekta
1. Klonirajte repozitorij:
   ```bash
   git clone https://github.com/VasGitHubUsername/BHP_SwitchErrorLog.git
