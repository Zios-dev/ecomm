import 'package:ecom/widgets/bottom_nav_bar_widget.dart';
import 'package:ecom/widgets/category_widget.dart';
import 'package:ecom/widgets/flash_sale_widget.dart';
import 'package:ecom/widgets/header.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
    child: Column(
      children: [
        HeaderWidget(),
        CategoryWidget(),
        FlashSaleWidget(),
      ],
    )
    ),
      ),
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}
