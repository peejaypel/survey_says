import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:arwyn_cookbook/pages/login.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Login login = Login.instance;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //Switch Home <> Settings
    final List<Widget> _widgetOptions = <Widget>[
      Scaffold(
        backgroundColor: Colors.white70,
        body: ListView(
          children: [
            RecipeCard(
              imageLocation: 'assets/recipe/kare-kare.png',
              name: 'Kare Kare Recipe',
              ingredients: """3 lbs oxtail cut in 2 inch slices 
you an also use tripe or beef slices
1 piece small banana flower bud sliced
1 bundle pechay or bok choy
1 bundle string beans cut into 2 inch slices
4 pieces eggplants sliced
1 cup ground peanuts
1/2 cup peanut butter
1/2 cup shrimp paste
34 Ounces water about 1 Liter
1/2 cup annatto seeds soaked in a cup of water
1/2 cup toasted ground rice
1 tbsp garlic minced
1 piece onion chopped
salt and pepper""",
              url: 'https://pin.it/3wPkpN9',
              context: context,
            ),
            RecipeCard(
              imageLocation: 'assets/recipe/adobo.jpg',
              name: 'Filipino-Style Chicken Adobo',
              ingredients:
"""1 tablespoon (15ml) canola oil 
or other neutral oil
4 bone-in, skin-on chicken legs,
separated into thighs and drumsticks
(about 2 1/2 pounds; 1.15kg)
Kosher salt
8 cloves garlic, thinly sliced
2 whole fresh bay leaves 
(or 3 whole dried bay leaves)
1 1/2 teaspoons whole black peppercorns
1 1/4 cups (300ml) water
1 cup (240ml) soy sauce
1 cup (240ml) rice vinegar (see notes). Steamed white rice or garlic fried rice, for serving
""",
              //https://assets.pinterest.com/ext/embed.html?id=829014243904125706
              url:
                  'https://pin.it/2sTgsbZ',
              context: context,
            ),
            RecipeCard(
              imageLocation: 'assets/recipe/sinangag.png',
              name: 'Sinangag (Filipino Garlic Fried Rice)',
              ingredients:
"""3 Tbsp vegetable oil
12 cloves garlic, minced
4 c cooked rice, cooled and dry
¼ tsp salt
Dash fresh ground pepper
1 scallion, thinly sliced (for garnish)
4 eggs (optional, for serving)""",
              url: 'https://pin.it/7kBRwtf',
              context: context,
            ),
          ],
          padding: const EdgeInsets.all(10),
        ),
      ),
      Container(
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/arwyn.png'),
                    radius: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(login.thisUser?.email ?? "Guest"),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                color: Colors.grey,
                height: 2,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Login()));
                },
                child: const SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: Align(
                      alignment: Alignment.center,
                      child: Text("LOGOUT", style: TextStyle(fontSize: 18))),
                ),
              ),
            )
          ],
        ),
      ),
    ];

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.deepPurple[900],
        appBar: AppBar(
          elevation: 5,
          backgroundColor: Colors.deepPurpleAccent,
          automaticallyImplyLeading: false,
          title: const Text('Arwyn Cookbook'),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.black45,
          selectedItemColor: Colors.deepPurpleAccent,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class RecipeCard extends Card {
  final String imageLocation;
  final String name;
  final String ingredients;
  final String url;
  final BuildContext context;

  const RecipeCard(
      {Key? key,
      required this.imageLocation,
      required this.name,
      required this.ingredients,
      required this.url,
      required this.context})
      : super(key: key);

  @override
  Color? get color => Colors.white;

  @override
  ShapeBorder? get shape =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));

  @override
  Widget? get child => GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
                child: Image.asset(imageLocation),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0))),
            Container(
              height: 350,
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width - 134),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Flexible(
                        child: Text(name,
                            style: const TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(ingredients,
                          style: const TextStyle(fontSize: 16),
                          overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RecipeInfo(
                      img: Image.asset(imageLocation),
                      ingredients: ingredients,
                      name: name,
                      url: url,
                    )),
          );
        },
      );
}

class RecipeInfo extends StatelessWidget {
  final Image img;
  final String name;
  final String ingredients;
  final String url;

  const RecipeInfo(
      {Key? key,
      required this.img,
      required this.name,
      required this.ingredients,
      required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double padding = 20;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(name,
                  style: const TextStyle(
                      fontSize: 32, fontWeight: FontWeight.bold)),
              Container(
                height: 1000,
                child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: InAppWebView(
                      initialUrlRequest: URLRequest(url: Uri.parse(url)),
                    )),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.deepPurpleAccent),
                      ),
                      onPressed: () => _launchUrl(Uri.parse(url)),
                      child: Text('Open in Browser'),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

_launchUrl(Uri _url) async {
  if (!await launchUrl(_url)) throw 'Could not launch $_url';
}
