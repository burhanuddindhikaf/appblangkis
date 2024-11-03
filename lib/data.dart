class ItemMenu { 
  String nama, deskripsi, linkGambar; 
  int id, harga; 

  ItemMenu(this.id, this.nama, this.deskripsi, this.linkGambar, this.harga); 
} 

List<ItemMenu> menuImitasi = [ 
  ItemMenu(1, 
    "Khas Yogyakarta", 
    "Blangkon Yogyakarta memiliki ciri khas mondholan di bagian belakang yang menyerupai kuncir rambut.", 
    "assets/images/yogya.jpeg", 
    50000), 
  ItemMenu(2, 
    "Khas Surakarta", 
    "Blangkon Surakarta atau Solo memiliki bentuk yang lebih datar di bagian belakang tanpa mondholan.", 
    "assets/images/surakarta.jpeg", 
    45000), 
  ItemMenu(3, 
    "Khas Banyumasan", 
    "Blangkon Banyumasan memiliki mondholan kecil dan kain yang lebih sederhana, mencerminkan gaya khas Banyumas.", 
    "assets/images/banyumas.jpeg", 
    40000), 
  ItemMenu(4, 
    "Khas Cirebon", 
    "Blangkon Cirebon biasanya dibuat dengan motif batik khas Cirebon dan bentuk yang unik di bagian belakang.", 
    "assets/images/cirebon.jpeg", 
    55000), 
  ItemMenu(5, 
    "Khas Betawi", 
    "Blangkon Betawi lebih simpel dengan bentuk lipatan yang berbeda di bagian belakang, khas budaya Betawi.", 
    "assets/images/betawi.jpeg", 
    35000), 
]; 
