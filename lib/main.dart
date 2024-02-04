import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:ram_mandir_history/music_player.dart';

void main() {
  runApp(RamMandirApp());
}

class RamMandirApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ram Mandir History',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate to the main timeline screen after a delay
    Timer(Duration(seconds: 12), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AppHomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Stack(
        children: [
          // Image at the top
          Image.asset(
            'assets/images/jai_ho.jpg',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Center(
            child: AnimatedTextExample(),
          ),
        ],
      ),
    );
  }
}

class AnimatedTextExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: DefaultTextStyle(
        style: TextStyle(
          fontSize: 40.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        child: AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText(
              'Welcome Ram Lalla:',
              speed: Duration(milliseconds: 200),
            ),
            TyperAnimatedText(
              'A divine homecoming in Ayodhya..',
              speed: Duration(milliseconds: 200),
            ),
          ],
          isRepeatingAnimation: false,
        ),
      ),
    );
  }
}

class AppHomePage extends StatefulWidget {
  @override
  _AppHomePageState createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Ram Mandir History'),
        backgroundColor: Colors.deepOrange,
      ),
      body: _currentIndex == 0
          ? RamMandirHistoryPage()
          : AudioPlayerScreen(), // Switched to AudioPlayerScreen for Bhajans
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Temple Timeline',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            label: 'Bhajans',
          ),
        ],
      ),
    );
  }
}

class RamMandirHistoryPage extends StatelessWidget {
  final List<Map<String, dynamic>> history = [
    {
      'year': '1528',
      'event': 'Babri Masjid construction by Demolishing Ram Temple.',
      'image': const AssetImage('assets/images/om_shree.jpg'),
    },
    {
      'year': '1885',
      'event': 'Mahant Raghubar Das files a lawsuit',
      'image': const AssetImage('assets/images/om_shree.jpg'),
    },
    {
      'year': '1949',
      'event':
          'Idols of Rama, Lakshmana, and Sita placed inside the Babri Masjid',
      'image': const AssetImage('assets/images/om_shree.jpg'),
    },
    {
      'year': '1950',
      'event': 'Site placed under government control to maintain peace.',
      'image': const AssetImage('assets/images/om_shree.jpg'),
    },
    {
      'year': '1961',
      'event': 'Hindus allowed to perform symbolic worship inside the mosque.',
      'image': const AssetImage('assets/images/om_shree.jpg'),
    },
    {
      'year': '1984',
      'event':
          'Shilanyas by the Hindus at disputed site, escalating tensions.',
      'image': const AssetImage('assets/images/om_shree.jpg'),
    },
    {
      'year': '1989',
      'event':
          'The VHP launches a campaign for Ram temple Construction on the site.',
      'image': const AssetImage('assets/images/om_shree.jpg'),
    },
    {
      'year': '1992',
      'event': 'Demolition of the Babri Masjid by Hindu kar sevaks',
      'image': const AssetImage('assets/images/om_shree.jpg'),
    },
    {
      'year': '1993',
      'event':
          'Liberhan Commission appointed to investigate the Babri Masjid demolition.',
      'image': const AssetImage('assets/images/om_shree.jpg'),
    },
    {
      'year': '1996',
      'event':
          'Allahabad High Court begins hearing the ownership dispute case.',
      'image': const AssetImage('assets/images/om_shree.jpg'),
    },
    {
      'year': '2002',
      'event': 'Godhra train burning incident and subsequent Gujarat riots.',
      'image': const AssetImage('assets/images/om_shree.jpg'),
    },
    {
      'year': '2003',
      'event': 'ASI conducts excavations at the site.',
      'image': const AssetImage('assets/images/om_shree.jpg'),
    },
    {
      'year': '2009',
      'event': 'ASI report submitted to the High Court',
      'image': const AssetImage('assets/images/om_shree.jpg'),
    },
    {
      'year': '2010',
      'event':
          'Allahabad High Court divides the disputed site into three parts: two-thirds to Hindus, one-third to Muslims.',
      'image': const AssetImage('assets/images/om_shree.jpg'),
    },
    {
      'year': '2019',
      'event':
          'Supreme Court delivers a unanimous verdict, awarding the entire disputed site to Hindus for the construction of a Ram temple.',
      'image': const AssetImage('assets/images/om_shree.jpg'),
    },
    {
      'year': '2020',
      'event':
          'Bhoomi Pujan performed by Prime Minister Narendra Modi, marking the start of Ram temple construction.',
      'image': const AssetImage('assets/images/om_shree.jpg'),
    },
    {
      'year': '2024 (Present)',
      'event': 'Construction of the Ram temple ongoing 🏆',
      'image': const AssetImage('assets/images/om_shree.jpg'),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, index) {
          bool isLeftAligned = index % 2 == 0;

          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: GestureDetector(
                  onTap: () {
                    // _showEventDetails(context, history[index]);
                  },
                  child: TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineXY: 0.5,
                    isFirst: index == 0,
                    isLast: index == history.length - 1,
                    indicatorStyle: IndicatorStyle(
                      width: 60,
                      height: 60,
                      indicator: ClipOval(
                        child: Image(image: history[index]['image']),
                      ),
                    ),
                    beforeLineStyle: LineStyle(color: Colors.deepOrange),
                    afterLineStyle: LineStyle(color: Colors.deepOrange),
                    startChild: isLeftAligned
                        ? SizedBox.shrink()
                        : Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  history[index]['year'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.deepOrange,
                                  ),
                                ),
                                Text(
                                  history[index]['event'],
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                    endChild: isLeftAligned
                        ? Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  history[index]['year'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.deepOrange,
                                  ),
                                ),
                                Text(
                                  history[index]['event'],
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : SizedBox.shrink(),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
