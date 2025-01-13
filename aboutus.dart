import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'About Us',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AboutUsPage(),
    );
  }
}

class AboutUsPage extends StatelessWidget {
  Color appBarColor = Colors.blue; // Default AppBar color
  Color appBarTextColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        backgroundColor: appBarColor,
        foregroundColor: appBarTextColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Sejarah Aruna',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              '''
2016
Aruna
Didirikan oleh 3 orang dengan latar belakang budaya pesisir dan memiliki spesialisasi dalam teknologi, Aruna memulai inisiatifnya dengan menjadi startup Indonesia pertama yang berfokus untuk menghubungkan nelayan lokal ke pasar yang lebih luas menggunakan teknologi.

2017
Aruna
Aruna mendirikan Aruna Hub pertamanya di Balikpapan, Kalimantan Timur dan kantor pusatnya di Jakarta. Tak lama kemudian, Aruna melakukan penjualan di 3 kota dan memulai ekspor pertamanya. Pada tahun ini, Aruna menerima pendanaan pertamanya untuk memperluas jaringan komunitas Nelayan Aruna.

2018
Aruna
Aruna mulai melakukan ekspansi ke pulau-pulau besar di Indonesia. Berhasil membantu meningkatkan pendapatan nelayan sebesar 3 hingga 12 kali lipat, Aruna juga mulai memberdayakan perempuan pesisir. Hal ini akhirnya mengantar Aruna sebagai peraih medali emas di Asean ICT Awards 2018.

2019
Aruna
Sebanyak 5.301 nelayan dan lebih dari 100 perempuan pesisir telah terdaftar secara nasional. Pertumbuhan yang pesat di tahun 2019 dan adanya 8 negara tujuan ekspor membuat Aruna memenangkan The Most Social Impact Startup di kawasan ASEAN oleh NUS dan Alipay.

2020
Aruna
Meski di tengah pandemi COVID-19, pendapatan Aruna meningkat 86 kali lipat. Hal ini mendorong Aruna untuk memperluas varietas produk yang ada. Aruna juga mendapatkan pendanaan investor sebesar USD 5,5 Juta dan melakukan ekspansi ke pasar domestik dengan meluncurkan Seafood by Aruna.

2021
Aruna
Aruna memberdayakan lebih dari 26.000 nelayan di 27 provinsi. Setiap komunitas binaan Aruna bisa mendapatkan omzet dari 300 hingga 700 juta per bulan.

2022
Aruna
Aruna telah memberdayakan lebih dari 40.000 nelayan yang tersebar di 177 titik di seluruh Indonesia.
                ''',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Image.asset(
                      'lib/images/tuna.jpg',
                      width: 200,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 10),
                    Image.asset(
                      'lib/images/tuna.jpg',
                      width: 200,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
