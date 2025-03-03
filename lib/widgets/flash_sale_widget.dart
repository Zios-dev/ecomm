import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class FlashSaleWidget extends StatefulWidget {
  const FlashSaleWidget({Key? key}) : super(key: key);

  @override
  _FlashSaleWidgetState createState() => _FlashSaleWidgetState();
}

class _FlashSaleWidgetState extends State<FlashSaleWidget> {
  late int _countdownTime;
  late Timer _timer;
  final Map<String, bool> _favorites = {};

  @override
  void initState() {
    super.initState();
    _countdownTime = Random().nextInt(3600) + 600; // Random time (10 to 60 mins)
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdownTime > 0) {
        setState(() {
          _countdownTime--;
        });
      } else {
        _timer.cancel();
      }
    });
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;
    return "$minutes:${secs.toString().padLeft(2, '0')} min";
  }

  void _toggleFavorite(String productName) {
    setState(() {
      _favorites[productName] = !(_favorites[productName] ?? false);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> flashSaleItems = [
      {
        "name": "Apple iPhone 15",
        "image": "assets/images/iphone15.png",
        "price": "\$999"
      },
      {
        "name": "Samsung Earbuds",
        "image": "assets/images/earbuds.png",
        "price": "\$149"
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Flash Sale Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text(
                    "Flash Sale",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Countdown Timer
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      _formatTime(_countdownTime),
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ],
              ),
              // See All Button
              GestureDetector(
                onTap: () {
                  print("See All Clicked!");
                },
                child: const Text(
                  "See All",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Flash Sale Items
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: flashSaleItems.map((item) {
              String productName = item["name"]!;
              return Expanded(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        // Product Image Container
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                            item["image"]!,
                            width: 80,
                            height: 80,
                            fit: BoxFit.contain,
                          ),
                        ),
                        // Favorite Icon (Top Right)
                        Positioned(
                          top: 5,
                          right: 5,
                          child: GestureDetector(
                            onTap: () => _toggleFavorite(productName),
                            child: Icon(
                              _favorites[productName] ?? false
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: _favorites[productName] ?? false ? Colors.red : Colors.grey,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    // Product Name
                    Text(
                      productName,
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    // Product Price
                    Text(
                      item["price"]!,
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green),
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
