import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:permission_handler/permission_handler.dart';

class FullMapScreen extends StatefulWidget {
  final Point initialLocation;

  const FullMapScreen({super.key, required this.initialLocation});

  @override
  _FullMapScreenState createState() => _FullMapScreenState();
}

class _FullMapScreenState extends State<FullMapScreen> {
  YandexMapController? _mapController;

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
  }

  Future<void> _requestLocationPermission() async {
    await Permission.location.request();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          YandexMap(
            onMapCreated: (controller) async {
              _mapController = controller;
              await _moveCameraToInitialLocation();
            },
            onMapTap: (point) => _onMapTap(point),
            tiltGesturesEnabled: true,
            zoomGesturesEnabled: true,
            rotateGesturesEnabled: true,
            scrollGesturesEnabled: true,
            
          ),
          Positioned(
            bottom: 16,
            left: 16,
            child: FloatingActionButton(
              onPressed: _moveCameraToInitialLocation,
              child: const Icon(Icons.my_location),
              backgroundColor: Colors.blueAccent,
              tooltip: 'Move to Initial Location',
            ),
          ),
        ],
      ),
    );
  }

  void _onMapTap(Point point) {
    print('Map tapped at: ${point.latitude}, ${point.longitude}');
    _showCoordinatesDialog(point);
  }

  void _showCoordinatesDialog(Point point) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Coordinates'),
          content: Text(
              'Latitude: ${point.latitude}\nLongitude: ${point.longitude}'),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _moveCameraToInitialLocation() async {
    if (_mapController != null) {
      await _mapController!.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: widget.initialLocation, zoom: 14.0),
        ),
        animation: const MapAnimation(
          type: MapAnimationType.smooth,
          duration: 0.5,
        ),
      );
    }
  }
}
