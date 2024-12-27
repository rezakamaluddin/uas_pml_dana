import 'package:flutter/material.dart';
import 'aktivitas_page.dart';
import 'pay_page.dart';
import 'wallet_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Halaman untuk setiap tab
  final List<Widget> _pages = [
    _BerandaPage(), // Halaman Beranda
    AktivitasPage(), // Halaman Aktivitas
    PayPage(), // Halaman Pay
    WalletPage(), // Halaman Dompet
    ProfilePage(), // Halaman Saya
  ];

  // Fungsi untuk mengubah tab
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[
          _selectedIndex], // Menampilkan halaman berdasarkan tab yang dipilih
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white, // Warna latar belakang bottom bar
          boxShadow: [
            BoxShadow(
              color: Colors.black12, // Bayangan ringan di bawah bottom bar
              blurRadius: 4,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex, // Indeks tab yang aktif
          onTap: _onItemTapped, // Fungsi saat item ditekan
          selectedItemColor:
              const Color(0xFF004AAD), // Warna ikon tab yang dipilih
          unselectedItemColor: Colors.grey, // Warna ikon tab yang tidak dipilih
          showUnselectedLabels:
              true, // Menampilkan label meskipun tidak dipilih
          items: [
            BottomNavigationBarItem(
              icon: _buildBottomIcon(Icons.home, "Beranda", 0),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _buildBottomIcon(Icons.event, "Aktivitas", 1),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _buildPayIcon(),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _buildBottomIcon(Icons.wallet, "Dompet", 3),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _buildBottomIcon(Icons.person, "Saya", 4),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk BottomNavigationBarItem Icon
  Widget _buildBottomIcon(IconData icon, String label, int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color:
              _selectedIndex == index ? const Color(0xFF004AAD) : Colors.grey,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color:
                _selectedIndex == index ? const Color(0xFF004AAD) : Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  // Widget untuk ikon tombol Pay
  Widget _buildPayIcon() {
    return Container(
      height: 60,
      width: 60,
      decoration: const BoxDecoration(
        color: Color(0xFF004AAD), // Warna biru untuk tombol Pay
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: const Icon(
        Icons.qr_code, // Ikon QR untuk Pay
        color: Colors.white,
        size: 32,
      ),
    );
  }
}

// Widget Beranda Page
class _BerandaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Bagian Saldo dan Menu Utama
          Container(
            padding: const EdgeInsets.all(16),
            color: const Color(0xFF004AAD),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Rp 4.637", // Saldo
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildMenuButton(Icons.qr_code_scanner, "Pindai"),
                    _buildMenuButton(Icons.account_balance_wallet, "Isi Saldo"),
                    _buildMenuButton(Icons.send, "Kirim"),
                    _buildMenuButton(Icons.request_page, "Minta"),
                  ],
                ),
              ],
            ),
          ),

          // Bagian Promosi
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildPromoBanner(
                  "Hadiah Miliaran",
                  "Ayo kumpulkan reward dan raih hadiahnya!",
                ),
                const SizedBox(height: 16),
                _buildPromoBanner(
                  "DANA Deals",
                  "Voucher belanja menarik di dekat Anda!",
                ),
              ],
            ),
          ),

          // Bagian Informasi Terbaru
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Terbaru Untukmu",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                _buildNewsItem(
                  "Awas Penipuan",
                  "Waspadai modus penipuan terbaru!",
                ),
                _buildNewsItem(
                  "Baru! Promo di Tokopedia",
                  "Gunakan kode DANA2024.",
                ),
                _buildNewsItem(
                  "Stop Judi Online",
                  "Hindari kebiasaan buruk.",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuButton(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.white,
          child: Icon(
            icon,
            color: const Color(0xFF004AAD),
            size: 24,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildPromoBanner(String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Icon(Icons.card_giftcard, color: Colors.blue, size: 32),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewsItem(String title, String description) {
    return ListTile(
      leading: const Icon(Icons.info, color: Color(0xFF004AAD)),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(description),
    );
  }
}
