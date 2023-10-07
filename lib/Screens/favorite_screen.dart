import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../favorite_provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final myFavoriteItems = Provider.of<FavoriteProvider>(context).selectedItem;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Items'),
      ),
      body: ListView.builder(
          itemCount: myFavoriteItems.length,
          itemBuilder: (context, index) {
            return Consumer<FavoriteProvider>(
              builder: (context, value, child) => ListTile(
                onTap: () {
                  if (value.selectedItem.contains(index)) {
                    value.removeItem(index);
                  } else {
                    value.addItem(index);
                  }
                },
                title: Text('Item $index'),
                trailing: value.selectedItem.contains(index)
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite_border_outlined),
              ),
            );
          }),
    );
  }
}
