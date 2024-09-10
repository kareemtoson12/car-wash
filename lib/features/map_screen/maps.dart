import 'dart:convert';

import 'package:clean_wash/core/colors_manger.dart';
import 'package:clean_wash/core/widgets/NextButton.dart';
import 'package:clean_wash/core/widgets/screen_title_widget.dart';
import 'package:clean_wash/features/Payment/payment_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
  int activeStep = 0;
  var selectedLocation;
  List<Marker> markers = [];
  final String orsApiKey =
      '5b3ce3597851110001cf62488a1e605337094ad9882a77191535e421';
  // ignore: non_constant_identifier_names

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
                MyStepper(),
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
                NextButton('Next', PaymentView(), () {}, 250)
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

    // Save to SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('selected_latitude', point.latitude);
    prefs.setDouble('selected_longitude', point.longitude);

    // Save the selected location to Firestore
    await _saveLocationToFirestore(point);
  }

  Future<void> _saveLocationToFirestore(LatLng point) async {
    try {
      // Get the current user
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Create a reference to the user's document in Firestore
        DocumentReference userRef = FirebaseFirestore.instance
            .collection('Users')
            .doc(user.email); // Use user's email as document ID

        // Save the selected location (latitude and longitude) in Firestore
        await userRef.set({
          'selectedLocation': {
            'latitude': point.latitude,
            'longitude': point.longitude,
          },
        }, SetOptions(merge: true)); // Merge with existing data

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

  Widget MyStepper() {
    return EasyStepper(
      activeStep: activeStep,
      activeStepTextColor: Colors.black87,
      finishedStepTextColor: Colors.black87,
      internalPadding: 0,
      showLoadingAnimation: false,
      stepRadius: 10,
      showStepBorder: false,
      steps: [
        EasyStep(
          customStep: CircleAvatar(
            radius: 8,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 7,
              backgroundColor: activeStep >= 0 ? Colors.orange : Colors.white,
            ),
          ),
          title: 'Date and time',
        ),
        EasyStep(
          customStep: CircleAvatar(
            radius: 8,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 7,
              backgroundColor: activeStep >= 1 ? Colors.orange : Colors.white,
            ),
          ),
          title: 'Location',
          topTitle: true,
        ),
        EasyStep(
          customStep: CircleAvatar(
            radius: 8,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 7,
              backgroundColor: activeStep >= 2 ? Colors.orange : Colors.white,
            ),
          ),
          title: 'Payments',
        ),
      ],
      onStepReached: (index) {
        setState(() {
          activeStep = index; // Updates the activeStep correctly
        });
      },
    );
  }
}
