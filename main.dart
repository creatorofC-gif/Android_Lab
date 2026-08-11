import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Express',
      theme: ThemeData(

        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const FoodHomepage(title: 'Food Delivery App',),
    );
  }
}

class FoodHomepage extends StatefulWidget {
  const FoodHomepage({super.key, required this.title});


  final String title;

  @override
  State<FoodHomepage> createState() => _FoodHomepageState();
}

class _FoodHomepageState extends State<FoodHomepage> {
  int cartCounter = 0;
  int selectedIndex = 0;

  void addToCart() {
    setState(() {
     cartCounter++;
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Item Added")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          Icon(Icons.notifications),
        ],
      ),
    drawer: Drawer(
    child: ListView(
    children: [
    DrawerHeader(child: Text("Food Panda 🐼",style: TextStyle(fontSize: 25))),
      ListTile(
    leading: Icon(Icons.home),
    title: Text("Home"),
    ),
    ListTile(
    leading: Icon(Icons.restaurant),
    title: Text("My Orders"),
    ),
    ListTile(
    leading: Icon(Icons.favorite),
    title: Text("My Favourites"),
    ),
    ListTile(
    leading: Icon(Icons.person),
    title: Text("Profile"),
    ),
    ListTile(
    leading: Icon(Icons.settings),
    title: Text("Settings"),
    ),
    ],
    ),
    ),
    body: SingleChildScrollView(
    child: Column(
    children: [

    SizedBox(height: 20),
    Center(
    child: Column(
    children: [

    Text(
    "Welcome to Food Panda 🐼",
    style: TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    ),
    ),

    Text(
    " food delivered to your doorstep",
    ),

    ],
    ),
    ),

    SizedBox(height: 20),

      Image.asset(
        "Assets/anh-nguyen-kcA-c3f_3FE-unsplash.jpg",
        height: 150,
        width: 250,
      ),

      SizedBox(height: 20),
    Text(
    "Delicious Food Near You",
    style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    ),
    ),

    SizedBox(height: 20),

      Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(
    children: [
      Icon(Icons.local_pizza),
    Text("Pizza"),
    ],
    ),

    Column(
    children: [
      Icon(Icons.ramen_dining),
    Text("Chinese"),
    ],
    ),


    Column(
    children: [
      Icon(Icons.lunch_dining),
    Text("Burger"),
    ],
    ),

    Column(
    children: [
      Icon(Icons.restaurant),
    Text("Indian"),
    ],
    )
    ],

    ),
    SizedBox(height: 30),

    FoodItem(
    addToCart: addToCart,
    ),
      SizedBox(height: 30),
      ],
      ),
      ),


      floatingActionButton: FloatingActionButton(
    onPressed: () {
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
    content: Text("Cart Items: $cartCounter"),
    ),
    );
    },
    child: Icon(Icons.shopping_cart),
    ),

    );
  }
}

class FoodItem extends StatelessWidget {

  final Function addToCart;

  FoodItem({required this.addToCart});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        Image.asset(
          "Assets/anh-nguyen-kcA-c3f_3FE-unsplash.jpg",
          height: 150,
          width: 250,
        ),

        SizedBox(height: 10),

        Text(
          "Margherita Pizza",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        Text("Fresh mozzarella, tomato and basil"),

        Text(
          "₹299",
          style: TextStyle(
            fontSize: 18,
          ),
        ),

        SizedBox(height: 10),

        ElevatedButton(
          onPressed: () {
            addToCart();
          },
          child: Text("Add to Cart"),
        ),

      ],
    );
  }
}
