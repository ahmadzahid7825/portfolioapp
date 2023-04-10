import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:open_whatsapp/open_whatsapp.dart';
import 'package:search_map_place_updated/search_map_place_updated.dart';
import 'package:url_launcher/url_launcher.dart';

String phone = '+441792137813';

void launchCall() async {
  String url = "tel:$phone";
  if (await launchUrl(
    Uri.parse(url),
  )) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}

_setMarker() {
  return const Marker(
    markerId: MarkerId('marker_1'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(37.42796133580664, -122.085749655962),
  );
}

class MapsScreen extends StatefulWidget {
  MapsScreen({
    super.key,
    required this.textValue1,
    required this.textValue2,
    required this.selectedCheckboxes,
  });
  final String textValue1;
  final String textValue2;
  final List<String> selectedCheckboxes;

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  LatLng? _latLng;

  static CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  late GoogleMapController mapController;
  LocationData? currentLocation;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  void _getLocation() async {
    Location location = Location();

    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    PermissionStatus permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        return;
      }
    }

    currentLocation = await location.getLocation();
    if (mapController != null && currentLocation != null) {
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              currentLocation!.latitude!,
              currentLocation!.longitude!,
            ),
            zoom: 15,
          ),
        ),
      );
      latitude = currentLocation!.latitude;
      longitude = currentLocation!.longitude;
    }
    uris =
        "https://www.google.com/maps/search/?api=1&query=${latitude},${longitude}";
  }

  double? latitude;
  double? longitude;

  String? uris;

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              markers: <Marker>{_setMarker()},
              onMapCreated: (GoogleMapController googleMapController) {
                setState(() {
                  mapController = googleMapController;
                });
                _getLocation();
              },
              initialCameraPosition: CameraPosition(
                target: currentLocation != null
                    ? LatLng(
                        currentLocation!.latitude!, currentLocation!.longitude!)
                    : const LatLng(3.583598, 22.424761),
                zoom: 15,
              ),
              mapType: MapType.normal,
            ),
            Positioned(
              top: 10,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  size: 30,
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
            Positioned(
              top: 30,
              left: 0,
              right: 0,
              child: Container(
                margin: const EdgeInsets.only(
                  top: 30,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    border: Border.all(color: Colors.black87, width: 1),
                  ),
                  child: SearchMapPlaceWidget(
                    hasClearButton: true,
                    bgColor: Colors.white,
                    placeType: PlaceType.address,
                    placeholder: 'Zurich, Switzerland',
                    iconColor: Colors.white,
                    textColor: Colors.black87,
                    apiKey: 'AIzaSyCwEZ2KJzmalXBgYwRdiihLgKbtbU--FwM',
                    onSelected: (Place place) async {
                      Geolocation? geolocation = await place.geolocation;
                      mapController.animateCamera(
                        CameraUpdate.newLatLng(geolocation?.coordinates!),
                      );
                      mapController.animateCamera(
                        CameraUpdate.newLatLngBounds(geolocation?.bounds!, 0),
                      );
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              width: MediaQuery.of(context).size.width,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14)),
                child: Center(
                  child: Column(
                    children: [
                      const Text(
                        textAlign: TextAlign.center,
                        'JE SUIS EN PANNE CONTACTER MON \n ASSISTANT DÉPANNAGE VIA',
                        style: TextStyle(
                            wordSpacing: 2,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            letterSpacing: .6,
                            height: 1.5),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                const String phoneNumber = '41792137813';
                                String msgDetails =
                                    "J'ai besoin d'assistance \nNom : ${widget.textValue1} \nTéléphone : ${widget.textValue2} \nAssurance : ${widget.selectedCheckboxes}";
                                String message =
                                    '$msgDetails \n https://www.google.com/maps/search/?api=1&query=${latitude},${longitude}';
                                final Uri url = Uri.parse(
                                    'whatsapp://send?phone=$phoneNumber&text=${Uri.encodeComponent(message)}');

                                if (currentLocation != null) {
                                  if (!await launchUrl(url)) {
                                    throw Exception('Could not launch $url');
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 6),
                                textStyle: const TextStyle(fontSize: 17),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                elevation: 5,
                              ),
                              child: const Text(
                                'MA POSITION',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                launchCall();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 9),
                                textStyle: const TextStyle(fontSize: 17),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                elevation: 5,
                              ),
                              child: const Text(
                                'APPELLER',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
