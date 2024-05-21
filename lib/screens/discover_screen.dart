import 'package:debrain_tmdb/controllers/movies_controller.dart';
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
        
      ),
    );
  }
}
