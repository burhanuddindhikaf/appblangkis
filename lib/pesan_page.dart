import 'package:flutter/material.dart';
import 'pembayaran_page.dart'; // Impor PembayaranPage
import 'data.dart';

class PesanPage extends StatefulWidget {
  final Map<ItemMenu, int> pesananItems;

  const PesanPage({super.key, required this.pesananItems});

  @override
  State<StatefulWidget> createState() => _PesanPageState();
}

class _PesanPageState extends State<PesanPage> {
  @override
  Widget build(BuildContext context) {
    int totalKeseluruhan = widget.pesananItems.entries.isNotEmpty
        ? widget.pesananItems.entries
            .map((entry) => entry.key.harga * entry.value)
            .reduce((value, element) => value + element)
        : 0;

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
              child: widget.pesananItems.isEmpty
                  ? Center(
                      child: Text(
                        "Tidak ada pesanan",
                      ),
                    )
                  : ListView(
                      padding: const EdgeInsets.all(16),
                      children: widget.pesananItems.entries.map((entry) {
                        final item = entry.key;
                        final jumlah = entry.value;

                        return ListTile(
                          leading: Image.asset(item.linkGambar),
                          title: Text(item.nama),
                          subtitle: Text("Jumlah: $jumlah"),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Rp. ${item.harga * jumlah}"),
                              IconButton(
                                icon:
                                    const Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  setState(() {
                                    widget.pesananItems.remove(
                                        item); // Menghapus item dari pesanan
                                  });
                                },
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
            ),
            // Menampilkan total keseluruhan jika pesanan tidak kosong
            if (widget.pesananItems.isNotEmpty)
              Text(
                "Total Keseluruhan: Rp. $totalKeseluruhan",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: widget.pesananItems.isEmpty
                  ? null
                  : () {
                      // Navigasi ke PembayaranPage jika pesanan tidak kosong
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PembayaranPage(
                              totalKeseluruhan: totalKeseluruhan),
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
