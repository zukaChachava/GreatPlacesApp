import 'package:flutter/material.dart';
import 'package:great_places_app/providers/great_places_provider.dart';
import 'package:great_places_app/screens/add_pace_screen.dart';
import 'package:great_places_app/screens/places_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GreatPlacesProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const PlacesListScreen(),
        routes: {
          AddPlaceScreen.route: (_) => const AddPlaceScreen(),
        },
      ),
    );
  }
}
