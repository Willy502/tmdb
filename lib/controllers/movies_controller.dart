import 'package:debrain_tmdb/models/movie_model.dart';
import 'package:debrain_tmdb/providers/movies_provider.dart';
import 'package:get/get.dart';

class MoviesController extends GetxController {
  final movies = <Movie>[];
  final moviesProvider = Get.find<MoviesProvider>();

  MoviesController() {
    getDiscoveredMovies();
  }

  Future getDiscoveredMovies() async {
    final discoveredMovies = await moviesProvider.getDiscoveredMovies();
    movies.addAll(discoveredMovies);
    update();
  }
}
