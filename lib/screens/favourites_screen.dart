import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  Future<void> _uploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      print("File selected: \${file.path}");
      // Add file upload logic here
    } else {
      print("No file selected");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.upload),
            onPressed: _uploadFile,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150, // Adjust height as needed
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Image.asset('assets/nintendo1.png', width: 150),
                  const SizedBox(width: 10),
                  Image.asset('assets/nintendo2.png', width: 150),
                  const SizedBox(width: 10),
                  Image.asset('assets/nintendo3.png', width: 150),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Nintendo Grey Switch',
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.star, color: Colors.blue),
                const SizedBox(width: 5),
                Text(
                  '4.8 (117 reviews)',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 20),
                Icon(Icons.star, color: Colors.yellow),
                const SizedBox(width: 5),
                Text(
                  '94%',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 20),
                Icon(Icons.info_outline, color: Colors.grey),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  '£169.00',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 12),
                Text(
                  'from £14 per month',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'The Nintendo Switch gaming console is a compact device that can be taken everywhere. This portable super device is also equipped with 2 gamepads. Read more',
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      backgroundColor: Colors.yellowAccent,
                    ),
                    onPressed: () {},
                    child: Text(
                      'Add to Cart',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Delivery on 26 October',
                    style: TextStyle(fontSize: 14, color: Colors.black),
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



