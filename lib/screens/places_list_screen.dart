import 'package:flutter/material.dart';
import 'package:great_places_app/providers/great_places_provider.dart';
import 'package:great_places_app/screens/add_pace_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.route);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: Consumer<GreatPlacesProvider>(
          child: const Text('Got no places yet, start adding some!'),
          builder: (ctx, greatPlaces, child) => greatPlaces.places.isEmpty
              ? child!
              : ListView.builder(
                  itemCount: greatPlaces.places.length,
                  itemBuilder: (ctx, i) => ListTile(
                    leading: CircleAvatar(
                      backgroundImage: FileImage(greatPlaces.places[i].image),
                    ),
                    title: Text(greatPlaces.places[i].title),
                    onTap: () {},
                  ),
                ),
        ),
      ),
    );
  }
}
