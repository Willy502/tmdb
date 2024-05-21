import 'package:debrain_tmdb/providers/movies_provider.dart';
import 'package:debrain_tmdb/screens/discover_screen.dart';
import 'package:debrain_tmdb/themes/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {

  Get.lazyPut(() => MoviesProvider());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Movie DB",
      theme: MainTheme.tmdbTheme,
      initialRoute: 'discover_screen',
      routes: {'discover_screen': (context) => DiscoverScreen()},
    );
  }
}
