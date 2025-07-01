import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        leading: const Icon(Icons.menu, color: Colors.black),
        title: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Image.asset('assets/a10.png', width: 30, height: 30, fit: BoxFit.cover),
              const SizedBox(width: 10),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search here',
                    border: InputBorder.none,
                  ),
                ),
              ),
              const Icon(Icons.search, color: Colors.grey),
            ],
          ),
        ),
        actions: const [
          Icon(Icons.notifications_none, color: Colors.black),
          SizedBox(width: 10),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // 🔁 Horizontal Banner
            SizedBox(
              height: 160,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        image: AssetImage('assets/a4.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // 📣 KYC Banner
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset('assets/a5.png', width: double.infinity, height: 150, fit: BoxFit.fill),
            ),

            const SizedBox(height: 20),

            // 🧭 Category Icons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  ImageCategory(imagePath: 'assets/a6.png'),
                  ImageCategory(imagePath: 'assets/a7.png'),
                  ImageCategory(imagePath: 'assets/a8.png'),
                  ImageCategory(imagePath: 'assets/a9.png'),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // 🛍️ Exclusive Section
           // 📦 Exclusive Section with Background Color
Container(
  color: Colors.tealAccent, // light red background
  padding: const EdgeInsets.symmetric(vertical: 20),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // 🔻 Heading Row
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          children: const [
            Text(
              'EXCLUSIVE FOR YOU',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Spacer(), // 👈 Automatically pushes the icon to the right
            Icon(Icons.arrow_forward_ios, size: 18),
          ],
        ),
      ),
      const SizedBox(height: 15),

      // 🛒 Product Horizontal List
      SizedBox(
        height: 300,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 15),
          children: const [
            ExclusiveCard(
              imagePath: 'assets/m1.jpg',
              title: 'Nokia 8.1 (64GB)',
              price: '₹14,999',
              discount: '32% OFF',
            ),
            ExclusiveCard(
              imagePath: 'assets/m2.webp',
              title: 'Redmi Note 7S',
              price: '₹11,499',
              discount: '14% OFF',
            ),
            ExclusiveCard(
              imagePath: 'assets/m3.webp',
              title: 'Vivo V25',
              price: '₹21,999',
              discount: '20% OFF',
            ),
            ExclusiveCard(
              imagePath: 'assets/m4.jpg',
              title: 'Samsung M52',
              price: '₹22,499',
              discount: '10% OFF',
            ),
          ],
        ),
      ),
    ],
  ),
),

            
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          const BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Categories'),
          BottomNavigationBarItem(icon: Image.asset('assets/a11.png', height: 25), label: 'Deals'),
          const BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      floatingActionButton: SizedBox(
  width: 140, // 👈 custom width
  height: 60, // 👈 custom height (optional)
  child: FloatingActionButton.extended(
    onPressed: () {
      // your action
    },
    backgroundColor: Colors.red,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30), // 👈 custom corner radius
    ),
    icon: const Icon(Icons.chat_outlined, color: Colors.white),
    label: const Text('Chat', style: TextStyle(color: Colors.white)),
  ),
),

    );
  }
}

class ImageCategory extends StatelessWidget {
  final String imagePath;
  const ImageCategory({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      width: 60,
      height: 70,
      fit: BoxFit.contain,
    );
  }
}

class ExclusiveCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;
  final String discount;

  const ExclusiveCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(15, 0, 0, 0),
            blurRadius: 4,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.asset(
                  imagePath,
                  height: 180,
                  width: 160,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    discount,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              price,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
