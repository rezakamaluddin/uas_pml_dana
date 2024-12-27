import 'package:flutter/material.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text("DANA PROTECTION"),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                // Tambahkan logika untuk tombol tambah
              },
            ),
          ],
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Search bar
          TextField(
            decoration: InputDecoration(
              hintText: "Lagi cari apa di Dompet?",
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          // Payment method card
          Container(
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Simpan kartu bank!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                        "Transaksi bebas ribet dengan berbagai pilihan pembayaran."),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    // Tambahkan logika untuk tombol "Buka"
                  },
                  child: const Text("BUKA"),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          // Voucher & Ticket section
          const Text(
            "VOUCHER & TIKET",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8.0),
          _buildVoucherCard("Kode Voucher Google Play", "20.000"),
          _buildVoucherCard("Kode Voucher Google Play", "5.000", isNew: true),
          _buildVoucherCard("Kode Voucher Google Play", "10.000"),
        ],
      ),
    );
  }

  Widget _buildVoucherCard(String title, String amount, {bool isNew = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const Icon(Icons.card_giftcard, color: Colors.blue, size: 40.0),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                if (isNew)
                  Container(
                    margin: const EdgeInsets.only(top: 4.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 2.0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: const Text(
                      "NEW",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                const SizedBox(height: 4.0),
                Text("Rp $amount"),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Tambahkan logika untuk tombol "Buka"
            },
            child: const Text("BUKA"),
          ),
        ],
      ),
    );
  }
}
