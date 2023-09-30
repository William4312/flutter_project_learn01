import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeArea extends StatefulWidget {
  const HomeArea({super.key});

  @override
  State<HomeArea> createState() => _HomeAreaState();
}

class _HomeAreaState extends State<HomeArea> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Area',
        ),
        backgroundColor: Colors.black12,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Kipas',
            style: GoogleFonts.lato(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black38,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const card_product(),
        ],
      ),
    );
  }
}

class Card_Product_Type extends StatelessWidget {
  late final String card_name;

  Card_Product_Type({required this.card_name});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeArea(),
          ),
        );
      },
      child: Text(
        card_name,
        style: const TextStyle(fontSize: 14),
        textAlign: TextAlign.center,
      ),
    );
  }
}

// ignore: camel_case_types
class card_product extends StatefulWidget {
  const card_product({super.key});

  @override
  State<card_product> createState() => _card_productState();
}

// ignore: camel_case_types
class _card_productState extends State<card_product> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 7, top: 10),
      elevation: 4,
      clipBehavior: Clip.hardEdge,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: const Image(
                  image: NetworkImage(
                    'https://s4.bukalapak.com/img/4018935468/w-1000/Kipas_Angin_Jepit_meja_ARASHI_clip_fan_AR138_20W_desk_fan_AR.jpg',
                  ),
                  fit: BoxFit.cover,
                  width: 200,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text('Product Name: '),
                        Text(
                          'Arashi Fan 24 W',
                          style: GoogleFonts.roboto(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text('Price Product: '),
                        Text(
                          '24.000',
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text('Code Product: '),
                        Text(
                          'UIHSJ2N',
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DetailProduct(),
                          ),
                        );
                      },
                      child: const Text(
                        'Detail',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_bag, size: 14),
                      label: const Text(
                        'Cart',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DetailProduct extends StatelessWidget {
  const DetailProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'Kipas',
              style: TextStyle(fontSize: 30),
            ),
            FilledButton(
              child: const Text(
                'Back to Home',
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchItems = [
    'Banana',
    'Pear',
    'Watermelon',
    'Oranges',
    'Blueberries',
    'Strawberries',
    'Raspberries'
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(
          Icons.clear,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(
        Icons.arrow_back,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> mathQuery = [];
    for (var fruit in searchItems) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        mathQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: mathQuery.length,
      itemBuilder: (context, index) {
        var result = mathQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> mathQuery = [];
    for (var fruit in searchItems) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        mathQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: mathQuery.length,
      itemBuilder: (context, index) {
        var result = mathQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}

// ignore: camel_case_types
class Bottom_navigationBar_Material3 extends StatefulWidget {
  const Bottom_navigationBar_Material3({super.key});

  @override
  State<Bottom_navigationBar_Material3> createState() =>
      _Bottom_navigationBar_Material3State();
}

// ignore: camel_case_types
class _Bottom_navigationBar_Material3State
    extends State<Bottom_navigationBar_Material3> {
  int index = 0;

  final screen = <Widget>[
    const HomeArea(),
    const HomeArea(),
    const HomeArea(),
    const Center(
      child: Text(
        'Customer',
        style: TextStyle(
          fontSize: 27,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: screen[index],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.blue.shade100,
            labelTextStyle: MaterialStateProperty.all(
                const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
          ),
          child: NavigationBar(
            height: 65,
            backgroundColor: const Color(0xFFf1f5fb),
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            animationDuration: const Duration(seconds: 3),
            selectedIndex: index,
            onDestinationSelected: (index) => setState(
              () {
                this.index = index;
              },
            ),
            destinations: const [
              NavigationDestination(
                selectedIcon: Icon(Icons.home),
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: 'Home',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.category),
                icon: Icon(
                  Icons.category_outlined,
                ),
                label: 'Category',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.shopping_basket),
                icon: Icon(
                  Icons.shopping_basket_outlined,
                ),
                label: 'Transaction',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.group),
                icon: Icon(
                  Icons.groups_outlined,
                ),
                label: 'Customer',
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton.extended(
          tooltip: 'This is tooltip',
          onPressed: () {},
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.cyanAccent,
          label: const Text('add note'),
          icon: const Icon(Icons.edit),
          elevation: 10.0,
        ),
      ),
    );
  }
}

void main() {
  runApp(const Bottom_navigationBar_Material3());
}
