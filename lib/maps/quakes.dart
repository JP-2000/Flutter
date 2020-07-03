import 'package:flutter/material.dart';
import 'package:flutter_projects/maps/network/quakes_network.dart';
import 'package:flutter_projects/weather_forecast/model/weather_forecast_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Quakes extends StatefulWidget {
  @override
  _QuakesState createState() => _QuakesState();
}

class _QuakesState extends State<Quakes> {
  Future data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = Network.getQuakes();
    data.then((value) {
      print("${value.type}");
    });
  }

  GoogleMapController mapController;
  static List<Marker> markers_list = [];
  static LatLng center = const LatLng(49.085630, -70.807232);
  void onMapCreated(GoogleMapController controller){
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Quakes")),
      ),
      body: GoogleMap(
        zoomControlsEnabled: false,
        markers: Set<Marker>.of(markers_list),
        onMapCreated: onMapCreated,
        initialCameraPosition: CameraPosition(target: center, zoom: 0.5),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
           onPressed();
        },
        label: Text("Quakes"),
        icon: Icon(FontAwesomeIcons.bacon),
      ),

    );
  }

  void onPressed() {
    setState(() {
      markers_list.clear();
      setState(() {
        data.then((value) => {
          value.features.forEach((i) => {
            markers_list.add(Marker(
              markerId: MarkerId("${i.id}"),
              infoWindow: InfoWindow(
                title: "${i.properties.mag}",
              ),
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
              position: LatLng(i.geometry.coordinates[1], i.geometry.coordinates[0]),
            ))
          })
        });
      });
    });
  }
}

