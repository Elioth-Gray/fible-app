import 'package:fibble_app/presentation/widgets/navbar/navbar.dart';
import 'package:fibble_app/shared/theme.dart';
import 'package:flutter/material.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  String selectedFilter = 'Harian';
  String selectedCategory = 'Semua';

  List<String> filters = ['Harian', 'Mingguan', 'Bulanan', 'Tahunan'];
  List<String> categories = ['Semua', 'Pemasukan', 'Pengeluaran'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Center(
              child: Text(
                'Laporan Keuangan',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: semiBold,
                  color: primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildFilterButtons(),
            const SizedBox(height: 16),
            _buildDateSelector(),
            const SizedBox(height: 16),
            _buildSummaryCard(),
            const SizedBox(height: 16),
            _buildTotalCard(),
            const SizedBox(height: 16),
            _buildAktivitasTransaksi(),
            const SizedBox(height: 16),
            _buildKesimpulan(),
            const SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: Navbar(),
    );
  }

  Widget _buildFilterButtons() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: filters.map((filter) {
          bool isSelected = selectedFilter == filter;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedFilter = filter;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isSelected ? primaryColor : whiteColor,
                side: BorderSide(color: primaryColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                filter,
                style: isSelected
                    ? whiteTextStyle.copyWith(fontWeight: semiBold)
                    : blackTextStyle.copyWith(fontWeight: semiBold),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildDateSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.arrow_back_ios, size: 20, color: blackColor),
        Text(
          'Senin, 22/04/2024',
          style: blackTextStyle.copyWith(fontWeight: semiBold),
        ),
        Icon(Icons.arrow_forward_ios, size: 20, color: blackColor),
      ],
    );
  }

  Widget _buildSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: greyColor,
            blurRadius: 10,
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              DropdownButton<String>(
                value: selectedCategory,
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value!;
                  });
                },
                items: categories.map((cat) {
                  return DropdownMenuItem(
                    value: cat,
                    child: Text(
                      cat,
                      style: blackTextStyle.copyWith(fontWeight: semiBold),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Ini untuk grafik donatnya (dummy dulu)
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: CircularProgressIndicator(
                    value: 0.75,
                    color: primaryProgressBarColor,
                    backgroundColor: tertiaryProgressBarColor,
                    strokeWidth: 12,
                  ),
                ),
                Text(
                  '327,5k',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Data Freelance, Makanan, Transportasi
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSummaryRow('Freelance (75%)', 'Rp 250.000', primaryColor),
              _buildSummaryRow('Makanan (5%)', 'Rp 27.500', secondaryColor),
              _buildSummaryRow(
                  'Transportasi (20%)', 'Rp 50.000', tertiaryColor),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Lainnya',
                  style: TextStyle(
                    color: primaryColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String title, String amount, Color dotColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: dotColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: blackTextStyle.copyWith(fontWeight: regular),
            ),
          ),
          Text(
            amount,
            style: blackTextStyle.copyWith(fontWeight: semiBold),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: greyColor,
            blurRadius: 10,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total',
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Rp 327.500',
                style: blackTextStyle.copyWith(fontWeight: bold, fontSize: 18),
              ),
              const SizedBox(height: 4),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  minimumSize: const Size(80, 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  'Detail',
                  style: whiteTextStyle.copyWith(fontSize: 12),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildAktivitasTransaksi() {
    List<Map<String, dynamic>> transaksi = [
      {
        'title': 'Gaji Project Web',
        'category': 'Freelance',
        'time': '12.50',
        'amount': 'Rp 250.000',
        'type': 'in',
        'payment': 'Gopay'
      },
      {
        'title': 'Ojek Online',
        'category': 'Transportasi',
        'time': '15.45',
        'amount': 'Rp 50.000',
        'type': 'out',
        'payment': 'Cash'
      },
      {
        'title': 'Bomboloni',
        'category': 'Makanan',
        'time': '09.00',
        'amount': 'Rp 5.000',
        'type': 'out',
        'payment': 'Cash'
      },
      {
        'title': 'Risol Mayo',
        'category': 'Makanan',
        'time': '08.50',
        'amount': 'Rp 7.500',
        'type': 'out',
        'payment': 'Cash'
      },
      {
        'title': 'Seblak Level 10',
        'category': 'Makanan',
        'time': '17.00',
        'amount': 'Rp 15.000',
        'type': 'out',
        'payment': 'M-Banking'
      },
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: greyColor,
            blurRadius: 10,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Aktivitas Transaksi',
            style: blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
          ),
          const SizedBox(height: 8),
          ...transaksi.map((data) => _buildTransaksiItem(data)),
        ],
      ),
    );
  }

  Widget _buildTransaksiItem(Map<String, dynamic> data) {
    Color amountColor = data['type'] == 'in' ? greenColor : redColor;

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(Icons.circle, size: 30, color: secondaryColor),
      title: Text(
        data['title'],
        style: blackTextStyle.copyWith(fontWeight: semiBold),
      ),
      subtitle: Text(
        '${data['category']} • ${data['time']}',
        style: greyTextStyle.copyWith(fontSize: 12),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            data['amount'],
            style: TextStyle(color: amountColor, fontWeight: semiBold),
          ),
          Text(
            data['payment'],
            style: greyTextStyle.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildKesimpulan() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: greyColor,
            blurRadius: 10,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kesimpulan',
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 18),
          ),
          const SizedBox(height: 8),
          _buildBullet(
              'Rata-rata kamu menghabiskan pada kategori Transportasi'),
          _buildBullet(
              'Metode pembayaran yang sering kamu gunakan adalah Cash'),
        ],
      ),
    );
  }

  Widget _buildBullet(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('• '),
        Expanded(
          child: Text(
            text,
            style: blackTextStyle.copyWith(height: 1.5),
          ),
        )
      ],
    );
  }
}
