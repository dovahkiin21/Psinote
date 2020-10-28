import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocation/geolocation.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter/services.dart';

class MapsPageRenter extends StatefulWidget {
  @override
  _MapsPageRenterState createState() => _MapsPageRenterState();
}

class _MapsPageRenterState extends State<MapsPageRenter> {
  LatLng current_location;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();
  }

  final GlobalKey _scaffoldKey = new GlobalKey();

  var points = <LatLng>[
    //somepoints for polyline
    new LatLng(25.43, 81.84),
    new LatLng(25.49, 81.85),
    // new LatLng(25.53,81.86),
    // new LatLng(25.59,81.87),
    // new LatLng(25.62,81.89),
  ];

  MapController controller = new MapController();

  getPermission() async {
    //ask permission for geolocation
    final GeolocationResult result =
        await Geolocation.requestLocationPermission(
            permission: const LocationPermission(
                android: LocationPermissionAndroid.fine,
                ios: LocationPermissionIOS.always));
    return result;
  }

  getLocation() {
    //get the location of the user

    // StreamSubscription<LocationResult> subscription = Geolocation.currentLocation(accuracy: LocationAccuracy.best).listen((result) {
    //   if(result.isSuccessful) {
    //     double latitude = result.location.latitude;
    //     // todo with result
    //   }
    // });

    return getPermission().then((result) async {
      if (result.isSuccessful) {
        LocationResult coords = await Geolocation.lastKnownLocation();
        return coords;
      }
    });
  }

  buildMap() {
    //build the map with the current location of the user
    getLocation().then((response) {
      if (response.isSuccessful) {
        // response.listen((value) {
        controller.move(
            new LatLng(response.location.latitude, response.location.longitude),
            15.0);
        current_location =
            new LatLng(response.location.latitude, response.location.longitude);
        // });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xFFFFC495),
      body: Builder(
        builder: (context) => Stack(children: <Widget>[
          FlutterMap(
            mapController: controller,
            options: new MapOptions(
              center: buildMap(),
              zoom: 13.0,
            ),
            layers: [
              new TileLayerOptions(
                  urlTemplate:
                      'https://api.mapbox.com/styles/v1/vibhanshuv/ckg9buo07066e19o9xjy4w9f3/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoidmliaGFuc2h1diIsImEiOiJja2c5MjltZ2IwajZnMndvMzhnZmNmcng1In0.1pJL10lwpPsJCuN4Yh6TDg',
                  additionalOptions: {
                    'accessToken':
                        "pk.eyJ1IjoidmliaGFuc2h1diIsImEiOiJja2c5MjltZ2IwajZnMndvMzhnZmNmcng1In0.1pJL10lwpPsJCuN4Yh6TDg",
                    'id': 'mapbox.mapbox-streets-v8'
                  }),
              new MarkerLayerOptions(markers: [
                new Marker(
                    width: 30.0,
                    height: 30.0,
                    point: current_location,
                    builder: (context) => new Container(
                          child: IconButton(
                            icon: Icon(
                              Icons.location_on,
                              color: Color(0xFFFFC495),
                            ),
                            color: Colors.red,
                            iconSize: 30,
                            onPressed: () {
                              print(current_location);
                            },
                          ),
                        )),
                // new Marker(
                //     width: 30.0,
                //     height: 30.0,
                //     point : new LatLng(25.49,81.85),
                //     builder: (context) => new Container(
                //       child: IconButton(
                //         icon: Icon(Icons.location_on , color: Color(0xFF1E1E29),),
                //         color: Colors.red,
                //         iconSize: 30,
                //         onPressed: () {
                //           print('Marker tapped');
                //         },
                //       ),
                //     )
                // ),
              ])
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Color(0xFFFFC495),
                      size: 40,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
