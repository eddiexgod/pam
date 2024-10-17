import 'package:flutter/material.dart';
import 'wine.dart';
import 'wine_card.dart';

void main() {
  runApp(WineShopApp());
}

class WineShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wine Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WineListScreen(),
    );
  }
}

class WineListScreen extends StatefulWidget {
  @override
  _WineListScreenState createState() => _WineListScreenState();
}

class _WineListScreenState extends State<WineListScreen> {
  String? _selectedType = 'All';
  String? _selectedStyle = 'All';
  String? _selectedCountry = 'All';

  List<Wine> wines = [
    Wine(
      name: 'Cricova Cabernet Sauvignon',
      description: 'Red Wine (Clean and Flinty) from Champagne Blanc...',
      price: 23256.596,
      isAvailable: true,
      imageUrl: 'https://livrareflori.md/files/getfilecdn/56362/vin-cricova-ornament-rose-demidulce-0.75l-w445-h445.jpeg',
      type: 'Red Wine',
      style: 'Still',
      country: 'France',
    ),
    Wine(
      name: 'Cricova Pastoral',
      description: 'White Wine (Iron and Flint) from Burgundy...',
      price: 23256.596,
      isAvailable: true,
      imageUrl: 'https://winechateau.co.uk/wp-content/uploads/2022/07/Feteasca-Wine.jpg',
      type: 'White Wine',
      style: 'Still',
      country: 'France',
    ),
    Wine(
      name: 'Feteasca Neagra',
      description: 'Sparkling Wine from Champagne, France...',
      price: 23256.596,
      isAvailable: false,
      imageUrl: 'https://winechateau.co.uk/wp-content/uploads/2022/07/cricova-semidry-red.jpg',
      type: 'Sparkling Wine',
      style: 'Sparkling',
      country: 'France',
    ),
    // Vinuri adiționale
    Wine(
      name: 'Chisinau Rose',
      description: 'Red Wine from Jumilla, Spain...',
      price: 18956.49,
      isAvailable: true,
      imageUrl: 'https://bestbuyliquors.com/media/catalog/product/cache/ae951d999521a598e95129c0582cc30f/c/r/cricova-lidia.jpg',
      type: 'Red Wine',
      style: 'Still',
      country: 'Spain',
    ),
    Wine(
      name: 'Cricova Rose',
      description: 'Red Wine from Sardinia, Italy...',
      price: 20567.32,
      isAvailable: true,
      imageUrl: 'https://livrareflori.md/files/getfilecdn/57023/vin-cricova-vintage-sauvignon-alb-sec-0.75l-85-w445-h445.jpeg',
      type: 'Red Wine',
      style: 'Still',
      country: 'Italy',
    ),
    Wine(
      name: 'Rose Wine Porto',
      description: 'White Wine from Vinho Verde, Portugal...',
      price: 15467.89,
      isAvailable: true,
      imageUrl: 'https://winechateau.co.uk/wp-content/uploads/2022/07/Cabernet-Sauvignon-1.jpg',
      type: 'White Wine',
      style: 'Still',
      country: 'Portugal',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<Wine> filteredWines = wines.where((wine) {
      final matchesType = _selectedType == 'All' || wine.type == _selectedType;
      final matchesStyle = _selectedStyle == 'All' || wine.style == _selectedStyle;
      final matchesCountry = _selectedCountry == 'All' || wine.country == _selectedCountry;
      return matchesType && matchesStyle && matchesCountry;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Wine Shop'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Funcționalitate de căutare
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Funcționalitate de coș de cumpărături
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                DropdownButton<String>(
                  hint: Text('Type'),
                  value: _selectedType,
                  items: ['All', 'Red Wine', 'White Wine', 'Sparkling Wine']
                      .map((type) => DropdownMenuItem(
                    value: type,
                    child: Text(type),
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedType = value;
                    });
                  },
                ),
                SizedBox(width: 10),
                DropdownButton<String>(
                  hint: Text('Style'),
                  value: _selectedStyle,
                  items: ['All', 'Still', 'Sparkling']
                      .map((style) => DropdownMenuItem(
                    value: style,
                    child: Text(style),
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedStyle = value;
                    });
                  },
                ),
                SizedBox(width: 10),
                DropdownButton<String>(
                  hint: Text('Country'),
                  value: _selectedCountry,
                  items: ['All', 'France', 'Italy', 'Spain', 'Portugal']
                      .map((country) => DropdownMenuItem(
                    value: country,
                    child: Text(country),
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCountry = value;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredWines.length,
              itemBuilder: (context, index) {
                return WineCard(
                  wine: filteredWines[index],
                  onFavoriteToggle: () {
                    setState(() {
                      filteredWines[index].isFavorite =
                      !filteredWines[index].isFavorite;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
