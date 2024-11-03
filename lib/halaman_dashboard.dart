import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data.dart';
import 'halaman_item.dart';
import 'halaman_edit_profile.dart';
import 'about_us.dart';
import 'pesan_page.dart';

class HalamanDashboard extends StatefulWidget {
  final SharedPreferences spInstance;
  final String currentUsername;

  const HalamanDashboard(this.spInstance, this.currentUsername, {super.key});

  @override
  State<StatefulWidget> createState() => _HalamanMenuState(); 
}

class _HalamanMenuState extends State<HalamanDashboard> { 
  int hargaAkhir = 0; 
  ItemMenu? selectedItem; 
  Map<ItemMenu, int> selectedItems = {};
  void addItem(ItemMenu item) {
    setState(() {
      if (selectedItems.containsKey(item)) {
        selectedItems[item] = selectedItems[item]! + 1;
      } else {
        selectedItems[item] = 1;
      }
    });
  }


  @override 
  Widget build(BuildContext context) { 
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 16,left: 8, right: 8, bottom: 8),
          child: Center(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 7, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Dashboard",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        PopupMenuButton<String>(
                          icon: Row(
                            children: const [Icon(Icons.menu)],
                          ),
                          itemBuilder: (BuildContext context) {
                            return [
                              PopupMenuItem<String>(
                                value: "about_us",
                                child: Text("About Us"),
                              ),
                              PopupMenuItem<String>(
                                value: "update_user_password",
                                child: Text("Update User & Password"),
                              ),
                            ];
                          },
                          onSelected: (String value) {
                            switch (value) {
                              case "about_us":
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AboutUsPage(),
                                  ),
                                );
                                break;
                              case "update_user_password":
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HalamanEditProfile(widget.spInstance),
                                  ),
                                );
                                break;
                              default:
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Menu belum diimplementasikan')),
                                );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    mainAxisSpacing: 7,
                    crossAxisSpacing: 7,
                    crossAxisCount: 2,
                    children: menuImitasi.map(
                      (item) => Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () { 
                                setState(() {
                                  hargaAkhir += item.harga; 
                                });
                                addItem(item); 
                              }, 
                              child: Container(
                                height: 100, 
                                child: Image.asset(
                                  item.linkGambar,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (route) => HalamanItem(item),
                                  ),
                                );
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item.nama),
                                  Text(item.harga.toString()),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ).toList(),
                  ),
                  // Ganti Positioned dengan Container untuk tetap di bawah
                  Container(
                    margin: const EdgeInsets.only(top: 10), // Menambahkan margin atas
                    color: Theme.of(context).colorScheme.primaryContainer,
                    child: InkWell(
                      onTap: () {
                        if (selectedItems.isNotEmpty) { // Pastikan ada item yang dipilih
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PesanPage(pesananItems: selectedItems),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Silakan pilih item terlebih dahulu')),
                          );
                        }
                      },
                      child: Text("Total: Rp.$hargaAkhir",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  } 
}
