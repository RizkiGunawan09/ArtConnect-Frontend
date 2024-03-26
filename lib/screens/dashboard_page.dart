import 'package:flutter/material.dart';
import 'package:ArtConnect/auth/login_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              // Action when Home icon is pressed
            },
          ),
          IconButton(
            icon: Icon(Icons.star),
            onPressed: () {
              // Action when Star icon is pressed
            },
          ),
          IconButton(
            icon: Icon(Icons.trolley),
            onPressed: () {
              // Action when Box icon is pressed
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Pindahkan pengguna ke laman login
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
        title: Text('Dashboard'), // Title can be set directly as a Text widget
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'HELLO, Min',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 8,
                ), // Adding space between "HELLO, xxx" and search box
                Expanded(
                  child: Container(
                    height: kToolbarHeight,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search',
                                border: InputBorder.none,
                              ),
                              onChanged: (value) {
                                // Action when text in search box changes
                              },
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            // Action when search icon inside search box is pressed
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ), // Add some space between search box and categories list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              '',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 5,
          ), // Add some space between title and categories list
          Container(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildCategoryCard('Popular'),
                _buildCategoryCard('Antique Art'),
                _buildCategoryCard('Sculptures'),
                _buildCategoryCard('Calligraphy'),
                _buildCategoryCard('Bio Art'),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Widget lainnya seperti yang telah Anda implementasikan sebelumnya

              SizedBox(height: 10), // Tambahkan sedikit spasi

              // Box dengan tulisan
              Container(
                padding: EdgeInsets.all(35),
                margin: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[300], // Ubah warna menjadi abu-abu
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Just the greatest sale of all time!',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight
                              .bold), // Ubah ukuran teks menjadi lebih besar
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Products even up to 25% off',
                      style: TextStyle(
                          fontSize: 16), // Ubah ukuran teks menjadi lebih besar
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 50), // Add some space
          Container(
            height: 200, // Set height for product cards
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5, // Number of product cards
              itemBuilder: (context, index) {
                return _buildProductCard(
                  image: 'assets/Logo_ArtConnect.png',
                  name: 'Artwork ${index + 1}',
                  price: '\$${100 + index * 20}',
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(String categoryName) {
    return Container(
      margin: EdgeInsets.only(right: 8, bottom: 8),
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          categoryName,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard({
    required String image,
    required String name,
    required String price,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: 150, // Set width for each product card
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
            height: 120, // Set height for product image
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
