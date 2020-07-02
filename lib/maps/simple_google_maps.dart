import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SimpleGoogleMaps extends StatefulWidget {
  @override
  _SimpleGoogleMapsState createState() => _SimpleGoogleMapsState();
}

class _SimpleGoogleMapsState extends State<SimpleGoogleMaps> {
  GoogleMapController mapController;
  static LatLng _center= const LatLng(19.214113, 72.981732); // Latlng => object // const => so that value doesn't change
  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Maps",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: GoogleMap(
        markers: { thane_marker },
        mapType: MapType.hybrid,
        onMapCreated: onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: goToRait, label: Text("RAIT")),
    );
  }

  static final CameraPosition rait_position = CameraPosition(
    target: LatLng(19.044312, 73.025517),
    bearing: 191.8,  // bearing => causes rotaion animation
    tilt: 34.89, // tilt => terrain tilt
    zoom: 17.0,
  );

  Future<void> goToRait() async {
    GoogleMapController controller = await mapController;
    controller.animateCamera(CameraUpdate.newCameraPosition(rait_position));
  }

  Marker thane_marker = Marker(
    markerId: MarkerId("Thane"),
    position: _center,
    infoWindow: InfoWindow(
      title: "Thane",
      snippet: "Lel",
    ),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
  );
}
