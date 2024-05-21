import 'package:debrain_tmdb/controllers/movies_controller.dart';
import 'package:debrain_tmdb/screens/search_screen.dart';
import 'package:debrain_tmdb/widgets/movies_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiscoverScreen extends StatelessWidget {
  DiscoverScreen({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var moviesController = Get.put(MoviesController());
    moviesController.getDiscoveredMovies();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Movies'),
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.favorite),
                onPressed: () {
                  //showSearch(context: context, delegate: DataSearch());
                })
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none),
                  filled: true,
                  hintText: 'Search Movie...',
                  fillColor: Colors.white,
                  suffixIcon: const Icon(Icons.search),
                ),
                onSubmitted: (value) {
                  _searchController.clear();
                  Get.to(
                    () => const SearchScreen(),
                    arguments: value,
                  )?.then((value) {
                    moviesController.getDiscoveredMovies();
                  });
                },
              ),
              Expanded(
                  child: GetBuilder<MoviesController>(
                      builder: (_) => MoviesWidget(movies: _.movies)))
            ],
          ),
        ));
  }
}
