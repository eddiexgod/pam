import 'package:flutter/material.dart';
import 'wine.dart';

class WineCard extends StatelessWidget {
  final Wine wine;
  final VoidCallback onFavoriteToggle;

  WineCard({required this.wine, required this.onFavoriteToggle});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(wine.imageUrl, width: 50, height: 50),
        title: Text(wine.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(wine.description),
            Text('Price: \$${wine.price.toStringAsFixed(2)}'),
            Text('Country: ${wine.country}'),
            Text(
              wine.isAvailable ? 'Available' : 'Unavailable',
              style: TextStyle(
                color: wine.isAvailable ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(
            wine.isFavorite ? Icons.favorite : Icons.favorite_border,
            color: wine.isFavorite ? Colors.red : null,
          ),
          onPressed: onFavoriteToggle,
        ),
      ),
    );
  }
}
