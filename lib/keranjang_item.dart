import 'package:flutter/material.dart';

class KeranjangItem extends StatefulWidget {
  final int stok;
  final int harga;

  const KeranjangItem({
    super.key,
    required this.stok,  
    required this.harga,
  });

  @override
  State<KeranjangItem> createState() => _KeranjangItemState();
}

class _KeranjangItemState extends State<KeranjangItem> {
  int jumlah = 1;

  @override
  void initState() {
    super.initState();
    print('initState dipanggil');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose dipanggil');
  }

  @override
  Widget build(BuildContext context) {
    print('build dipanggil');
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: const Icon(Icons.remove, size: 20),
              onPressed: () {
                setState(() {
                  if (jumlah > 0) jumlah--;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(jumlah.toString()),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: const Icon(Icons.add, size: 20),
              onPressed: () {
                if (jumlah < widget.stok) {
                  setState(() {
                    jumlah++;
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Maaf, stok hanya tersisa ${widget.stok} barang.'),
                    duration: const Duration(seconds: 2),
                    ),
                  );
                }
              },
            ),
          ],
        ),
        Text(
          'Total: Rp${widget.harga * jumlah}',
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
        ),
      ],
    );
  }
}