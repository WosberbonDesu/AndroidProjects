import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';

void main() => runApp(WeatherApp());

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  int temperature;
  var minTemperatureForecast =  List(7);
  var maxTempatureForecast =  List(7);
  String location = 'San Francisco';
  int woeid = 2487956;
  String weather = 'clear';
  String abbreviation = '';
  var abbreviationForecast = new List(7);
  String errorMessage = '';

  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  Position _currentPosition;
  String _currentAddress;

  String searchApiUrl =
      'https://www.metaweather.com/api/location/search/?query=';
  String locationApiUrl = 'https://www.metaweather.com/api/location/';

  initState() {
    super.initState();
    fetchLocation();
    fetchLocationDay();
  }

  void fetchSearch(String input) async {
    try {
      var src = Uri.parse(searchApiUrl+input);
      var searchResult = await http.get(src);
      var result = json.decode(searchResult.body)[0];

      setState(() {
        location = result["title"];
        woeid = result["woeid"];
        errorMessage = '';
      });
    } catch (error) {
      setState(() {
        errorMessage =
        "Sorry, we don't have data about this city. Try another ono or check your wifi.";
      });
    }
  }

  void fetchLocation() async {
    var stc = Uri.parse(locationApiUrl+woeid.toString());
    var locationResult = await http.get(stc);
    var result = json.decode(locationResult.body);
    var consolidated_weather = result["consolidated_weather"];
    var data = consolidated_weather[0];

    setState(() {
      temperature = data["the_temp"].round();
      weather = data["weather_state_name"].replaceAll(' ', '').toLowerCase();
      abbreviation = data["weather_state_abbr"];
    });
  }


  void fetchLocationDay() async{
    var today = new DateTime.now();
    for(var i = 0;  i<7 ;i++){
      var stc = Uri.parse(locationApiUrl+woeid.toString()+'/' +
          new DateFormat('y/M/d')
              .format(today.add(new Duration(days: i + 1)))
              .toString());
      var locationDayResult = await http.get(stc);
      var result = json.decode(locationDayResult.body);
      var data = result[0];

      setState(() {
        minTemperatureForecast[i] = data["min_temp"].round();
        maxTempatureForecast[i] = data["max_temp"].round();
        abbreviationForecast = data["weather_state_abbr"];
      });
    }
  }


  void onTextFieldSubmitted(String input) async {
    await fetchSearch(input);
    await fetchLocation();
    await fetchLocationDay();
  }

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
        "${place.locality}, ${place.postalCode}, ${place.country}";
      });
      onTextFieldSubmitted(place.locality);
      print(place.locality);
    } catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/$weather.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: temperature == null
              ? Center(child: CircularProgressIndicator())
              : Scaffold(
            appBar: AppBar(
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: (){
                      _getCurrentLocation();
                    },
                    child: Icon(Icons.location_city_outlined,size: 36.0,color: Colors.black,),
                  ),
                ),
              ],
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            //resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Center(
                      child: Image.network(
                        'https://www.metaweather.com/static/img/weather/png/' +
                            abbreviation +
                            '.png',
                        width: 100,
                      ),
                    ),
                    Center(
                      child: Text(
                        temperature.toString() + ' °C',
                        style: TextStyle(
                            color: Colors.white, fontSize: 60.0),
                      ),
                    ),
                    Center(
                      child: Text(
                        location,
                        style: TextStyle(
                            color: Colors.white, fontSize: 40.0),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    forecastElement(1,abbreviationForecast[0]),
                    forecastElement(2,abbreviationForecast[1]),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: 300,
                      child: TextField(
                        onSubmitted: (String input) {
                          onTextFieldSubmitted(input);
                        },
                        style:
                        TextStyle(color: Colors.white, fontSize: 25),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black,width: 10.0),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          //borderSide: new BorderSide(color: Colors.black54),
//borderRadius: BorderRadius.circular(20.0),
                          hintText: 'Search another location...',
                          hintStyle: TextStyle(
                              color: Colors.white, fontSize: 18.0),
                          prefixIcon:
                          Icon(Icons.search, color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(right: 32.0, left: 32.0),
                      child: Text(errorMessage,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.redAccent,
                              fontSize:
                              Platform.isAndroid ? 15.0 : 20.0)),
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}



Widget forecastElement(daysFromNow,abbreviation){

  var now = new DateTime.now();
  var oneDayFromNow = now.add(new Duration(days: daysFromNow));

  return Container(
    decoration: BoxDecoration(
      color: Color.fromRGBO(205, 212, 228, 0.2),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      children: [
        Text(
          new DateFormat.E().format(oneDayFromNow),
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
          ),
        ),
        Text(
          new DateFormat.MMMd().format(oneDayFromNow),
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
        Image.network('https://www.metaweather.com/static/img/weather/png/' +
            abbreviation +
            '.png',
          width: 50,),
      ],
    ),
  );
}


//child: Scaffold(
//backgroundColor: Colors.transparent,
//body: Column(
//mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//crossAxisAlignment: CrossAxisAlignment.center,
//children: <Widget>[
//Column(
//children: [
//Center(
//child: Image.network(
//'https://www.metaweather.com/static/img/weather/png/' +
//abbreviation +
//"png",
//width: 100,
//),
//),
//Center(
//child: RichText(
//text: TextSpan(
//children: [

//WidgetSpan(
//child: Icon(Icons.thermostat_outlined,color: Colors.red.shade900, size: 60.0),
//),
//TextSpan(
//text: tempature.toString()
//,
//),
//TextSpan(
//text: '°C',
//),
//],
//style: TextStyle(fontSize: 60.0),
//),
//),
//),
//Center(
//child: RichText(
//text: TextSpan(
//children: [
//WidgetSpan(
//child: Icon(Icons.location_on_outlined,color: Colors.grey.shade900, size: 60.0),
//),
//TextSpan(
//text: location.toString(),
//),
//],
//style: TextStyle(fontSize: 40.0),
//),
//),
//),
//],
//),

//Column(
//children: <Widget>[
//Container(
//width: 300,
//child: TextField(
//onSubmitted: (String input){
//onTextFieldSubmitted(input);
//},
//style: TextStyle(
//color: Colors.white,
//fontSize: 25.0,
//),
//decoration: InputDecoration(
//focusedBorder:OutlineInputBorder(
//borderSide: const BorderSide(color: Colors.black, width: 10.0),
//borderRadius: BorderRadius.circular(25.0),
//),
//border: new OutlineInputBorder(
//borderSide: new BorderSide(color: Colors.black54),
//borderRadius: BorderRadius.circular(20.0),
//),
//hintText: "Search for another location",
//hintStyle: TextStyle(
//color: Colors.white,
//fontSize: 18.0,
//),
//prefixIcon: Icon(Icons.search,color: Colors.white,),
//),
//),
//),
//],
//),
//],
//),
//),
