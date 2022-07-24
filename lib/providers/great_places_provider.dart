import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:great_places_app/helpers/db_helper.dart';
import 'package:great_places_app/models/place.dart';
import 'package:great_places_app/models/place_location.dart';

class GreatPlacesProvider with ChangeNotifier {
  List<PlaceModel> _places = [];

  List<PlaceModel> get places {
    return [..._places];
  }

  void addPlace(String title, File image) {
    final newPlace = PlaceModel(
        id: DateTime.now().toString(),
        image: image,
        title: title,
        location: PlaceLocationModel(latitude: 1, longitude: 2));

    _places.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final data = await DBHelper.getData('user_places');
    _places = data
        .map((place) => PlaceModel(
            id: place['id'],
            title: place['title'],
            image: File(place['image']),
            location: PlaceLocationModel(
              latitude: 1,
              longitude: 2,
            )))
        .toList();
    notifyListeners();
  }
}
