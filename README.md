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

**Jelaskan perbedaan Navigator.push dan Navigator.pushReplacement.**
Navigator.push menambahkan route baru dan dapat kembali ke halaman sebelumnya menggunakan pop.
Navigator.pushReplacement menggantikan route yang sekarang dan tidak dapat kembali ke halaman sebelumnya karena setelah push route yang diberikan, route yaang sebelumnya di-remove.

**Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.**
- Form yang menciptakan container untuk fields form
- List yang menyimpan object Budget dan List yang menyimpan Widgets
- Navigator untuk melakukan navigasi terhadap route atau halaman
- Column dan Row untuk menampilkan widget secara vertical atau horizontal
- DropdownButton untuk menciptakan dropdown

**Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed).**
- onSaved ketika data telah disimpan
- onChanged ketika value field berubah
- onPressed ketika sebuah button dipencet

**Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.**
Widget Navigator menyimpan halaman atau route yang dinavigasi sebagai sebuah stack. Untuk memanggil halaman baru, Navigator diakses melalui BuildContext dan menanggil fungsi push atau pop.

**Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.**
- Membuat halaman form
- Handle input dari user menggunakan fields form dan menyimpannya ke dalam List object Budget
- Membuat halaman data dan membuat list yang menyimpan widgets
- Mengiterasikan List yang terdiri atas Budget dan membuat Container widget untuk setiap budget, ditampilkan pada halaman data
- Melakukan routing untuk setiap halaman menggunakan Navigator dan mempassing data pada parameternya.

## Tugas 9

**Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?**
Pengambilan daa JSON tanpa membuat model terlebih dahulu memungkinkan. Namun, data yang diambil tanpa model berarti tidak diinisiasi sebagai sebuah class dengan fields. Oleh karena itu, menjadi lebih inefisien.

**Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.**
- FutureBuilder : menambahkan widget berdasarkan data yang difetch menggunakan async function
- persistentFooterButtons yang menampilkan button di paling bawah Scaffold
- Row : menampilkan children widget secara horizontal
- Column : menampilkan children widget secara vertical
- GestureDetector : menciptakan widget yang mendeteksi gestures seperti onTap
- Navigator : melakukan routing antar page

**Jelaskan mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter.**
1. Menambahkan dependency http pada pubspec.yaml
2. Membuat model dengan fields yang sesuai dari data JSON yang akan di-GET
3. Melakukan fetch data dengan HTTP Request GET dan melakukan konversi data json menjadi object
4. Menampilkan data menggunakan FutureBuilder

**Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.**
1. Menambahkan dependency http dan melakukan import
2. Membuat model WatchList
3. Membuat page MyWatchList dan MyWatchListDetail, melakukan routing dan menyambungkan MyWatchList ke drawer
4. Melakukan fecthing data JSON, melakukan konversi data JSON menjadi object WatchList
5. Menampilkan data yang telah dikonversi ke aplikasi dengan FutureBuilder 