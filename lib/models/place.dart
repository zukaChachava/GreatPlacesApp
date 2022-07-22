import 'dart:io';

import 'package:great_places_app/models/place_location.dart';

class PlaceModel {
  final String id;
  final String title;
  final PlaceLocationModel location;
  final File image;

  PlaceModel(
      {required this.id,
      required this.title,
      required this.image,
      required this.location});
}
