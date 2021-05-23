import 'package:flutter/material.dart';
import 'package:flutter_tank_rehberi/tank_liste.dart';
import 'package:flutter_tank_rehberi/testlib.dart';

import 'tank_detay.dart';

void main() => runApp(MyApp());




class MyApps extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Tank Kafasi Rehberi",
      debugShowCheckedModeBanner: false,

      initialRoute: "/tankListesi",
      routes: {
        "/" : (context) => TankListesi(),
        "/tankListesi" : (context) => TankListesi(),
      },

      onGenerateRoute: (RouteSettings settings){
        List<String> pathElemanlari = settings.name.split("/");
        if(pathElemanlari[1] == "TankDetay"){
          return MaterialPageRoute(builder: (context) => TankDetay(int.parse(pathElemanlari[2])));
        }
        return null;
      },

      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
          ),
    );
  }

  
}




