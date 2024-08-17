import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapWidget extends StatefulWidget {
  final Position currentPosition;
  const MapWidget({
    super.key,
    required this.currentPosition,
  });

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  YandexMapController? _mapController;
  CameraPosition? _userLocation;
  var _mapZoom = 7.0;

  @override
  void initState() {
    super.initState();
    _initUserLocation();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 160,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: YandexMap(
          tiltGesturesEnabled: false,
          zoomGesturesEnabled: false,
          rotateGesturesEnabled: false,
          scrollGesturesEnabled: false,
          onMapCreated: (controller) async {
            _mapController = controller;
            if (_userLocation != null) {
              await _mapController!.moveCamera(
                CameraUpdate.newCameraPosition(
                  _userLocation!,
                ),
              );
            }
          },
          onMapTap: (point) {
            context.push(
              '/product/cart/payment/fullMap',
              extra: Point(
                latitude: widget.currentPosition.latitude,
                longitude: widget.currentPosition.longitude,
              ),
            );
          },
          onCameraPositionChanged: (cameraPosition, _, __) {
            setState(() {
              _mapZoom = cameraPosition.zoom;
            });
          },
        ),
      ),
    );
  }

  Future<void> _moveCameraToUserLocation() async {
    if (_mapController != null && _userLocation != null) {
      await _mapController!.moveCamera(
        CameraUpdate.newCameraPosition(
          _userLocation!.copyWith(zoom: 20.0),
        ),
        animation: const MapAnimation(
          type: MapAnimationType.linear,
          duration: 0.3,
        ),
      );
    }
  }

  void _initUserLocation() {
    _userLocation = CameraPosition(
      target: Point(
        latitude: widget.currentPosition.latitude,
        longitude: widget.currentPosition.longitude,
      ),
      zoom: _mapZoom,
    );
  }
}
