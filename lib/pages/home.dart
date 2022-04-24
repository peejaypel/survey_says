import 'package:flutter/material.dart';
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
            img: const AssetImage('logo/surveysays_black.png'),
            school: 'CIIT',
            name: 'Cathryn Santos',
            title:
                'CIIT Presidential Mock Elections',
            //https://docs.google.com/forms/d/e/1FAIpQLSdYi315soEV0TroQWO9FZ-xy0TaqBYd8ufUNqka_ysHAJn9kQ/viewform
            context: context,
          ),
          SurveyCard(
            img: const AssetImage('logo/surveysays_black.png'),
            school: 'YouTube(Public)',
            name: 'Ropher',
            title: 'CryptoBread Cryptocurrency Survey',
            //https://docs.google.com/forms/d/e/1FAIpQLSfaKGLCtZE1PBrGhe99kfUkJKEyDPQJIuNguhNZfBbSuaJLyQ/viewform
            context: context,
          ),
          SurveyCard(
            img: const AssetImage('logo/surveysays_black.png'),
            school: 'CIIT',
            name: 'Eder Junior Chua',
            title:
            'Social Life of Students During the Pandemic',
            //https://docs.google.com/forms/d/e/1FAIpQLSfT8JMiLP8AXRa_lmFdr-WZQJVafbGD1dsR8-5OdXP_xoH6_Q/viewform
            context: context,
          ),
          SurveyCard(
            img: const AssetImage('logo/surveysays_black.png'),
            school: 'CIIT',
            name: 'Patrick Jade Pelicano',
            title:
            'PC Building Survey',
            //https://docs.google.com/forms/d/e/1FAIpQLSfIFaJxTbSnK3FFWNcPN7bBOtvXT-PclRKeUZfYsFHdJCswTQ/viewform
            context: context,
          ),
          SurveyCard(
            img: const AssetImage('logo/surveysays_black.png'),
            school: 'CIIT (Syntax Members)',
            name: 'Eder Junior Chua',
            title:
            'Survey for the Upcoming Code Sessions',
            //https://docs.google.com/forms/d/e/1FAIpQLSf_Bup_hipErwmAF-d2qVJ_KRaNcGFe_7Hmd19gGKEBcY06oA/viewform
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
                    backgroundImage: AssetImage('logo/surveysays_black.png'),
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
                onPressed: () => Navigator.of(context).pop()
                      // MaterialPageRoute(
                      //     builder: (BuildContext context) => Login()));
                ,
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
  final BuildContext context;

  const SurveyCard(
      {Key? key,
      required this.img,
      required this.school,
      required this.name,
      required this.title,
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

  const SurveyInfo(
      {Key? key,
      required this.img,
      required this.school,
      required this.name,
      required this.title})
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
            ],
          ),
        ),
      ),
    );
  }
}
