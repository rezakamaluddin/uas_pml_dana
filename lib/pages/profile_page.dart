import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Halaman Saya"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Profil
            Container(
              color: Colors.blue,
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Row(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, size: 40, color: Colors.blue),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "REZA KAMALUDDIN",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            "0819•••5749",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildHeaderButton(
                          "Saldo", "Rp4.637", Icons.account_balance_wallet),
                      _buildHeaderButton(
                          "DANA Goals", "Buat Impian", Icons.flag),
                      _buildHeaderButton("Rek. Keluarga", "Aktivasi Yuk!",
                          Icons.family_restroom),
                      _buildHeaderButton("eMAS", "Top Up", Icons.savings),
                    ],
                  ),
                ],
              ),
            ),
            // Uang Masuk dan Uang Keluar
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTransactionInfo("Uang Masuk", "Rp50.000", Colors.green),
                  _buildTransactionInfo("Uang Keluar", "Rp52.900", Colors.red),
                ],
              ),
            ),
            // Menu
            const Divider(thickness: 1),
            ListTile(
              leading: const Icon(Icons.receipt, color: Colors.orange),
              title: const Text("My Bills"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.code, color: Colors.blue),
              title: const Text("Isi Kode Promo"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.card_giftcard, color: Colors.green),
              title: const Text("Promo Quest"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.help, color: Colors.blue),
              title: const Text("Pusat Bantuan"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip, color: Colors.blue),
              title: const Text("Privacy Notice"),
              onTap: () {},
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderButton(String title, String subtitle, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 30, color: Colors.white),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
        Text(
          subtitle,
          style: const TextStyle(color: Colors.white, fontSize: 10),
        ),
      ],
    );
  }

  Widget _buildTransactionInfo(String title, String amount, Color color) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.black54, fontSize: 12),
        ),
        Text(
          amount,
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfilePage(),
  ));
}
