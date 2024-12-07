# Flutter Navigation Codelab
Proyek ini merupakan aplikasi Flutter multi-layar yang menggunakan named routes untuk navigasi antar layar. Aplikasi ini memiliki tiga layar utama (FirstScreen, SecondScreen, dan ThirdScreen) serta sebuah Drawer untuk navigasi cepat ke setiap layar.

# Fitur
Navigasi antar layar menggunakan named routes.

Drawer untuk akses mudah ke setiap layar.

Tombol untuk kembali atau berpindah ke layar lain.

Kemampuan untuk kembali langsung ke layar pertama atau layar sebelumnya.

# Daftar Layar
1. First Screen:

    - Layar pertama dan utama aplikasi.

    - Memiliki tombol untuk navigasi ke Second Screen.

    - Terdapat Drawer untuk akses ke semua layar.

2. Second Screen:

    - Memiliki tombol untuk navigasi ke Third Screen.

    - Terdapat tombol back untuk kembali ke Screen sebelumnya

3. Third Screen:

    - Memiliki tombol untuk berpindah ke First Screen.

    - Terdapat tombol back untuk kembali ke Screen sebelumnya

# Panduan Instalasi
Ikuti langkah-langkah berikut untuk menjalankan aplikasi:

## 1. Prasyarat
Pastikan Anda telah menginstal:

Flutter SDK: Instal 

IDE: Visual Studio Code, Android Studio, atau editor teks lain yang mendukung Flutter.

## 2. Clone Repository
Clone proyek ini ke komputer Anda:
```bash
git clone https://github.com/username/flutter-navigation-codelab.git

cd flutter-navigation-codelab
```
## 3. Jalankan Aplikasi
Jalankan perintah berikut untuk memulai aplikasi:
```bash
flutter pub get

flutter run
```
## 4. Pengujian Aplikasi
Aplikasi dimulai di First Screen.

Gunakan tombol atau Drawer untuk navigasi antar layar.

Uji alur navigasi:

First → Second → Third

Second → First

Third → First atau Third → Second.

# Cara Menggunakan
## Navigasi Menggunakan Tombol
1. Pada First Screen, klik tombol untuk menuju ke Second Screen.

2. Pada Second Screen, klik:
    - tombol untuk menuju ke Third Screen.
    - back untuk ke layar sebelumnya.

3. Pada Third Screen, klik:

    - tombol untuk menuju ke layar pertama.
    - back untuk ke layar sebelumnya.

## Navigasi Menggunakan Drawer
1. Buka Drawer di layar pertama.

2. Pilih layar yang ingin Anda navigasikan langsung.

# Tantangan dan Solusi
## 1. Implementasi Drawer
Tantangan: Memberikan akses cepat ke semua layar.

Solusi: Menambahkan Drawer pada setiap layar dengan ListTile untuk setiap route.

# Pendekatan Kode
## 1. Definisi Named Routes
Named routes didefinisikan di main.dart menggunakan parameter routes dalam widget MaterialApp. Named routes memberikan struktur yang lebih bersih dan mudah untuk mengelola navigasi di seluruh aplikasi.

```dart
MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => FirstScreen(),
    '/second': (context) => SecondScreen(),
    '/third': (context) => ThirdScreen(),
  },
);
```
## 2. Navigasi Antar Layar
Navigasi dilakukan menggunakan fungsi berikut:

- Untuk pindah ke layar baru:
```dart
Navigator.pushNamed(context, '/second');
```
- Untuk kembali ke layar sebelumnya:
```dart
Navigator.pop(context);
```
- Untuk kembali langsung ke layar pertama:
```dart
Navigator.popUntil(context, ModalRoute.withName('/'));
```
## 3. Drawer untuk Navigasi Cepat
Setiap layar dilengkapi dengan Drawer yang memungkinkan pengguna berpindah ke layar mana pun dengan cepat tanpa harus kembali ke layar sebelumnya terlebih dahulu. Drawer didefinisikan dengan widget ListTile untuk setiap layar.

```dart
drawer: Drawer(
  child: ListView(
    children: [
      ListTile(
        title: const Text('First Screen'),
        onTap: () {
          Navigator.pushNamed(context, '/');
        },
      ),
      ListTile(
        title: const Text('Second Screen'),
        onTap: () {
          Navigator.pushNamed(context, '/second');
        },
      ),
      ListTile(
        title: const Text('Third Screen'),
        onTap: () {
          Navigator.pushNamed(context, '/third');
        },
      ),
    ],
  ),
),
```

