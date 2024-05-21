import 'package:debrain_tmdb/models/movie_model.dart';
import 'package:debrain_tmdb/screens/movie_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MoviesWidget extends StatelessWidget {
  final List<Movie> movies;

  const MoviesWidget({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisExtent: 300),
      itemBuilder: (context, index) => buildCard(context, movies[index]),
      itemCount: movies.length,
    );
  }

  Widget buildCard(BuildContext context, Movie movie) {
    movie.uniqueId = '${movie.id}-bottomCard';

    final movieCard = Container(
      margin: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
              tag: movie.uniqueId!,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: FadeInImage(
                  height: 170,
                  width: double.infinity,
                  placeholder: const AssetImage('assets/loading.gif'),
                  image: NetworkImage(movie
                      .getPosterImg()), //NetworkImage(movie.getPosterImg()),
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset('assets/loading.gif');
                  },
                  fit: BoxFit.cover,
                ),
              )),
          const SizedBox(height: 10.0),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(movie.title,
                style: GoogleFonts.lato(fontWeight: FontWeight.bold)),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(movie.releaseDate.day.toString()),
          )
        ],
      ),
    );

    return GestureDetector(
      child: movieCard,
      onTap: () {
        Get.to(() => const MovieDetailScreen(), arguments: movie);
      },
    );
  }
}
