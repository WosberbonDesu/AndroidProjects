import 'dart:io';

/// Flutter code sample for BottomNavigationBar

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has four [BottomNavigationBarItem]
// widgets, which means it defaults to [BottomNavigationBarType.shifting], and
// the [currentIndex] is set to index 0. The selected item is amber in color.
// With each [BottomNavigationBarItem] widget, backgroundColor property is
// also defined, which changes the background color of [BottomNavigationBar],
// when that item is selected. The `_onItemTapped` function changes the
// selected item's index and displays a corresponding message in the center of
// the [Scaffold].

import 'package:flutter/material.dart';
import 'dart:ui';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Instagram UI Clone';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(color: Colors.redAccent,fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    //Text(
      //'Home',
      //style: TextStyle(
        //color: Colors.redAccent
      //),
    //),
    Text(
      'Search',
      style: TextStyle(
          color: Colors.redAccent
      ),
    ),
    Text(
      'Post',
      style: TextStyle(
          color: Colors.redAccent
      ),
    ),
    Text(
      'Activity',
      style: TextStyle(
          color: Colors.redAccent
      ),
    ),
    Text(
      'Profile',
      style: TextStyle(
          color: Colors.redAccent
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset('images/camera.png', height: 35),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                    child: Image.asset(
                      'images/title.png',
                      fit: BoxFit.cover,
                      height: 40,
                    ),
                  ),
                ],
              ),
              Image.asset('images/message.png', height: 35),
            ],
          ),
          backgroundColor: Colors.orangeAccent,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 10.0],
                colors: [Colors.orange.shade100, Colors.deepOrangeAccent]),
            color: Colors.white,

          ),
          //color: Colors.white,
          child: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('images/home.png')),
              activeIcon: ImageIcon(AssetImage('images/home_active.png')),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('images/search.png')),
              activeIcon: ImageIcon(AssetImage('images/search_active.png')),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('images/post.png')),
              activeIcon: ImageIcon(AssetImage('images/post_active.png')),
              label: 'Post',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('images/heart.png')),
              activeIcon: ImageIcon(AssetImage('images/heart_active.png')),
              label: 'Activity',
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                backgroundColor: Colors.red,

                foregroundImage: AssetImage('images/7.png'),
                radius: 15,
                backgroundImage: AssetImage('images/7.png'),
              ),
              activeIcon: CircleAvatar(
                foregroundColor: Colors.red,
                radius: 18,
                backgroundColor: Colors.black,
                child: CircleAvatar(

                  radius: 17,
                  backgroundColor: Colors.red,
                  child: CircleAvatar(

                    foregroundImage: AssetImage('images/7.png'),
                    backgroundColor: Colors.red,
                    radius: 15,
                    backgroundImage: AssetImage('images/7.png'),
                  ),
                ),
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          backgroundColor: Colors.orangeAccent,
          selectedItemColor: Colors.black87,
          unselectedItemColor: Colors.black87,
          iconSize: 35.0,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}



