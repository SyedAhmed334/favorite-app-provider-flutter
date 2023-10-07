import 'package:favorite_app_flutter/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final selectedItem =
        Provider.of<FavoriteProvider>(context, listen: false).selectedItem;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Items'),
      ),
      body: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return Consumer<FavoriteProvider>(
              builder: (context, value, child) => ListTile(
                onTap: () {
                  value.setSelectedItem(index);
                },
                title: Text('Item $index'),
                trailing: selectedItem.contains(index)
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite_border_outlined),
              ),
            );
          }),
    );
  }
}
