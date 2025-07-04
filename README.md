# Mood Journal App

Aplikasi Flutter sederhana yang memungkinkan pengguna mencatat suasana hati harian. Mood Journal dilengkapi fitur autentikasi, penyimpanan data ke cloud, serta penyimpanan session agar pengguna tidak perlu login ulang setiap kali membuka aplikasi.

## Fitur

- Autentikasi menggunakan Firebase (email dan password)
- Menyimpan data mood ke Firebase Firestore
- Menyimpan session login menggunakan SharedPreferences
- Halaman onboarding (Get Started) untuk pengguna baru
- Navigasi halaman yang rapi dan terstruktur

## Langkah Install dan Build

1. Clone repositori ini:
git clone https://github.com/c14210053/UAS-AMBW---C14210053.git
cd UAS-AMBW---C14210053

2. Install dependencies:
flutter pub get

3. Setup Firebase:
- Buat project di https://console.firebase.google.com/
- Unduh file `google-services.json` dan simpan di folder `android/app/`
- Jalankan perintah:
  ```
  flutterfire configure
  ```

4. Jalankan aplikasi:
flutter run

## Teknologi yang Digunakan

- Flutter (framework utama)
- Firebase Authentication (login)
- Cloud Firestore (penyimpanan data mood)
- SharedPreferences (session persistence)
- Library: `firebase_core`, `firebase_auth`, `cloud_firestore`, `shared_preferences`

## Dummy User untuk Uji Login

Untuk keperluan uji coba, gunakan akun berikut:

- Email: dummy123@gmail.com  
- Password: 1234567890
