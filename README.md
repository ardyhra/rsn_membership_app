# RSN Membership Web App

Sistem manajemen keanggotaan berbasis web menggunakan **Serverpod** sebagai backend dan **Jaspr** sebagai frontend. Sistem ini memiliki role **Admin**, **Sales**, dan **Member**, serta role **Superadmin**.

---

## Teknologi yang Digunakan
- **Backend**: [Serverpod](https://serverpod.dev)
- **Frontend**: [Jaspr](https://jaspr.dev)
- **Database**: PostgreSQL

---

## Struktur Proyek

```plaintext
project/
├── membership_app_server/     # Backend (Serverpod)
├── membership_app_client/     # Client API untuk backend
├── frontend/                  # Frontend (Jaspr)
```

## Setup Proyek
### Instalasi Awal
- Dart
Install Dart SDK dengan mengikuti petunjuk pada https://dart.dev/get-dart

(Rekomendasi : Melakukan instalasi Flutter yang sudah include dengan Dart SDK : https://docs.flutter.dev/get-started/install/windows/web)
- Buat direktori proyek baru
- Install Jaspr melalui CMD atau terminal
```bash
dart pub global activate jaspr
```
Lalu, Tambahkan folder bin Jaspr ke PATH atau Environment Variables (biasanya di C:\Users\User_name\AppData\Local\Pub\Cache\bin)
- Install Serverpod melalui CMD atau terminal
```bash
dart pub global activate serverpod
```
- PostgreSQL
Install PostgreSQL

https://www.enterprisedb.com/postgresql-tutorial-resources-training-1?uuid=69f95902-b451-4735-b7e4-1b62209d4dfd&campaignId=postgres_rc_17

Lalu install Tools DB, bisa menggunakan DBeaver (https://dbeaver.io/files/dbeaver-ce-latest-x86_64-setup.exe). Buat new connection. Konfigurasi username dan password, lalu buat database Postgres baru.

Tambahkan folder bin dari postgres (Biasanya di C:\Program Files\PostgreSQL\17\bin) ke PATH atau Environment Variables.

- Migrasi Database
Cara 1 :
Download file dump postgresql di repo (membership-postgres-202504161633.sql). Buka Dbeaver. Masuk ke database baru yang masih kosong. Lakukan import dengan klik kanan di database > Tools > Execute Script > Pilih Input file dump > Start > Tunggu sampai proses selesai. 

Cara 2 (jika execute script tidak bisa) :
Setelah download file dump. Buka Command Prompt lalu jalankan 
```bash
pg_restore -h localhost -p 5432 -U username -d db_name file_path
# contoh : pg_restore -h localhost -p 5432 -U postgres -d postgres "C:\Users\ASUS TUF\Documents\membership-postgres-202504161633.sql"
```


### Konfigurasi Backend
1. Masuk ke folder backend
```bash
cd membership_app_server
```
2. Update dependencies
```bash
dart pub get
```
3. Perbarui konfigurasi pada file config/development.yaml sesuai database yang dibuat 
```bash
# contoh
database:
  host: localhost
  port: 5432
  name: rsn_membership
  user: postgres
  password: your_password
```
4. Tambahkan file password.yaml di config (minta ke author)

5. Jika ada perubahan yang dilakukan, lakukan generate kode serverpod
```bash
serverpod generate
```
```bash
# Jika ada perubahan pada model database di lib/src/models

serverpod create-migration 
```
6. Aktivasi server backend
```bash
dart bin/main.dart
```
```bash
# Jika ingin sekaligus migrasi database (tidak perlu jika sudah berhasil import database dan isinya dari file dump, kecuali ada perubahan)
dart bin/main.dart --apply-migrations
```
### Konfigurasi Frontend
1. Masuk ke folder frontend
```bash
cd frontend
```
2. Instalasi dependensi
```bash
dart pub get
```
3. Aktivasi server frontend
```bash
# Sesuaikan dengan port yang terbuka
jaspr serve --port 8083
```
4. Masuk ke tampilan frontend melalui http://localhost:8083/login


