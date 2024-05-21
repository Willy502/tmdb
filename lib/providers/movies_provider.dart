import 'package:debrain_tmdb/models/movie_model.dart';
import 'package:get/get_connect.dart';

class MoviesProvider extends GetConnect {
  final String _apiKey = 'ff2c1d20fa50006ed38c9a704944dd3c';
  final String _url = 'api.themoviedb.org';
  final String _language = 'es-ES';

  @override
  void onInit() {
    print("Movies provider onInit");
  }

  Future<List<Movie>> getDiscoveredMovies() async {
    final url = Uri.https(
        _url, '3/discover/movie', {'api_key': _apiKey, 'language': _language});

    final resp = await get(url.toString());
    final movies = Movies.fromJson(resp.body);

    return movies.results;
  }
}
