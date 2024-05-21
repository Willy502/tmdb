import 'package:debrain_tmdb/models/movie_model.dart';
import 'package:flutter/material.dart';

class MovieDetailScreen extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!
        .settings
        .arguments as Movie; // Enviar parametros mediante pushnamed

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

  Widget _createAppBar(Movie pelicula) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigo,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          pelicula.title,
          style: const TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/loading.gif'),
          image: NetworkImage(pelicula.getBackdropImg()),
          fadeInDuration: const Duration(milliseconds: 150),
          fit: BoxFit.cover,
        ),
      ),
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
              Text(movie.title,
                  style: Theme.of(context).textTheme.titleLarge,
                  overflow: TextOverflow.ellipsis),
              Text(movie.originalTitle,
                  style: Theme.of(context).textTheme.titleMedium,
                  overflow: TextOverflow.ellipsis),
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
          Text(movie.originalLanguage.name),
          const SizedBox(height: 10.0),
          Text(
            movie.overview,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
