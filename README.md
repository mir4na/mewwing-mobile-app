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

6. Implementasi checklist

   A. Membuat minimal satu halaman baru pada aplikasi, yaitu halaman formulir tambah item baru dengan ketentuan sebagai berikut:
   
     - Memakai minimal tiga elemen input, yaitu name, amount, description. Tambahkan elemen input sesuai dengan model pada aplikasi tugas Django yang telah kamu buat.

       Pada page form ```add_product.dart```, terdapat implementasi 3 elemen input, yaitu Product Name, Price, dan Description. Setiap elemen diwakili oleh ```TextFormField``` dan diatur sesuai tipe data masing-masing. Setiap ```TextFormField``` dikontrol oleh ```TextEditingController```, seperti ```_nameController``` untuk Product Name, ```_amountController``` untuk Price, dan ```_descriptionController``` untuk Description.

       ```
       ...
       _buildFormField(
          controller: _nameController,
          label: 'Product Name',
          icon: Icons.shopping_bag,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a product name';
            }
            return null;
          },
        ),
       ...
       ```
       ```
       ...
       _buildFormField(
          controller: _amountController,
          label: 'Price',
          icon: Icons.attach_money,
          keyboardType: TextInputType.number,
          prefixText: 'Rp ',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a price';
            }
            if (double.tryParse(value) == null) {
              return 'Please enter a valid number';
            }
            return null;
          },
        ),
       ...
       ```
       ```
       ...
       _buildFormField(
          controller: _descriptionController,
          label: 'Description',
          icon: Icons.description,
          maxLines: 4,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a description';
            }
            return null;
          },
        ),
       ...
       ```
       
     - Memiliki sebuah tombol Save.
       
       Tombol ```Save Product``` ditempatkan di bagian bawah form. Tombol ini dikontrol oleh status ```_isLoading``` yang mengatur apakah tombol tersebut aktif atau tidak, dan juga mengubah teks menjadi ```Saving...``` saat data sedang diproses.
  
       ```screens/add_product.dart```
       ```
       ...
       ElevatedButton(
          onPressed: _isLoading ? null : _saveProduct,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2C5F2D),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            _isLoading ? 'Saving...' : 'Save Product',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
       ...
       ```
       
     - Setiap elemen input di formulir juga harus divalidasi dengan ketentuan sebagai berikut:
       - Setiap elemen input tidak boleh kosong.
       - Setiap elemen input harus berisi data dengan tipe data atribut modelnya.

         Setiap elemen input menggunakan validator untuk memastikan data yang dimasukkan sesuai ketentuan: tidak boleh kosong dan harus berisi tipe data yang sesuai. Jika input tidak memenuhi kriteria, maka pesan error akan ditampilkan.
         
         ```screens/add_product.dart```
         ```
         ...
         validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a product name';
            }
            return null;
          },
         ...
         ```
         
         ```
         ...
         validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a price';
            }
            if (double.tryParse(value) == null) {
              return 'Please enter a valid number';
            }
            return null;
          },
         ...
         ```
         
         ```
         ...
         validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a description';
            }
            return null;
          },
         ...
         ```

   B. Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Tambah Item pada halaman utama.

      ```screens/menu.dart```
      ```
      ...
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: List.generate(3, (index) {
          IconData icon;
          String label;
          
          switch (index) {
            case 0:
              icon = Icons.home;
              label = 'Home';
              break;
            case 1:
              icon = Icons.add_shopping_cart;
              label = 'Add Product';
              break;
            case 2:
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
        onTap: (index) {
          switch (index) {
            case 0:
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const AddProductScreen()),
              );
              break;
            case 2:
              break;
          }
        },
      ),
      ...
      ```

      Implementasi navigasi dilakukan ketika mengarahkan pengguna ke halaman form tambah item baru dilakukan melalui komponen ```BottomNavigationBar```. Ketika pengguna menekan item kedua pada navigation bar (yang diberi label ```"Add Product"``` dan ikon ```Icons.add_shopping_cart```), metode ```onTap``` pada ```BottomNavigationBar``` akan menangkap event ini. Selanjutnya, ```Navigator.pushReplacement``` akan dijalankan dengan ```MaterialPageRoute```, yang memuat widget ```AddProductScreen``` sebagai tujuan. Ini menyebabkan halaman baru (form tambah item) ditampilkan menggantikan halaman utama saat ini.

   C. Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru.

     ```screens/add_product.dart```
     ```
     ...
     Future<void> _saveProduct() async {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          setState(() {
            _isLoading = true;
          });
          await Future.delayed(const Duration(seconds: 1));
          if (mounted) {
            setState(() {
              _isLoading = false;
            });
            final product = {
              'name': _nameController.text,
              'amount': double.parse(_amountController.text),
              'description': _descriptionController.text,
              'imageURL': _imageURLController.text,
            };
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => ProductEntryDialog(product: product),
            );
          }
        }
      }
     ...
     ```
     Ketika pengguna menekan tombol Save pada halaman form add product, data yang dimasukkan dalam form akan muncul dalam sebuah dialog pop-up yang berisi detail produk yang baru disimpan. Metode ```_saveProduct()``` bertugas untuk memvalidasi dan menyimpan data dari formulir menggunakan```_formKey```, lalu menginisiasi dialog ```ProductEntryDialog``` yang menampilkan informasi produk sesuai input pada form.

    ```widgets/product_entry.dart```
    ```
    ...
    @override
    Widget build(BuildContext context) {
        final currencyFormatter = NumberFormat.currency(
          locale: 'id_ID',
          symbol: 'Rp ',
          decimalDigits: 0,
        );
        return AlertDialog(
          title: const Text('Product Saved Successfully!', style: TextStyle(...)),
          content: SingleChildScrollView(
            child: Column(
              children: [
                if (product['imageURL'] != null && product['imageURL'].isNotEmpty)
                  CachedNetworkImage(imageUrl: product['imageURL'], ...),
                _buildDetailItem('Product Name', product['name']),
                _buildDetailItem('Amount', currencyFormatter.format(product['amount'])),
                _buildDetailItem('Description', product['description']),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                  (route) => false,
                );
              },
              child: const Text('Done', style: TextStyle(...)),
            ),
          ],
        );
    }
    ...
    ```
    Dialog pop-up ditampilkan menggunakan ```ProductEntryDialog```, yang menampilkan data produk seperti nama, jumlah, deskripsi, dan gambar. Class ```ProductEntryDialog``` menggunakan widget ```AlertDialog``` untuk menampilkan data ini, dengan komponen ```SingleChildScrollView``` di dalamnya untuk mengelola layout isi dialog. Jika URL gambar valid, maka ```CachedNetworkImage``` akan menampilkan gambar produk, sedangkan informasi lain seperti nama, jumlah, dan deskripsi produk ditampilkan dengan fungsi ```_buildDetailItem```.

   D. Membuat sebuah drawer pada aplikasi dengan ketentuan sebagai berikut:
      - Drawer minimal memiliki dua buah opsi, yaitu Halaman Utama dan Tambah Item.
      - Ketika memiih opsi Halaman Utama, maka aplikasi akan mengarahkan pengguna ke halaman utama.
      - Ketika memiih opsi Tambah Item, maka aplikasi akan mengarahkan pengguna ke halaman form tambah item baru.

      ```
      ...
      ListTile(
        leading: const Icon(
          Icons.home_outlined,
          color: Color(0xFF2C5F2D),
        ),
        title: const Text(
          'Home',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF2C5F2D),
          ),
        ),
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const MyHomePage(),
            ),
          );
        },
      ),
      ListTile(
        leading: const Icon(
          Icons.add_shopping_cart,
          color: Color(0xFF2C5F2D),
        ),
        title: const Text(
          'Add Product',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF2C5F2D),
          ),
        ),
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const AddProductScreen(),
            ),
          );
        },
      ),
      ...
      ```
      Komponen ```Drawer``` dibuat dengan daftar opsi yang ditampilkan sebagai ```ListView``` agar pengguna dapat memilih opsi yang diinginkan. Drawer minimal memiliki dua opsi: ```"Home"``` untuk mengarahkan pengguna ke halaman utama dan ```"Add Product"``` untuk mengarahkan ke halaman form add product. Setiap opsi menggunakan ```ListTile``` dengan ikon dan teks untuk memperjelas fungsi masing-masing pilihan, dan mengimplementasikan navigasi menggunakan ```Navigator.pushReplacement``` agar halaman yang sebelumnya terbuka ditutup saat halaman baru dibuka.
     
