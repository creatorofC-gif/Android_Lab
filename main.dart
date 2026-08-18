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

  String category = "All";

  Widget showFood() {
    switch (category) {
      case "Pizza":
        return Column(
          children: [
            Image.asset(
              "Assets/pizza.jpg",
              height: 150,
            ),
            Text("Margherita Pizza"),
            Text("₹299"),
          ],
        );

      case "Chinese":
        return Column(
          children: [
            Image.asset(
              "Assets/chinese.jpg",
              height: 150,
            ),
            Text("Chinese Noodles"),
            Text("₹199"),
          ],
        );

      case "Burger":
        return Column(
          children: [
            Image.asset(
              "Assets/burger.jpg",
              height: 150,
            ),
            Text("Burger"),
            Text("₹299"),
          ],
        );

      case "All":
        return Column(
          children: [
            Image.asset(
              "Assets/pizza.jpg",
              height: 150,
            ),
            Text("Margherita Pizza"),
            Text("₹299"),

            SizedBox(height: 20),

            Image.asset(
              "Assets/chinese.jpg",
              height: 150,
            ),
            Text("Chinese Noodles"),
            Text("₹199"),

            SizedBox(height: 20),

            Image.asset(
              "Assets/burger.jpg",
              height: 150,
            ),
            Text("Burger"),
            Text("₹299"),
          ],
        );

      default:
        return Text("No food available");
    }
  }
  
  
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
      ElevatedButton(onPressed: (){
        setState(() {
          category = "Pizza";
        });
      }, child: Text("Pizza")),
      Icon(Icons.local_pizza),

    ],
    ),

    Column(
    children: [
      ElevatedButton(onPressed: (){
        setState(() {
          category = "Chinese";
        });
      }, child: Text("Chinese")),
      Icon(Icons.ramen_dining),
    ],
    ),


    Column(
    children: [
      ElevatedButton(onPressed: (){
        setState(() {
          category = "Burger";
        });
      }, child: Text("Burger")),
      Icon(Icons.lunch_dining),
    ],
    ),

    Column(
    children: [
      ElevatedButton(onPressed: (){
        setState(() {
          category = "All";
        });
      }, child: Text("All")),
      Icon(Icons.local_dining),
    ],
    ),

    ],

    ),
      showFood(),
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
