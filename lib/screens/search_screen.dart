import 'package:debrain_tmdb/controllers/movies_controller.dart';
import 'package:debrain_tmdb/widgets/movies_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String search = ModalRoute.of(context)!.settings.arguments as String;

    var controller = Get.find<MoviesController>();
    controller.getSearchedMovie(search);

    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Get.back();
            },
          ),
          title: Text('Results for: $search'),
          titleTextStyle: GoogleFonts.notoSans(
              fontSize: 20, fontWeight: FontWeight.w900, color: Colors.black),
        ),
        body: Container(
            padding: const EdgeInsets.all(16.0),
            child: GetBuilder<MoviesController>(
                builder: (_) => MoviesWidget(movies: _.movies))));
  }
}
