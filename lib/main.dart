import 'package:flutter/material.dart';
int stok = 40;
IconData pilihIkonKategori(String kategori) {
  switch (kategori.toLowerCase()) {
    case 'makanan':
      return Icons.fastfood;
    case 'minuman':
      return Icons.local_drink;
    case 'atk':
      return Icons.edit;
    default:
      return Icons.inventory_2;
  }
}

final List<Map<String, dynamic>> daftarBarang = [
  {'nama': 'Buku Tulis', 'anggota': 3000, 'umum': 3500, 'stok': 40},
  {'nama': 'Buku Gambar', 'anggota': 2000, 'umum': 3000, 'stok': 30},
  {'nama': 'Penghapus', 'anggota': 2500, 'umum': 3500, 'stok': 60},
  {'nama': 'Pulpen', 'anggota': 2000, 'umum': 2500, 'stok': 80},
  {'nama': 'Pensil', 'anggota': 1500, 'umum': 2000, 'stok': 55},
  {'nama': 'Penggaris', 'anggota': 3500, 'umum': 4000, 'stok': 65},
  {'nama': 'jangka', 'anggota': 2000, 'umum': 2500, 'stok': 35},
  {'nama': 'Sampul', 'anggota': 500, 'umum': 1000, 'stok': 50},
  {'nama': 'Spidol', 'anggota': 4000, 'umum': 5000, 'stok': 30},
  {'nama': 'Pensil Warna', 'anggota': 7500, 'umum': 9000, 'stok': 25},
];

void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Koperasi Sekolah')),
        body: ListView.builder(
          itemCount: daftarBarang.length,
          itemBuilder: (context, index) {
            final barang = daftarBarang[index];
            return Card(
              margin: const EdgeInsets.all(8),
              child: ListTile(
                leading: const Icon(Icons.inventory_2),
                title: Text(barang['nama']),
                subtitle: Text('Anggota : Rp' + barang['anggota'].toString()),
                trailing: Text('Stok ' + barang['stok'].toString()),                
              ),
            );
          }
        )
      ),
    );
  }
}