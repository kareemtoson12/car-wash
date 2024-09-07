import 'dart:convert';

import 'package:clean_wash/core/widgets/NextButton.dart';
import 'package:clean_wash/core/widgets/screen_title_widget.dart';
import 'package:clean_wash/core/widgets/selection_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:latlong2/latlong.dart';

import 'package:location/location.dart';

import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapWidget> {
  final MapController _mapController = MapController();
  LocationData? currentLocation;
  List<LatLng> routePoints = [];
  var selectedLocation;
  List<Marker> markers = [];
  final String orsApiKey =
      '5b3ce3597851110001cf62488a1e605337094ad9882a77191535e421';
  @override
  void initState() {
    super.initState();
    getCureentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ScreenTitleWidget('Pick location'),
                const Divider(),
                SelectionWidget('Select your Location ',
                    'Select where you wantto wash  your car'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 400.h,
                    child: currentLocation == null
                        ? const Center(child: CircularProgressIndicator())
                        : FlutterMap(
                            mapController: _mapController,
                            options: MapOptions(
                              initialCenter: LatLng(currentLocation!.latitude!,
                                  currentLocation!.longitude!),
                              initialZoom: 15.0,
                              onTap: (tapPosition, point) =>
                                  _addDestinationMarker(point),
                            ),
                            children: [
                              TileLayer(
                                urlTemplate:
                                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                                subdomains: const ['a', 'b', 'c'],
                              ),
                              MarkerLayer(
                                markers: markers,
                              ),
                              PolylineLayer(
                                polylines: [
                                  Polyline(
                                    points: routePoints,
                                    strokeWidth: 4.0,
                                    color: Colors.blue,
                                  ),
                                ],
                              ),
                            ],
                          ),
                  ),
                ),
                NextButton(null),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (currentLocation != null) {
            _mapController.move(
              LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
              15.0,
            );
          }
        },
        child: const Icon(Icons.my_location),
      ),
    );
  }

  Future<void> getCureentLocation() async {
    var location = Location();
    try {
      var userLocation = await location.getLocation();
      setState(() {
        currentLocation = userLocation;
        markers.add(
          Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(
                userLocation.latitude!,
                userLocation.longitude!,
              ),
              child: const Icon(
                Icons.my_location,
                color: Colors.blue,
                size: 40,
              )),
        );
      });
    } on Exception {
      currentLocation = null;
    }
    location.onLocationChanged.listen((LocationData locationData) {
      setState(() {
        currentLocation = locationData;
      });
    });
  }

  Future<void> getRoutes(LatLng destination) async {
    if (currentLocation == null) return;
    final start =
        LatLng(currentLocation!.latitude!, currentLocation!.longitude!);
    final response = await http.get(
      Uri.parse(
          'https://api.openrouteservice.org/v2/directions/driving-car?api_key=$orsApiKey&start=${start.longitude},${start.latitude}&end=${destination.longitude},${destination.latitude}'),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> coords =
          data['features'][0]['geometry']['coordinates'];
      setState(() {
        routePoints =
            coords.map((coord) => LatLng(coord[1], coord[0])).toList();
        markers.add(
          Marker(
            width: 80.0,
            height: 80.0,
            point: destination,
            child: const Icon(Icons.location_on, color: Colors.red, size: 40.0),
          ),
        );
      });
    } else {
      // Handle errors
      print('Failed to fetch route');
    }
  }

  void _addDestinationMarker(LatLng point) async {
    setState(() {
      markers.add(
        Marker(
          width: 80.0,
          height: 80.0,
          point: point,
          child: const Icon(Icons.location_on, color: Colors.red, size: 40.0),
        ),
      );
      selectedLocation = point; // Save the selected location
    });
    getRoutes(point);

    // Save to SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('selected_latitude', point.latitude);
    prefs.setDouble('selected_longitude', point.longitude);
  }

  @override
  void dispose() {
    getCureentLocation();
    super.dispose();
  }
}

/*Future<void> _getSavedLocation() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  double? latitude = prefs.getDouble('selected_latitude');
  double? longitude = prefs.getDouble('selected_longitude');

  if (latitude != null && longitude != null) {
    setState(() {
      selectedLocation = LatLng(latitude, longitude);
      // Optionally add a marker for the saved location
      markers.add(
        Marker(
          width: 80.0,
          height: 80.0,
          point: selectedLocation!,
          child: const Icon(Icons.location_on, color: Colors.red, size: 40.0),
        ),
      );
    });
  }
}
*/