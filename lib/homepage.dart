import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:searchbar_app/models/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Dio _dio = Dio();

  List<Product> _products = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData({String? searchText}) async {
    String url = "https://freetestapi.com/api/v1/products";
    if (searchText != null) url += "?search=$searchText";

    Response res = await _dio.get(url);
    List<Product> products = [];
    if (res.data != null) {
      for (var p in res.data) {
        products.add(Product.fromJson(p));
      }
    }
    setState(() {
      _products = products;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        shadowColor: Colors.grey,

        title: const Text(
          'Products',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
        ), // Title of the app bar
        backgroundColor: Colors.teal, // Background color of the app bar
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.all(16.0), // Padding around the whole column
          child: Column(
            children: [
              _searchBar(),
              const SizedBox(
                  height: 20), // Spacing between search bar and product list
              _products.isNotEmpty
                  ? _productsListView()
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("No products found"),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 10.0), // Padding inside the search bar container
      decoration: BoxDecoration(
        color: Colors.white, // Background color of the search bar
        borderRadius:
            BorderRadius.circular(10.0), // Rounded corners for the search bar
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color with opacity
            spreadRadius: 2, // Spread radius of the shadow
            blurRadius: 5, // Blur radius of the shadow
            offset: const Offset(0, 3), // Offset of the shadow
          ),
        ],
      ),
      child: TextField(
        onSubmitted: (value) {
          _loadData(searchText: value); // Load data based on the search text
        },
        decoration: const InputDecoration(
          border: InputBorder.none, // No border for the text field
          hintText: "Search...", // Hint text for the search field
          hintStyle: TextStyle(
            fontSize: 18, // Font size of the hint text
            color: Colors.grey, // Color of the hint text
          ),
          icon: Icon(Icons.search,
              color: Colors.grey), // Search icon inside the text field
        ),
      ),
    );
  }

  Widget _productsListView() {
    return ListView.builder(
      shrinkWrap: true, // Shrink the list view to its content size
      physics:
          const NeverScrollableScrollPhysics(), // Disable scrolling for the list view
      itemCount: _products.length, // Number of items in the list
      itemBuilder: (context, index) {
        Product product = _products[index]; // Get product at the current index
        return Card(
          margin: const EdgeInsets.symmetric(
              vertical: 10), // Margin around each card
          elevation: 5, // Elevation for the card shadow
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10.0), // Rounded corners for the card
          ),
          child: ListTile(
            contentPadding:
                const EdgeInsets.all(10.0), // Padding inside the list tile
            title: Text(
              product.name, // Product name
              style: const TextStyle(
                  fontWeight:
                      FontWeight.bold), // Bold text for the product name
            ),
            leading: ClipRRect(
              borderRadius:
                  BorderRadius.circular(10.0), // Rounded corners for the image
              child: Image.network(
                product.image, // Product image URL
                height: 50, // Fixed height for the image
                width: 50, // Fixed width for the image
                fit: BoxFit.cover, // Cover the image inside the bounds
              ),
            ),
            subtitle: Text(
                "${product.brand} - \$${product.price.toString()}"), // Product brand and price
            trailing: Text(
              "${product.rating.toString()} ⭐", // Product rating with a star symbol
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.teal), // Text style for the rating
            ),
          ),
        );
      },
    );
  }
}
