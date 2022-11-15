# README Tugas

## Tugas 7

**Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.**
Stateless widget merupakan widget yang tidak berubah pada interface, seperti Text atau Icon. Stateful widget merupkan widget yang bisa berubah jika user berinteraksi dengan widget tersebut.

**Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.**
- Text widget untuk menampilkan dan styling text.
- Center widget untuk menampilkan child elementsnya secara center.
- FloatingActionButton yang memanggil sebuah fungsi jika dipencet.
- Icon widget yang menampilkan sebuah icon

**Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.**
Memanggil setState menginformasikan Flutter bahwa state dari objek telah berubah dan mempengaruhi interface sehingga harus melakukan build ulang agar perubahan tersebut terlihat. Variabel _counter, _text, dan genap.

**Jelaskan perbedaan antara const dengan final.**
Objek const harus diassign ke sebuah data yang sudah ada pada saat compiling, sementara final dapat digunakan jika data diambil saat run-time. Misal, datetime tidak dapat digunakan untuk variabel const karena nilai tersebut dikalkulasikan saat run-time.

**Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.**
- Melakukan flutter create untuk melakukan proyek baru, membuka lib/main.dart
- Inisialisasi variabel _counter, _text, dan genap.
- Membuat fungsi increment dan decrement untuk counter.
- Menambahkan Text dan color menggunakan TextStyle untuk warna merah jika genap dan biru jika ganjil.
- Menambahkan FloatingActionButton yang menyambung ke fungsi increment/decrement jika onPressed.

## Tugas 8