</details>

<details>
  <summary><b>Tugas 9: Integrasi Layanan Web Django dengan Aplikasi Flutter</b></summary>

- Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?

  Model diperlukan untuk mengonversi data JSON menjadi objek Dart yang dapat digunakan dalam aplikasi Flutter. Manfaat menggunakan model meliputi type safety, yang memastikan tipe data sesuai dan menghindari runtime errors; autocomplete, yang memudahkan pengembangan dengan saran kode; maintainability, sehingga kode lebih terstruktur dan mudah dipelihara; serta validasi data, yang memudahkan proses validasi data dari API. Tanpa model, kita masih dapat mengakses data JSON langsung sebagai Map, tetapi pendekatan ini berisiko karena tidak ada type checking, rentan terhadap runtime errors, dan membuat kode menjadi lebih sulit dibaca serta dipelihara.

- Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini

  Library http digunakan untuk melakukan HTTP requests ke server, dengan fungsi utama seperti GET untuk mengambil data dari server, POST untuk mengirim data ke server, PUT untuk memperbarui data di server, dan DELETE untuk menghapus data di server. Dalam tugas kali, saya mengimplementasikan POST saat membuat atau menambahkan produk baru. Lalu, ada implementasi GET untuk mengambil data produk yang sebelumnya sudah saya input.

- Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

  CookieRequest berfungsi untuk menyimpan dan mengelola cookies sesi, melakukan HTTP requests dengan cookies, dan menjaga state autentikasi pengguna. Lalu, kenapa instance perlu dibagikean ke semua komponen aplikasi? Karena untuk memastikan konsistensi sesi di seluruh aplikasi, menghindari multiple login, menghemat resources dengan menggunakan satu instance bersama, serta memudahkan pengelolaan state autentikasi.

- Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

  Mekanisme pengiriman data dimulai dengan Input Data oleh user melalui widget seperti TextFormField yang terhubung ke TextEditingController. Setelah user memasukkan data, validasi dilakukan menggunakan formKey dan metode validate() untuk memastikan data sesuai dengan aturan yang ditentukan. Jika validasi berhasil, data dari controller dikonversi ke format JSON menggunakan struktur map (contoh: {'name': nameController.text}) dan dikirim ke server menggunakan HTTP Request dengan metode POST melalui library http.
  Di sisi server, data diproses, misalnya disimpan ke database atau digunakan untuk operasi tertentu, dan server mengembalikan Response, biasanya dalam format JSON, dengan status kode HTTP (contoh: 200 jika berhasil). Aplikasi Flutter kemudian mem-parsing response JSON untuk mendapatkan informasi yang dibutuhkan. Jika respons menunjukkan keberhasilan, UI diperbarui menggunakan setState untuk menampilkan data terbaru atau perubahan hasil dari pengiriman data tersebut.

- Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
  
  Login
User memasukkan username dan password di Flutter, lalu data dikirim ke endpoint Django /login. Django memverifikasi kredensial, dan jika valid, Django membuat session token yang dikirim kembali ke Flutter. Flutter menyimpan token ini di CookieRequest, lalu UI diperbarui untuk menampilkan home screen.

  Register
User mengisi form registrasi di Flutter, dan data dikirim ke endpoint Django /register. Django memvalidasi data dan membuat user baru jika data valid. Setelah itu, Django mengirimkan respons sukses atau error ke Flutter, dan jika berhasil, user diarahkan ke halaman login.

  Logout
Ketika user menekan tombol logout, request dikirim ke endpoint Django /logout. Django menghapus sesi yang aktif, dan Flutter menghapus token dari CookieRequest, lalu user diarahkan kembali ke login screen.

- Memastikan deployment proyek tugas Django kamu telah berjalan dengan baik.
  (tidak dideploy, hanya dijalankan di local saja)
  
- Mengimplementasikan fitur registrasi akun pada proyek tugas Flutter.
  
- Membuat halaman login pada proyek tugas Flutter.
- Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.
- Membuat model kustom sesuai dengan proyek aplikasi Django.
- Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.
  - Tampilkan name, price, dan description dari masing-masing item pada halaman ini.
- Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.
  - Halaman ini dapat diakses dengan menekan salah satu item pada halaman daftar Item.
  - Tampilkan seluruh atribut pada model item kamu pada halaman ini.
  - Tambahkan tombol untuk kembali ke halaman daftar item. 
- Melakukan filter pada halaman daftar item dengan hanya menampilkan item yang terasosiasi dengan pengguna yang login.
</details>
