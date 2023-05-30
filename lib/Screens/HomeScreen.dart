import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sicpa_test/Screens/ArticlesScreen.dart';
import 'package:sicpa_test/Screens/SearchScreen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
 String lat= "";
  String long= "";


  @override
  void initState() {
    super.initState();
    getLocation();


  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20,),
            Container(
              margin: const EdgeInsets.only(left: 5),
              child: const Text(
                'Search',
                style: TextStyle(
                  fontSize: 16
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => SearchScreen()));
              },
              child: Container(
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey)
                ),
                child: Row(
                  children: [
                    Expanded(child: Text('Search Articles')),
                    Icon(Icons.arrow_forward_ios, size: 15,),
                  ],
                 )
              ),
            ),
            SizedBox(height: 20,),
            Container(
              margin: const EdgeInsets.only(left: 5),
              child: const Text(
                'Popular',
                style: TextStyle(
                    fontSize: 16
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => ArticleScreen(word: "viewed", type: "a", title : 'Most Viewed')));
              },
              child: Container(
                  margin: const EdgeInsets.all(5.0),
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey)
                  ),
                  child: Row(
                    children: [
                      Expanded(child: Text('Most Viewed')),
                      Icon(Icons.arrow_forward_ios, size: 15,),
                    ],
                  )
              ),
            ),

            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => ArticleScreen(word: "shared", type: "a", title : 'Most Shared')));
              },
              child: Container(
                  margin: const EdgeInsets.all(5.0),
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey)
                  ),
                  child: Row(
                    children: [
                      Expanded(child: Text('Most Shared')),
                      Icon(Icons.arrow_forward_ios, size: 15,),
                    ],
                  )
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => ArticleScreen(word: "emailed", type: "a" , title : 'Most Emailed')));
              },
              child: Container(
                  margin: const EdgeInsets.all(5.0),
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey)
                  ),
                  child: Row(
                    children: [
                      Expanded(child: Text('Most Emailed')),
                      Icon(Icons.arrow_forward_ios, size: 15,),
                    ],
                  )
              ),
            ),





            SizedBox(height: 20,),
            Container(
              margin: const EdgeInsets.only(left: 5),
              child: const Text(
                'Location Coordinates',
                style: TextStyle(
                    fontSize: 16
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 5),
              child:  Text(
                'Longitude : '+long.toString(),
                style: TextStyle(
                    fontSize: 16
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 5),
              child:  Text(
                'Latitude : '+lat.toString(),
                style: TextStyle(
                    fontSize: 16
                ),
              ),
            ),
          ],
        ),
      ),
   // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  void getLocation() async {

    LocationPermission permission;
    permission = await _geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _geolocatorPlatform.requestPermission();
      if (permission == LocationPermission.whileInUse) {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low);
        setState(() {
          lat = position.latitude.toString();
          long = position.longitude.toString();
          print(lat);
          print("sadsadsad");
        });
      }

      else {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low);
        setState(() {
          lat = position.latitude.toString();
          long = position.longitude.toString();
          print(lat);
        });

      }
    }
    else {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      setState(() {
        lat = position.latitude.toString();
        long = position.longitude.toString();
        print(lat);
      });

    }

  }
}