# mewwing-mobile

- Nama: Muhammad Afwan Hafizh
- NPM: 2306208855
- Kelas: PBP-F

<details>
  <summary><b>Tugas 7: Elemen Dasar Flutter</b></summary>

1. **Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.**

   Stateless Widget adalah widget yang sifatnya statis atau tidak dapat berubah setelah dibuat (immutable). Widget ini tidak memiliki state internal yang dapat dimodifikasi selama masa hidupnya. Artinya, setelah widget ini dirender, tampilan dan propertinya akan tetap sama sampai widget tersebut dihapus atau diganti. Stateless Widget cocok digunakan untuk UI yang tidak memerlukan perubahan data secara dinamis, seperti teks statis, ikon, atau tampilan yang hanya menampilkan data tanpa interaksi pengguna.
   Sementara itu, Stateful Widget adalah widget yang bersifat dinamis dan dapat berubah (mutable). Widget ini memiliki state internal yang dapat dimodifikasi menggunakan setState(), yang akan memicu proses rebuild widget ketika terjadi perubahan state. Stateful Widget sangat berguna untuk membangun UI yang interaktif dan memerlukan perubahan data secara real-time, seperti form input, counter, atau tampilan yang perlu diperbarui berdasarkan interaksi pengguna atau perubahan data dari backend.

2. **Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.**

   - MyApp (StatelessWidget) = Widget utama yang menginisialisasi aplikasi dan mengatur tema serta konfigurasi dasar.
   - MyHomePage (StatefulWidget) = Halaman utama aplikasi yang dapat berubah state-nya; Menampilkan daftar produk dan kategori; Memiliki bottom navigation bar
   - _MyHomePageState (State) = Mengatur state dari MyHomePage; Mengelola _selectedIndex untuk bottom navigation; Membangun UI utama aplikasi
   - Product (Class) = Class untuk menyimpan data produk; Berisi properti name, price, category, dan image
   - ProductCard (StatelessWidget) = Widget untuk menampilkan card produk; Menampilkan gambar, kategori, nama, dan harga produk
   - _buildCategoryCard (Widget Method) = Method yang menghasilkan widget card kategori; Menampilkan icon dan nama kategori; Digunakan dalam MyHomePage untuk membuat kategori cards
   
3. **Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.**

   Fungsi setState() digunakan untuk memberitahu framework Flutter bahwa ada perubahan state (data) dalam widget, sehingga Flutter akan melakukan rebuild pada widget tersebut untuk memperbarui tampilan UI sesuai dengan state yang baru. Variabel yang terdampak yaitu ```_selectedIndex```
    ```
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
      ...
    }
    ```
    - Variabel ini berubah ketika user menekan item di bottom navigation bar
    - Perubahan nilai akan mengubah tampilan bottom navigation bar (item mana yang aktif)
    - Nilai awal: 0

4. **Jelaskan perbedaan antara const dengan final.**

   Penggunaan ```const``` dalam mengharuskan nilai diketahui pada saat compile time (sebelum program dijalankan) dan bersifat deeply immutable, yang berarti tidak dapat diubah hingga ke level terdalam. Nilai const menggunakan memory yang lebih efisien karena nilainya sudah fix saat compile. Contoh penggunaan const yaitu seperti mendefinisikan warna ```const Color(0xFF2C5F2D)```, durasi ```const Duration(seconds: 1)```, atau style const ```TextStyle(fontSize: 16)```.
   Sementara itu, final lebih fleksibel karena nilai dapat diinisialisasi saat runtime (ketika program dijalankan) meskipun setelah diinisialisasi nilai tidak dapat diubah (immutable). final juga dapat menampung objek yang mutable, artinya isi objek masih bisa dimodifikasi meski referensinya tidak bisa diubah. Contoh penggunaan final yaitu seperti mendefinisikan nama toko ```final String storeName = 'Mewwing E-Commerce'```, list produk ```final List<Product> products = [...]``` yang artinya isi list masih bisa dimodifikasi, atau produk final Product product yang bisa diisi dari constructor.

