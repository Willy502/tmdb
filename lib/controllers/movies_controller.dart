import 'package:debrain_tmdb/models/movie_model.dart';
import 'package:debrain_tmdb/providers/movies_provider.dart';
import 'package:get/get.dart';

class MoviesController extends GetxController {
  final movies = <Movie>[];
  final moviesProvider = Get.find<MoviesProvider>();

  MoviesController();

  Future getDiscoveredMovies() async {
    final discoveredMovies = await moviesProvider.getDiscoveredMovies();
    movies.addAll(discoveredMovies);
    update();
  }

  Future getSearchedMovie(String search) async {
    final searchedMovies = await moviesProvider.getSearchedMovie(search);
    movies.clear();
    movies.addAll(searchedMovies);
    update();
  }
}
