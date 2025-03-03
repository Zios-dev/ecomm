import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Category data with images
    final List<Map<String, String>> categories = [
      {"name": "Phone", "image": "assets/phone.png"},
      {"name": "Consoles", "image": "assets/console.png"},
      {"name": "Laptop", "image": "assets/laptop.png"},
      {"name": "Camera", "image": "assets/camera.png"},
      {"name": "Audio", "image": "assets/audio.png"},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Category title and "See All" button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Category",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Handle "See All" click
                  print("See All Clicked!");
                },
                child: const Text(
                  "See All",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Category items in a row with Expanded
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: categories.map((category) {
              return Expanded(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        category["image"]!,
                        width: 50,
                        height: 50,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      category["name"]!,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
