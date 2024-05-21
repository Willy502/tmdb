import 'package:debrain_tmdb/models/movie_model.dart';
import 'package:debrain_tmdb/providers/movies_provider.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class MoviesController extends GetxController {
  final movies = <Movie>[];
  final moviesProvider = Get.find<MoviesProvider>();

  MoviesController();

  Future getDiscoveredMovies() async {
    final discoveredMovies = await moviesProvider.getDiscoveredMovies();
    movies.clear();
    movies.addAll(discoveredMovies);
    update();
  }

  Future getSearchedMovie(String search) async {
    final searchedMovies = await moviesProvider.getSearchedMovie(search);
    movies.clear();
    movies.addAll(searchedMovies);
    update();
  }

  saveFavoriteMovie(Movie movie) async {

    await moviesProvider.isar.writeTxn(() async {
      await moviesProvider.isar.movies.put(movie);
    });
  }

  Future getFavorites() async {
    

    movies.clear();
    final isarMovies = moviesProvider.isar.collection<Movie>();
    List<Movie> iMovies = await isarMovies.where().findAll();
    movies.addAll(iMovies);
    update();
  }
}
