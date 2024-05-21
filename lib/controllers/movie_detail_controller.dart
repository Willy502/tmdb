import 'package:debrain_tmdb/controllers/movies_controller.dart';
import 'package:debrain_tmdb/models/movie_model.dart';
import 'package:get/get.dart';

class MovieDetailController extends GetxController {
  bool isFavorite = false;
  var controller = Get.find<MoviesController>();

  void toggleFavorite(Movie movie) {
    isFavorite = movie.isFavorite;
    var controller = Get.find<MoviesController>();
    if (isFavorite) {
      controller.deleteFavorite(movie);
    } else {
      controller.saveFavoriteMovie(movie);
    }
    isFavorite = !isFavorite;
    update();
  }

  Future validateFavorite(Movie movie) async {
    Movie? favMovie = await controller.getFavoriteById(movie);
    if (favMovie != null) {
      movie.isFavorite = true;
      isFavorite = true;
    }
    update();
  }
}
