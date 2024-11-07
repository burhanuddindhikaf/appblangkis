import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  // Fungsi untuk membuka URL
  void _launchURL() async {
    final Uri url =
        Uri.parse('https://burhanuddindhikaf.github.io/leafletmap/');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Tidak dapat membuka $url';
    }
  }

  Future<void> kirimSms() async {
    Uri uri = Uri(
      scheme: 'sms',
      path: "089526869497",
    );

    if (!await launchUrl(uri)) {
      throw Exception("Gagal membuka aplikasi SMS!");
    }
  }

  Future<void> telepon() async {
    Uri uri = Uri(scheme: "tel", path: "089526869497");

    if (!await launchUrl(uri)) {
      throw Exception("Gagal membuka link!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: const Text('Call Center Penjual'),
              subtitle: const Text('Hubungi kami di: 0895-2686-9497'),
              trailing: const Icon(Icons.phone),
              onTap: () {
                telepon();
              },
            ),
            ListTile(
              title: const Text('SMS ke Penjual'),
              subtitle: const Text('Kirim SMS ke: 0895-2686-9497'),
              trailing: const Icon(Icons.message),
              onTap: () {
                kirimSms();
              },
            ),
            ListTile(
              title: const Text('Lokasi Kami'),
              subtitle: const Text('Kunjungi kami di maps'),
              trailing: const Icon(Icons.map_sharp),
              onTap: _launchURL, // Memanggil fungsi untuk membuka link
            ),
          ],
        ),
      ),
    );
  }
}
