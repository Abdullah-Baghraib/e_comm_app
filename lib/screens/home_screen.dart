import 'package:flutter/material.dart';
import '../widgets/product_card.dart';
import '../widgets/promotion_banner.dart';
import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'SPRING COLLECTION',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: const Icon(Icons.shopping_bag_outlined),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CartScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const PromotionBanner(
                      discount: '30%OFF',
                      description: 'For Selected Spring Style',
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Designer Collection',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        TextButton(onPressed: () {}, child: const Text('More')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                delegate: SliverChildListDelegate([
                  const ProductCard(
                    title: 'Louis Vuitton Dress',
                    price: '¥899.00',
                    imageUrl:
                        'https://images.unsplash.com/photo-1595777457583-95e059d581b8?w=500&q=80',
                    description:
                        'One button neck sling long-sleeved waist female stitching dress',
                  ),
                  const ProductCard(
                    title: 'Playsuit in Blush',
                    price: '¥638.00',
                    imageUrl:
                        'https://images.unsplash.com/photo-1539008835657-9e8e9680c956?w=500&q=80',
                  ),
                  const ProductCard(
                    title: 'Summer Dress',
                    price: '¥499.00',
                    imageUrl:
                        'https://images.unsplash.com/photo-1572804013309-59a88b7e92f1?w=500&q=80',
                  ),
                  const ProductCard(
                    title: 'Evening Gown',
                    price: '¥1299.00',
                    imageUrl:
                        'https://images.unsplash.com/photo-1566174053879-31528523f8ae?w=500&q=80',
                  ),
                ]),
              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
