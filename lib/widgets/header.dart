import 'package:flutter/material.dart';
import 'dart:math'; // Import for generating random numbers

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Generate a random number between 1 and 99
    int randomNumber = Random().nextInt(99) + 1;

    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              // Profile image
              ClipRRect(
                borderRadius: BorderRadius.circular(16.75),
                child: Image.network(
                  'https://cdn.builder.io/api/v1/image/assets/TEMP/ed76673f65740e0f98f027e2e14ae39e04ca01bc',
                  width: 33,
                  height: 34,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Delivery address',
                      style: TextStyle(
                        color: Color(0xFFC2C2C2),
                        fontSize: 7.3,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Text(
                      '92 High Street, London',
                      style: TextStyle(
                        color: Color(0xFF575757),
                        fontSize: 9.8,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  // Notification icon
                  Image.network(
                    'https://www.winggo.ae/assets/images/logo.svg', // Example icon URL (update as needed)
                    width: 33,
                    height: 33,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Center(
                        child: Text(
                          '$randomNumber', // Display the random number
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          // Search bar
          TextField(
            decoration: InputDecoration(
              hintText: "Search the entire shop",
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          // Random text with gradient background
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFC6D9D3), Color(0xFFB3D6D1)], // Gradient only for this text box
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              "Delivery is 50% cheaper                            ",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
