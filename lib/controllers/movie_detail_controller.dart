import 'package:debrain_tmdb/models/movie_model.dart';
import 'package:get/get.dart';

class MovieDetailController extends GetxController {
  bool isFavorite = false;

  void toggleFavorite(Movie movie) {
    isFavorite = !isFavorite;
    if (isFavorite) {
      isFavorite = true;
    } else {
      isFavorite = false;
    }
    update();
  }
}