Widget HomeScreen(){
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 16.0),
                child: Column(
                  children: [
                    Stack(

                      children: <Widget>[
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage(
                            "images/7.png",
                          ),
                        ),
                        Positioned(
                          right: -2.0,
                          bottom: -2.0,
                          child: CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.deepOrangeAccent,
                            child: CircleAvatar(
                              backgroundColor: Colors.grey.shade600,
                              radius: 10,
                              backgroundImage: AssetImage(
                                  "images/addstory.png"
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        "Your Story",
                        style: TextStyle(
                            color: Colors.black,

                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //instagrammer1
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 8.0),
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 39,
                      backgroundImage: AssetImage('images/storybackground.jpg'),
                      child: CircleAvatar(
                        radius: 37,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 35,
                          backgroundImage:
                          AssetImage('images/1.png'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Container(
                          width: 100,
                          child: Center(
                              child: Text(
                                'authisticbirb',
                                overflow: TextOverflow.ellipsis,
                              ))),
                    ),
                  ],
                ),
              ),

              //instagrammer2
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 8.0),
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 39,
                      backgroundImage: AssetImage('images/storybackground.jpg'),
                      child: CircleAvatar(
                        radius: 37,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 35,
                          backgroundImage:
                          AssetImage('images/2.png'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Container(
                          width: 100,
                          child: Center(
                              child: Text(
                                'markowreiz',
                                overflow: TextOverflow.ellipsis,
                              ))),
                    ),
                  ],
                ),
              ),

              //instagrammer3
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 8.0),
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 39,
                      backgroundImage: AssetImage('images/storybackground.jpg'),
                      child: CircleAvatar(
                        radius: 37,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 35,
                          backgroundImage:
                          AssetImage('images/3.png'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Container(
                          width: 100,
                          child: Center(
                              child: Text(
                                'hadjiduck',
                                overflow: TextOverflow.ellipsis,
                              ))),
                    ),
                  ],
                ),
              ),

              //instagrammer4
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 8.0),
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 39,
                      backgroundImage: AssetImage('images/storybackground.jpg'),
                      child: CircleAvatar(
                        radius: 37,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 35,
                          backgroundImage:
                          AssetImage('images/4.png'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Container(
                          width: 100,
                          child: Center(
                              child: Text(
                                'xhams',
                                overflow: TextOverflow.ellipsis,
                              ))),
                    ),
                  ],
                ),
              ),

              //instagrammer5
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 8.0),
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage('images/5.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Container(
                        width: 100,
                        child: Center(
                          child: Text(
                            'dumbmafiaguy',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //instagrammer6
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 8.0),
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage('images/6.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Container(
                        width: 100,
                        child: Center(
                          child: Text(
                            'cattie',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 8.0),
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 39,
                      backgroundImage: AssetImage('images/storybackground.jpg'),
                      child: CircleAvatar(
                        radius: 37,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 35,
                          backgroundImage:
                          AssetImage('images/1.png'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Container(
                          width: 100,
                          child: Center(
                              child: Text(
                                'authisticbirb',
                                overflow: TextOverflow.ellipsis,
                              ))),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(),
        Column(
          children: <Widget>[
            Post(true,
                1,
                "authisticbirb",
                "Washinghton DC, Turkey",
                "66",
                "An apple a day will keep anyone away if you throw it hard enough.",
                '22',
                '@berkebot',
                'Sending this selfie to NASA, because you re a star.',
                "2"
            ),
            Post(
              false,
              6,
              'mamarosiebella',
              'Seattle, Washington, Turkey',
              '340',
              'Huge birthday give away! \nBella is 5 today and we like to thank you for your support in the past 5 years',
              '288',
              '@katelinhuge',
              'Thank you! She is really happy',
              '4',
            ),
            Post(
                true,
                2,
                'travelwitheufrozina',
                'Cappadocia, Turkey',
                '1123',
                "Landscapes of Cappadocia are on of Turkey's most popular natural wonders. ⛰🎈🇹🇷",
                '344',
                '@turkeyylola',
                "Lonely Planet says that “even compared to many other popular traveller destinations across the world, Cappadocia remains an incredibly safe place”, including for solo female travellers 👩",
                '2'),
            Post(
                true,
                3,
                'stefanihalman',
                'Bergen, Turkey',
                '78',
                'My study tips for Fall 2020🌟: \n1. Organize your time: Make a timetable for yourself!',
                '13',
                '@kimhartkol',
                'Exactly!!!',
                '3'),
            Post(
              true,
              4,
              'markovv',
              'New York, New York, Turkey',
              '146',
              "We bought our first official home! It's in a very calm neighborhood. There's a lot of window which I absolutley adore! Hope I will manage to furnish my studio soon...",
              '77',
              '@roomdecorvanessa',
              'Love it! So nice to have somebody to share with.',
              '3',
            ),
            Post(
              false,
              5,
              'totaltandomperson',
              'Malmo, Turkey',
              '25',
              'Best way to start a day: coffee + photography',
              '3',
              '@photography_lizziemaid',
              "wow, it's so cool!",
              '4',
            ),
            Post(
              false,
              7,
              'barrraaaa',
              'Shanghai, Turkey',
              '25',
              'Matteeo valll',
              '3',
              '@photography_lizziemaid',
              "wow, just WOW!",
              '4',
            ),
          ],
        ),
      ],
    ),
  );
}



Widget Post(
    hasStory,
    numOfUser,
    name,
    location,
    numOfLikes,
    postText,
    numOfComments,
    commentTag,
    commentText,
    days,
    ){
  return Column(
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              hasStory
                  ? smallProfileWithStory(numOfUser)
                  : smallProfileWithoutStory(numOfUser),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: TextStyle(
                      fontFamily: Platform.isAndroid ? "Roboto" : "Neue Helvetica",
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    location,
                    style: TextStyle(
                      fontFamily: Platform.isAndroid ? "Roboto" : "Neue Helvetica",
                    ),
                  ),
                ],
              ),
            ],
          ),
          Image.asset(
            "images/more.png",
            width: 40,
          ),
        ],
      ),
      Image.asset(
        "images/"+numOfUser.toString()+".png",
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0,
                      top: 8.0,
                      right: 4.0,
                  ),
                  child: Image.asset(
                    'images/heart.png',
                    width: 40,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    top: 8.0,
                    right: 4.0,
                  ),
                  child: Image.asset(
                    'images/comment.png',
                    width: 40,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    top: 8.0,
                    right: 4.0,
                  ),
                  child: Image.asset(
                    'images/message.png',
                    width: 40,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              top: 8.0,
              right: 4.0,
            ),
            child: Image.asset(
              'images/save.png',
              width: 40.0,
            ),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(
          top: 8.0,
          left: 10.0,
        ),
        child: Container(
          alignment: Alignment.centerLeft,
          child: Text( "$numOfLikes  likes",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8.0,
            right: 8.0,
            top: 8.0),
        child: Container(
          width: window.physicalSize.width,
          child: RichText(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
                text: name + ' ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: postText,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                      ))
                ]),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(
          top: 8.0,
          left: 8.0,
        ),
        child: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            'View all' + numOfComments + ' comments',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(
            left: 8.0,
            right: 8.0,
            top: 8.0,
        ),
        child: Container(
          width: window.physicalSize.width,
          child: RichText(
            text: TextSpan(
              text: name + ' ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 16,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: commentTag + ' ',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Colors.indigo,
                  ),
                ),
                TextSpan(
                  text: commentText,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                left: 8.0,
              ),
            child: Container(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage(
                      "images/6.png"
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                        left: 16.0,
                      ),
                    child: Text(" Add a comment...",style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      right: 8.0,
                  ),
                  child: Text('💁',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 8.0,
                  ),
                  child: Text('😍',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      right: 8.0
                  ),
                  child: Icon(
                    Icons.add_circle_outline,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              days + ' days ago',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
      ),
    ],
  );
}



Widget smallProfileWithStory(numOfUser){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: CircleAvatar(
      radius: 24,
      backgroundImage: AssetImage(
        "images/storybackground.jpg",
      ),
      child: CircleAvatar(
        radius: 22,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(
            "images/$numOfUser.png",
          ),
        ),
      ),
    ),
  );
}



Widget smallProfileWithoutStory(numOfUser){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: CircleAvatar(
      radius: 20,
      backgroundImage: AssetImage(
        "images/$numOfUser.png",
      ),
    ),
  );
}