5. **Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.**
   
   - Membuat sebuah program Flutter baru dengan tema E-Commerce yang sesuai dengan tugas-tugas sebelumnya.
     
     1. Buka text editor pilihan, lalu buka terminal.
     2. Jalankan command berikut pada direktori pilihan.
        
        ```flutter create mewwing_mobile```
        
     3. Setelah menjalankan command tersebut, jalankan command
        
        ```flutter run```
        
     4. Apabila berhasil dijalankan, maka artinya pengembangan program flutter dapat dilakukan.

   - Membuat tiga tombol sederhana dengan ikon dan teks untuk:
     - Melihat daftar produk (Lihat Daftar Produk)       
     - Menambah produk (Tambah Produk)       
     - Logout (Logout)
       
     ```
     int _selectedIndex = 0;
     ```
     Menyimpan state index tombol yang aktif.
  
     ```
     bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: List.generate(3, (index) {
        IconData icon;
        String label;
        
        switch (index) {
          case 0:                            // Implementasi tombol Lihat Daftar Produk
            icon = Icons.shop;
            label = 'Lihat Daftar Produk';
            break;
          case 1:                            // Implementasi tombol Tambah Produk
            icon = Icons.add_shopping_cart;  
            label = 'Tambah Produk';
            break;
          case 2:                            // Implementasi tombol Logout
            icon = Icons.logout;
            label = 'Logout';
            break;
          default:
            icon = Icons.error;
            label = 'Error';
        }
        
        return BottomNavigationBarItem(
          icon: Icon(
            icon,
            color: _selectedIndex == index ? _itemColors[index] : Colors.grey,
          ),
          label: label,
        );
      }),
      currentIndex: _selectedIndex,
      selectedItemColor: _itemColors[_selectedIndex],
      unselectedItemColor: Colors.grey,
      onTap: _onItemTapped,
      )
     ```
     Pada code dari line ```icon: Icon(...``` hingga ```onTap: _onItemTapped,..``` berfungsi sebagai konfigurasi tampilan untuk setiap item dalam ```BottomNavigationBar```. Dengan operator ternary ```(_selectedIndex == index ? _itemColors[index] : Colors.grey)```, kode ini mengatur warna ikon berdasarkan status aktif/tidaknya item tersebut. Jika item sedang aktif (selectedIndex sama dengan index item), warna ikon akan mengambil dari ```array _itemColors``` sesuai indeksnya (hijau untuk Lihat Produk, kuning untuk Tambah Produk, merah untuk Logout), tetapi jika tidak aktif, warna akan menjadi abu-abu (Colors.grey). ```currentIndex``` digunakan untuk menandakan item mana yang sedang aktif, ```selectedItemColor``` menentukan warna teks saat item dipilih (menggunakan warna dari _itemColors), dan unselectedItemColor menentukan warna teks saat item tidak dipilih (abu-abu). Fungsi ```onTap: _onItemTapped``` akan dijalankan untuk menangani interaksi user.
       
    - Mengimplementasikan warna-warna yang berbeda untuk setiap tombol (Lihat Daftar Produk, Tambah Produk, dan Logout).
        ```
        final List<Color> _itemColors = [
          const Color(0xFF2C5F2D), 
          const Color(0xFFFFB200),
          Colors.red,           
        ];
  
        ...
  
        currentIndex: _selectedIndex,
        selectedItemColor: _itemColors[_selectedIndex],
        unselectedItemColor: Colors.grey,
  
        ...
        ```
       Definisikan warna pada setiap tombol ketika diklik. Jika item sedang aktif (selectedIndex sama dengan index item), warna ikon akan mengambil dari ```array _itemColors``` sesuai indeksnya (hijau untuk Lihat Produk, kuning untuk Tambah Produk, merah untuk Logout), tetapi jika tidak aktif, warna akan menjadi abu-abu (Colors.grey).

   - Memunculkan Snackbar dengan tulisan:
       - "Kamu telah menekan tombol Lihat Daftar Produk" ketika tombol Lihat Daftar Produk ditekan.
       - "Kamu telah menekan tombol Tambah Produk" ketika tombol Tambah Produk ditekan.
       - "Kamu telah menekan tombol Logout" ketika tombol Logout ditekan.

       ```
       void _onItemTapped(int index) {
        setState(() {
          _selectedIndex = index;
        });
      
        String message = "";
        switch (index) {
          case 0:        \\ Implementasi "Kamu telah menekan tombol Lihat Daftar Produk" ketika tombol Lihat Daftar Produk ditekan.
            message = "Kamu telah menekan tombol Lihat Daftar Produk!";
            break;
          case 1:        \\ Implementasi "Kamu telah menekan tombol Tambah Produk" ketika tombol Tambah Produk ditekan.
            message = "Kamu telah menekan tombol Tambah Produk!";
            break;
          case 2:        \\ Implementasi "Kamu telah menekan tombol Logout" ketika tombol Logout ditekan.
            message = "Kamu telah menekan tombol Logout!";
            break;
        }
        
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(message),
              duration: const Duration(seconds: 1),
              backgroundColor: _itemColors[index],
            ),
          );
      }
       ```
       Fungsi ini adalah method yang dipanggil ketika pengguna menekan salah satu item di ```BottomNavigationBar```. Saat dipanggil, fungsi ini menerima parameter index yang menunjukkan posisi item yang ditekan (0 untuk Lihat Daftar Produk, 1 untuk Tambah Produk, 2 untuk Logout). Pertama, fungsi menggunakan ```setState``` untuk memperbarui nilai ```_selectedIndex``` agar UI dapat diperbarui sesuai item yang dipilih. Kemudian, menggunakan struktur switch-case, fungsi menentukan pesan yang sesuai berdasarkan index item yang ditekan. Terakhir, fungsi menampilkan Snackbar (notifikasi pop-up di bagian bawah layar) menggunakan ```ScaffoldMessenger``` yang menampilkan pesan sesuai tombol yang ditekan, dengan durasi 1 detik dan warna latar belakang yang sesuai dengan warna item di ```_itemColors``` (hijau untuk Lihat Produk, kuning untuk Tambah Produk, merah untuk Logout).
    
