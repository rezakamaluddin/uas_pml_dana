import 'package:flutter/material.dart';

class AktivitasPage extends StatelessWidget {
  const AktivitasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aktivitas"),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Bulan Ini",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 8.0),
                _buildTransactionItem(
                  title: "PULSA telkomsel 5.000",
                  date: "21 Des 2024 · 09:46",
                  amount: "-Rp6.000",
                  isExpired: false,
                ),
                _buildTransactionItem(
                  title: "PULSA telkomsel 15.000",
                  date: "21 Des 2024 · 09:39",
                  amount: "-Rp15.990",
                  isExpired: true,
                ),
                _buildTransactionItem(
                  title: "PULSA indosat 12.000",
                  date: "21 Des 2024 · 09:39",
                  amount: "-Rp13.145",
                  isExpired: true,
                ),
                _buildTransactionItem(
                  title: "xl_prepaid",
                  date: "11 Des 2024 · 12:41",
                  amount: "-Rp46.900",
                  isExpired: false,
                ),
                _buildTransactionItem(
                  title: "Isi Saldo",
                  date: "11 Des 2024 · 08:31",
                  amount: "Rp50.000",
                  isExpired: false,
                  isCredit: true,
                ),
                const SizedBox(height: 16.0),
                const Text(
                  "November 2024",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 8.0),
                _buildTransactionItem(
                  title: "Kirim ke Mahadir Mu****",
                  date: "22 Nov 2024 · 18:57",
                  amount: "-Rp2.000",
                  isExpired: false,
                ),
                _buildTransactionItem(
                  title: "XL Prepaid",
                  date: "11 Nov 2024 · 08:54",
                  amount: "-Rp44.950",
                  isExpired: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem({
    required String title,
    required String date,
    required String amount,
    bool isExpired = false,
    bool isCredit = false,
  }) {
    return ListTile(
      leading: Icon(
        Icons.account_balance_wallet,
        color: isCredit ? Colors.green : Colors.red,
      ),
      title: Text(title),
      subtitle: Text(date),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            amount,
            style: TextStyle(
              color: isCredit
                  ? Colors.green
                  : (isExpired ? Colors.grey : Colors.black),
              fontWeight: FontWeight.bold,
            ),
          ),
          if (isExpired)
            const Text(
              "Waktu habis",
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
        ],
      ),
    );
  }
}
