import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:survey_says/pages/login.dart';

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
      ListView(
        children: [
          SurveyCard(
            img: const AssetImage('assets/cathryn-santos.jpg'),
            school: 'CIIT',
            name: 'Cathryn Santos',
            title: 'CIIT Presidential Mock Elections',
            url:'https://docs.google.com/forms/d/e/1FAIpQLSdYi315soEV0TroQWO9FZ-xy0TaqBYd8ufUNqka_ysHAJn9kQ/viewform',
            context: context,
          ),
          SurveyCard(
            img: const AssetImage('assets/ropher.jpg'),
            school: 'YouTube(Public)',
            name: 'Ropher',
            title: 'CryptoBread Cryptocurrency Survey',
            url:'https://docs.google.com/forms/d/e/1FAIpQLSfaKGLCtZE1PBrGhe99kfUkJKEyDPQJIuNguhNZfBbSuaJLyQ/viewform',
            context: context,
          ),
          SurveyCard(
            img: const AssetImage('assets/eder-chua.jpg'),
            school: 'CIIT',
            name: 'Eder Junior Chua',
            title: 'Social Life of Students During the Pandemic',
            url:'https://docs.google.com/forms/d/e/1FAIpQLSfT8JMiLP8AXRa_lmFdr-WZQJVafbGD1dsR8-5OdXP_xoH6_Q/viewform',
            context: context,
          ),
          SurveyCard(
            img: const AssetImage('assets/patrick-pelicano.jpg'),
            school: 'CIIT',
            name: 'Patrick Jade Pelicano',
            title: 'PC Building Survey',
            url:'https://docs.google.com/forms/d/e/1FAIpQLSfIFaJxTbSnK3FFWNcPN7bBOtvXT-PclRKeUZfYsFHdJCswTQ/viewform',
            context: context,
          ),
          SurveyCard(
            img: const AssetImage('assets/eder-chua.jpg'),
            school: 'CIIT (Syntax Members)',
            name: 'Eder Junior Chua',
            title: 'Survey for the Upcoming Code Sessions',
            url:'https://docs.google.com/forms/d/e/1FAIpQLSf_Bup_hipErwmAF-d2qVJ_KRaNcGFe_7Hmd19gGKEBcY06oA/viewform',
            context: context,
          ),
        ],
        padding: const EdgeInsets.all(10),
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
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/eder-chua.jpg'),
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
                      alignment: Alignment.centerLeft,
                      child: Text("LOGOUT", style: TextStyle(fontSize: 18))),
                ),
              ),
            )
          ],
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.deepPurple[900],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Survey Says'),
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
    );
  }
}

class SurveyCard extends Card {
  final AssetImage img;
  final String school;
  final String name;
  final String title;
  final String url;
  final BuildContext context;

  const SurveyCard(
      {Key? key,
      required this.img,
      required this.school,
      required this.name,
      required this.title,
      required this.url,
      required this.context})
      : super(key: key);

  @override
  Color? get color => Colors.blue[200];

  @override
  ShapeBorder? get shape =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));

  @override
  Widget? get child => GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: img,
                    radius: 30,
                  ),
                  Container(
                    height: 60,
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width - 134),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Flexible(
                            child: Text(name),
                          ),
                          Expanded(
                            child: Text(
                              school,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 25),
              child: Text(
                title,
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SurveyInfo(
                      img: img,
                      school: school,
                      name: name,
                      title: title,
                      url: url,
                    )),
          );
        },
      );
}

class SurveyInfo extends StatelessWidget {
  final AssetImage img;
  final String school;
  final String name;
  final String title;
  final String url;

  const SurveyInfo(
      {Key? key,
      required this.img,
      required this.school,
      required this.name,
      required this.title,
      required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double padding = 20;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Padding(
          padding: const EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: img,
                    radius: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(padding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          school,
                        ),
                        Text(
                          name,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                    child:InAppWebView(
                      initialUrlRequest: URLRequest(
                          url: Uri.parse(url)
                      ),
                    )
                ),
              ),
              Container(
                  child:
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
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