import 'package:flutter/material.dart';
import 'pembayaran_page.dart'; // Impor PembayaranPage
import 'data.dart';

class PesanPage extends StatefulWidget {
  final Map<ItemMenu, int> pesananItems;

  PesanPage({super.key, required this.pesananItems});

  @override
  State<StatefulWidget> createState() => _PesanPageState();
}

class _PesanPageState extends State<PesanPage> {
  @override
  Widget build(BuildContext context) {
    int totalKeseluruhan = widget.pesananItems.entries
        .map((entry) => entry.key.harga * entry.value)
        .reduce((value, element) => value + element);

    return Scaffold(
      appBar: AppBar(title: const Text("Pesanan Anda")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Detail Pemesanan",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: widget.pesananItems.entries.map((entry) {
                  final item = entry.key;
                  final jumlah = entry.value;
                  return ListTile(
                    leading: Image.asset(item.linkGambar),
                    title: Text(item.nama),
                    subtitle: Text("Jumlah: $jumlah"),
                    trailing: Text("Rp. ${item.harga * jumlah}"),
                  );
                }).toList(),
              ),
            ),
            // Menampilkan total keseluruhan
            Text(
              "Total Keseluruhan: Rp. $totalKeseluruhan",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke PembayaranPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PembayaranPage(totalKeseluruhan: totalKeseluruhan),
                  ),
                );
              },
              child: const Text("Bayar"),
            ),
          ],
        ),
      ),
    );
  }
}
