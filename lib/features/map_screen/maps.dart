// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:clean_wash/core/widgets/stepper_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

import 'package:clean_wash/core/colors_manger.dart';
import 'package:clean_wash/core/widgets/NextButton.dart';
import 'package:clean_wash/core/widgets/screen_title_widget.dart';
import 'package:clean_wash/features/Payment/payment_view.dart';

class MapWidget extends StatefulWidget {
  int activeSteep;
  MapWidget({
    Key? key,
    required this.activeSteep,
  }) : super(key: key);

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
  // ignore: non_constant_identifier_names

  int activeStep = 0; // Default value

  @override
  void initState() {
    super.initState();
    activeStep = widget.activeSteep; // Initialize with the passed activeSteep
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
                MyStteper(
                  activeStep: 1,
                ),
                /* SelectionWidget('Select your Location ',
                    'Select where you want to wash your car'), */
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
                NextButton('Next', const PaymentView(), () {}, 250)
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        focusColor: Colors.red,
        backgroundColor: ColorsManger.grey,
        splashColor: Colors.orange,
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
                color: Colors.orange,
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

    // Save the route and markers on the map
    getRoutes(point);

    // Save the selected location to Firestore
    await _saveLocationToFirestore(point);
  }

  Future<void> _saveLocationToFirestore(LatLng point) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        DocumentReference userRef = FirebaseFirestore.instance
            .collection('Users')
            .doc(user.email); // Use user's email as document ID

        await userRef.set({
          'selectedLocation': {
            'latitude': point.latitude,
            'longitude': point.longitude,
          },
        }, SetOptions(merge: true));

        Get.snackbar('Success', 'Location saved successfully!');
      } else {
        Get.snackbar('Error', 'User not logged in');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to save location: $e');
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
