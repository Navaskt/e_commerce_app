import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Store UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Inter', // Assuming a font like Inter
      ),
      home: const StoreDetailsScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class StoreDetailsScreen extends StatefulWidget {
  const StoreDetailsScreen({super.key});

  @override
  State<StoreDetailsScreen> createState() => _StoreDetailsScreenState();
}

class _StoreDetailsScreenState extends State<StoreDetailsScreen> {
  int _selectedIndex = 2; // 'Store' is the 3rd item

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 100,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          // A simple Text widget for the logo as in the image
          child: Center(
            child: Text(
              'QLIQ',
              style: TextStyle(
                color: Colors.blue.shade700,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.location_on_outlined, color: Colors.black54),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.notifications_none_outlined,
              color: Colors.black54,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black54),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.shopping_bag_outlined,
              color: Colors.black54,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const StoreHeaderCard(),
            const InfoBar(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              child: Row(
                children: const [
                  Expanded(child: DeliveryFeeCard()),
                  SizedBox(width: 12),
                  // Placeholder for the second card seen in the UI
                  Expanded(
                    child: Card(
                      color: Colors.blue,
                      child: SizedBox(height: 70),
                    ),
                  ),
                ],
              ),
            ),
            const BestsellersSection(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            label: 'Discovery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_outlined),
            label: 'Restaurant',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store_outlined),
            label: 'Store',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: 'QLIQ Live',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue.shade700,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        elevation: 5.0,
      ),
    );
  }
}

class StoreHeaderCard extends StatelessWidget {
  const StoreHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Background Image
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.4),
                BlendMode.darken,
              ),
              child: Image.network(
                'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500&q=80',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 200,
                  color: Colors.grey,
                  child: const Icon(
                    Icons.image_not_supported,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            // Foreground Content
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'NIKE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 12,
                        ),
                      ),
                      child: const Text('Follow'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoBar extends StatelessWidget {
  const InfoBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade100.withOpacity(0.6),
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const InfoBarItem(text: 'Choose Location'),
          InfoBarItem(
            text: 'Open Until 18:00',
            textColor: Colors.blue.shade700,
          ),
          const InfoBarItem(text: 'Min. Order'),
        ],
      ),
    );
  }
}

class InfoBarItem extends StatelessWidget {
  final String text;
  final Color? textColor;

  const InfoBarItem({super.key, required this.text, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor ?? Colors.black54,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class DeliveryFeeCard extends StatelessWidget {
  const DeliveryFeeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.percent, color: Colors.white),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "0 so'm delivery fees for 14 days",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Learn More",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BestsellersSection extends StatelessWidget {
  const BestsellersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Our Bestsellers',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(onPressed: () {}, child: const Text('See All')),
            ],
          ),
        ),
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 16),
            itemCount: 5, // Example count
            itemBuilder: (context, index) {
              return const ProductCard();
            },
          ),
        ),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?w=500&q=80',
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 150,
                    color: Colors.grey.shade200,
                    child: const Icon(Icons.image, color: Colors.grey),
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade700,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      '-\$500 on your first order',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Image.network(
                    'https://img.icons8.com/plasticine/100/fox.png',
                    width: 40,
                    height: 40,
                    errorBuilder: (context, error, stackTrace) =>
                        const SizedBox.shrink(),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Nike Air Force 1', // Placeholder
                style: TextStyle(fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                '\$120.00', // Placeholder
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
