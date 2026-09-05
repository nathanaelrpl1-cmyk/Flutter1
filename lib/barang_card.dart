import 'package:flutter/material.dart';
import 'keranjang_item.dart';

class BarangCard extends StatelessWidget {
  final String nama;
  final int hargaAnggota;
  final int stok;
  final String kategori;
  final bool sorot;

  const BarangCard({
    super.key,
    required this.nama,
    required this.hargaAnggota,
    required this.stok,
    required this.kategori,
    this.sorot = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: sorot ? Colors.yellow.shade100 : Colors.white,
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: const Icon(Icons.inventory_2, color: Colors.blueAccent),
        title: Text(
          nama,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Anggota Rp' + hargaAnggota.toString()),
            Text(
              kategori.toUpperCase(),
            ),
          ],
        ),
        trailing: KeranjangItem(stok: stok, harga: hargaAnggota),
      ),
    );
  }
}