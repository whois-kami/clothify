import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  return await Geolocator.getCurrentPosition();
}

Future<String> getAddressFromCoordinates(
    double latitude, double longitude) async {
  final apiKey = dotenv.env['API_YAGEOCODER_KEY']!;
  final url =
      'https://geocode-maps.yandex.ru/1.x/?geocode=$longitude,$latitude&format=json&apikey=$apiKey';

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final featureMember =
          jsonResponse['response']['GeoObjectCollection']['featureMember'];

      if (featureMember.isNotEmpty) {
        final addressDetails = featureMember[0]['GeoObject']['metaDataProperty']
            ['GeocoderMetaData']['AddressDetails'];

        final formattedAddress = addressDetails['Country']['AddressLine'];

        return '$formattedAddress';
      } else {
        return 'Адрес не найден';
      }
    } else {
      return 'Ошибка при запросе: ${response.statusCode}';
    }
  } catch (e) {
    return 'Ошибка: $e';
  }
}
