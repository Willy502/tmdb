import 'package:debrain_tmdb/controllers/movies_controller.dart';
import 'package:debrain_tmdb/widgets/movies_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MoviesController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.favorite), onPressed: () {
            //showSearch(context: context, delegate: DataSearch());
          })
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none
              ),
              filled: true,
              hintText: 'Search Movie...',
              fillColor: Colors.white,
              suffixIcon: const Icon(Icons.search)
            ),
          ),
          Expanded(child: GetBuilder<MoviesController>(builder: (_) => MoviesWidget(movies: _.movies)))
        ],
      ),
      )
    );
  }
}
