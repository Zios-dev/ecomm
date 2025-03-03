import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<CartItem> cartItems = [
    CartItem("Nintendo Switch Lite, Yellow", "assets/switch_lite.png", 109.00, 1, true),
    CartItem("The Legend of Zelda: Tears of the Kingdom", "assets/zelda.png", 39.00, 1, true),
  ];

  bool selectAll = true;

  void updateSelectAll(bool value) {
    setState(() {
      selectAll = value;
      for (var item in cartItems) {
        item.isSelected = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cart")),
      body: Column(
        children: [
          _buildAddressSection(),
          _buildSelectAllSection(),
          _buildCartItems(),
          _buildCheckoutSection(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildAddressSection() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.grey[200]),
      child: Row(
        children: [
          const Icon(Icons.location_on, color: Colors.black54),
          const SizedBox(width: 8),
          const Expanded(child: Text("92 High Street, London")),
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
        ],
      ),
    );
  }

  Widget _buildSelectAllSection() {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Checkbox(
            value: selectAll,
            onChanged: (value) => updateSelectAll(value!),
          ),
          const Text("Select all"),
        ],
      ),
    );
  }

  Widget _buildCartItems() {
    return Expanded(
      child: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return _buildCartItem(cartItems[index]);
        },
      ),
    );
  }

  Widget _buildCartItem(CartItem item) {
    return ListTile(
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: item.isSelected,
            onChanged: (value) {
              setState(() {
                item.isSelected = value!;
                selectAll = cartItems.every((item) => item.isSelected);
              });
            },
          ),
          Image.asset(item.image, width: 50, height: 50),
        ],
      ),
      title: Text(item.name),
      subtitle: Text("£${item.price.toStringAsFixed(2)}"),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: item.quantity > 1
                ? () => setState(() => item.quantity--)
                : null,
          ),
          Text("${item.quantity}"),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => setState(() => item.quantity++),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckoutSection() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.black12, blurRadius: 4)
      ]),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
        onPressed: () {},
        child: const Text("Checkout"),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.category), label: "Catalog"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorites"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
      currentIndex: 2,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
    );
  }
}

class CartItem {
  String name;
  String image;
  double price;
  int quantity;
  bool isSelected;

  CartItem(this.name, this.image, this.price, this.quantity, this.isSelected);
}
