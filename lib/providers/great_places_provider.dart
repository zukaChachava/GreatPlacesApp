import 'package:flutter/widgets.dart';
import 'package:great_places_app/models/place.dart';

class GreatPlacesProvider with ChangeNotifier {
  List<PlaceModel> _places = [];

  List<PlaceModel> get places {
    return [..._places];
  }
}
