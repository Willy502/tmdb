import 'package:debrain_tmdb/controllers/movie_detail_controller.dart';
import 'package:debrain_tmdb/controllers/movies_controller.dart';
import 'package:debrain_tmdb/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    Get.put(MovieDetailController());

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _createAppBar(movie),
          SliverList(
              delegate: SliverChildListDelegate([
            const SizedBox(height: 10.0),
            _posterTitulo(context, movie),
            _descripcion(movie)
          ]))
        ],
      ),
    );
  }

  Widget _createAppBar(Movie movie) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigo,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            movie.title,
            style: const TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/loading.gif'),
          image: NetworkImage(movie.getBackdropImg()),
          fadeInDuration: const Duration(milliseconds: 150),
          fit: BoxFit.cover,
        ),
      ),
      actions: [
        GetBuilder<MovieDetailController>(builder: (controller) {
          controller.validateFavorite(movie);

          return IconButton(
              onPressed: () => saveFavorite(movie),
              icon: Icon(Icons.favorite,
                  color: controller.isFavorite ? Colors.red : Colors.black45));
        }),
      ],
    );
  }

  Widget _posterTitulo(BuildContext context, Movie movie) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Hero(
            tag: movie.uniqueId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                image: NetworkImage(movie.getPosterImg()),
                height: 150.0,
              ),
            ),
          ),
          const SizedBox(width: 20.0),
          Flexible(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // TextOverflow evita que se salga de los márgenes
              Text(movie.title, style: Theme.of(context).textTheme.titleLarge),
              Text(movie.originalTitle,
                  style: Theme.of(context).textTheme.titleMedium),
              Row(
                children: <Widget>[
                  const Icon(Icons.star_border),
                  Text(movie.voteAverage.toString(),
                      style: Theme.of(context).textTheme.titleMedium)
                ],
              )
            ],
          ))
        ],
      ),
    );
  }

  Widget _descripcion(Movie movie) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(movie.releaseDate.toString()),
          Text(movie.originalLanguage),
          const SizedBox(height: 10.0),
          Text(
            movie.overview,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }

  void saveFavorite(Movie movie) {
    Get.find<MovieDetailController>().toggleFavorite(movie);
  }
}
