import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MedDoc',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> imageUrls = [
    'https://www.shutterstock.com/image-vector/hand-drawn-girl-take-care-260nw-1384995326.jpg',
    'https://buzzrx.s3.amazonaws.com/1ac6c8f4-059d-44b3-81fa-6827559ed545/6CausesofHeartDisease.png',
    'https://www.shutterstock.com/image-vector/diabetes-flat-vector-infographic-elements-260nw-1779393833.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade600,
        title: Text("MedDoc",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.greenAccent.shade700,
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text('Profile',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30)),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.list,
                  size: 25,
                  color: Colors.greenAccent.shade700,
                ),
                title: Text(
                  'Dashboard',
                  style: TextStyle(
                      color: Colors.greenAccent.shade700,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(
                  Icons.notification_important_rounded,
                  size: 25,
                  color: Colors.greenAccent.shade700,
                ),
                title: Text(
                  'Notifications',
                  style: TextStyle(
                      color: Colors.greenAccent.shade700,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(
                  Icons.call,
                  size: 25,
                  color: Colors.greenAccent.shade700,
                ),
                title: Text(
                  'Book Appointment',
                  style: TextStyle(
                      color: Colors.greenAccent.shade700,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(
                  Icons.settings_outlined,
                  size: 25,
                  color: Colors.greenAccent.shade700,
                ),
                title: Text(
                  'Settings',
                  style: TextStyle(
                      color: Colors.greenAccent.shade700,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                onTap: () {},
              ),
            ],
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15.0,
            ),
            CarouselSlider(
              items: imageUrls.map((imageUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage(imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                autoPlay: true,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TreatCard(
                  icondata: Icons.settings_accessibility,
                  cardname: 'Skin Treatment',
                ),
                TreatCard(
                  icondata: Icons.heart_broken,
                  cardname: 'Heart Disease Treatment',
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TreatCard(
                  icondata: Icons.medication,
                  cardname: 'Diabetes Treatment',
                ),
                TreatCard(
                  icondata: Icons.psychology,
                  cardname: 'Brain Tumor Treatment',
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ChatwithUs()));
        },
        tooltip: 'Chat with Us',
        backgroundColor: Colors.green.shade600,
        child: Icon(
          Icons.chat_bubble,
          color: Colors.white,
        ),
      ),
    );
  }
}

class TreatCard extends StatefulWidget {
  TreatCard({super.key, required this.cardname, required this.icondata});
  String cardname;
  IconData icondata;
  @override
  State<TreatCard> createState() => _TreatCardState();
}

class _TreatCardState extends State<TreatCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ChatwithUs()));
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Container(
            color: Colors.white,
            height: 175,
            width: 175,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Card(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      widget.icondata,
                      size: 25,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Center(
                      child: Text(
                        '${widget.cardname}',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ChatwithUs extends StatefulWidget {
  const ChatwithUs({super.key});

  @override
  State<ChatwithUs> createState() => _ChatwithUsState();
}

class _ChatwithUsState extends State<ChatwithUs> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text(
            'Under Development',
            style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
