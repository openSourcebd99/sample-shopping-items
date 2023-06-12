import 'package:flutter/material.dart';

void main() {
  runApp(const ShoppingListApp());
}

class ShoppingListApp extends StatelessWidget {
  const ShoppingListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  List<Map<String, String>> shopping_items = [
    {
      'title': 'Apples',
    },
    {
      'title': 'Bananas',
    },
    {
      'title': 'Bread',
    },
    {
      'title': 'Milk',
    },
    {
      'title': 'Eggs',
    },
  ];

  infoSnackBar(BuildContext context, message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shopping List'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              infoSnackBar(context, 'Cart is empty');
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: shopping_items.length, // Use the length of your list
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.shopping_basket),
                  title: Text(shopping_items[index]
                      ['title']!), // Use the data from your list
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
