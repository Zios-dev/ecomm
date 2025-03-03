import 'package:flutter/material.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.grey.shade200,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem(context, Icons.home, 'Home', '/', true),
          _buildNavItem(context, Icons.category, 'Catalog', '/catalog', false),
          _buildNavItem(context, Icons.shopping_cart, 'Cart', '/cart', false, badge: '2'),
          _buildNavItem(context, Icons.favorite_border, 'Favorites', '/favorites', false),
          _buildNavItem(context, Icons.person_outline, 'Profile', '/profile', false),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, String label, String route, bool isActive, {String? badge}) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Icon(
                icon,
                color: isActive ? Colors.black : const Color(0xFFC9CBCA),
                size: 24,
              ),
              if (badge != null)
                Positioned(
                  right: -5,
                  top: -5,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      badge,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 7,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.black : const Color(0xFFC9CBCA),
              fontSize: 7.6,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
