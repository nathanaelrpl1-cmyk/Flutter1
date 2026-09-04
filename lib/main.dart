import 'package:flutter/material.dart';
import 'barang_card.dart';

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
  {'nama': 'Buku Tulis', 'anggota': 3000, 'umum': 3500, 'stok': 0, 'kategori': 'atk'},
  {'nama': 'Buku Gambar', 'anggota': 2000, 'umum': 3000, 'stok': 30, 'kategori': 'atk'},
  {'nama': 'Penghapus', 'anggota': 2500, 'umum': 3500, 'stok': 0, 'kategori': 'atk'},
  {'nama': 'Pulpen', 'anggota': 2000, 'umum': 2500, 'stok': 80, 'kategori': 'atk'},
  {'nama': 'Pensil', 'anggota': 1500, 'umum': 2000, 'stok': 55, 'kategori': 'atk'},
  {'nama': 'Penggaris', 'anggota': 3500, 'umum': 4000, 'stok': 65, 'kategori': 'atk'},
  {'nama': 'jangka', 'anggota': 2000, 'umum': 2500, 'stok': 15, 'kategori': 'atk'},
  {'nama': 'Sampul', 'anggota': 500, 'umum': 1000, 'stok': 50, 'kategori': 'atk'},
  {'nama': 'Spidol', 'anggota': 4000, 'umum': 5000, 'stok': 30, 'kategori': 'atk'},
  {'nama': 'Pensil Warna', 'anggota': 7500, 'umum': 9000, 'stok': 19, 'kategori': 'atk'},
];

void main() => runApp(const MyApp());
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TextEditingController _controller;
  String kataCari = '';

@override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

@override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasilCari = daftarBarang 
        .where((b) => b['nama'].toLowerCase().contains(kataCari))
        .toList();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Koperasi Sekolah')),
        body: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Cari Barang....',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (nilai) {
                setState(() {
                  kataCari = nilai.toLowerCase();
                });
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: hasilCari.length,
                itemBuilder: (context, index) {
                  final barang = hasilCari[index];
                  return BarangCard(
                    nama: barang['nama'],
                    hargaAnggota: barang['anggota'],
                    stok: barang['stok'],
                    kategori: barang['kategori'],
                  );
                },
              ),
            ),
          ],
        ),
      )
    );
  }
}