</details>

<details>
  <summary><b>Tugas 8: Flutter Navigation, Layouts, Forms, and Input Elements</b></summary>

1. Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?

   const digunakan untuk mendeklarasikan objek yang bersifat konstan dan tidak akan berubah selama runtime. Keuntungan utama dari menggunakan const adalah peningkatan performa, karena objek yang dideklarasikan dengan const hanya akan dibuat sekali dan disimpan dalam memori, menghindari pembuatan ulang objek yang sama berkali-kali. Ini sangat bermanfaat dalam aplikasi dengan banyak elemen yang identik, seperti widget yang tidak berubah. Selain itu, penggunaan const dapat meningkatkan kejelasan kode, karena menunjukkan bahwa nilai atau objek tersebut tidak akan berubah. Sebaiknya kita menggunakan const ketika kita tahu nilai atau objek tidak akan berubah setelah kompilasi, seperti pada widget statis atau nilai variabel yang tetap. Namun, hindari penggunaan const pada objek yang memerlukan perubahan nilai atau berhubungan dengan state dinamis, karena itu dapat menyebabkan kesalahan atau logika yang tidak diinginkan.

2. Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!

   Column: Widget yang digunakan untuk menyusun elemen-elemen secara vertikal.
   Row: Widget yang digunakan untuk menyusun elemen-elemen secara horizontal.

   Perbandingan dari keduanya adalah column cocok untuk tata letak vertikal, seperti daftar/list panjang atau form, sedangkan row lebih cocok untuk tata letak horizontal, seperti menu navigasi/navbar.

   Contoh implementasi column:
   ```
   ...
   Column(
      children: <Widget>[
        Text('produk pertama'),
        Text('produk kedua'),
        ElevatedButton(
          onPressed: () {},
          child: Text(':v'),
        ),
      ],
    )
   ...
   ```
   Elemen-elemen Text dan ElevatedButton disusun secara vertikal di dalam Column.

   Contoh implementasi row:
   ```
   Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Icon(Icons.home),
        Icon(Icons.search),
        Icon(Icons.settings),
      ],
    )
   ```
   Tiga ikon disusun secara horizontal di dalam Row dan diatur dengan jarak yang sama antar ikon menggunakan MainAxisAlignment.spaceEvenly.

3. Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!

   - Product Name (_nameController): Input teks untuk nama produk menggunakan widget ```TextFormField``` dengan ikon ```Icons.shopping_bag```.
   - Price (_amountController): Input teks untuk harga produk menggunakan widget ```TextFormField``` dengan ikon ```Icons.attach_money``` dan prefiks ```'Rp '```.
   - Description (_descriptionController): Input teks area untuk deskripsi produk menggunakan widget ```TextFormField``` dengan ikon ```Icons.description``` dan maksimal input 60 karakter.
   - Image URL (_imageURLController): Input teks untuk URL gambar produk menggunakan widget ```TextFormField``` dengan ikon ```Icons.image```.

   Implementasi elemen-elemen input tersebut sudah sesuai dengan requirement pada tugas individu kali ini. Jadi, sepertinya tidak ada elemen input flutter yang tidak diimplementasikan pada tugas kali ini.

4. Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?

   Kita dapat memanfaatkan tema (```theme```) yang dapat digunakan untuk mengatur tampilan visual secara konsisten di seluruh aplikasi, termasuk warna, font, tombol, dan elemen UI lainnya. Tema dapat diatur menggunakan ```ThemeData``` yang dikonfigurasi dalam widget ```MaterialApp``` atau ```CupertinoApp```.

   Pada ```main.dart```, saya mengimplementasikan warna tema untuk aplikasi ini. Berikut potongan codenya:
   ```
   ...
   theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF2C5F2D), 
        secondary: const Color(0xFFFFB200), 
      ),
      useMaterial3: true,
   ),
   ...
   ```
   Pada ```MaterialApp```, ada properti ```theme``` yang menggunakan objek ```ThemeData```. Tema ini diatur dengan menggunakan ```ColorScheme.fromSeed()```, yang menetapkan warna utama dan sekunder untuk aplikasi.

5. Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?

   Navigasi dalam Flutter bisa dilakukan dengan berbagai cara, contohnya seperti implementasi yang saya lakukan pada ```BottomNavigationBar``` untuk berpindah antar halaman utama seperti ```Home```, ```Add Product```, dan ```Profile```. Pada Flutter, navigasi antar halaman dapat menggunakan ```Navigator.push``` untuk membuka halaman baru di atas halaman yang aktif, atau ```Navigator.pushReplacement``` untuk mengganti halaman saat ini tanpa menyimpan halaman sebelumnya di tumpukan navigasi. Selain itu, cara yang lain adalah dapat menggunakan ```routes``` di dalam ```MaterialApp``` dalam mengelola rute yang lebih kompleks. Dengan mendefinisikan ```named routes```, setiap halaman dapat dipanggil secara langsung tanpa harus membuat instance baru.
</details>
