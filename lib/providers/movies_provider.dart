import 'package:debrain_tmdb/models/movie_model.dart';
import 'package:debrain_tmdb/models/movies_model.dart';
import 'package:get/get_connect.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class MoviesProvider extends GetConnect {
  final String _apiKey = 'ff2c1d20fa50006ed38c9a704944dd3c';
  final String _url = 'api.themoviedb.org';
  final String _language = 'en-EN';

  late Isar isar;

  @override
  void onInit() async {
    print("Movies provider onInit");
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([MovieSchema], directory: dir.path);
  }

  Future<List<Movie>> getDiscoveredMovies() async {
    final url = Uri.https(
        _url, '3/discover/movie', {'api_key': _apiKey, 'language': _language});

    final resp = await get(url.toString());
    final movies = Movies.fromJson(resp.body);

    return movies.results;
  }

  Future<List<Movie>> getSearchedMovie(String search) async {
    final url = Uri.https(_url, '3/search/movie',
        {'api_key': _apiKey, 'language': _language, 'query': search});

    final resp = await get(url.toString());

    if (resp.body != null) {
      final movies = Movies.fromJson(resp.body);

      return movies.results;
    }
    return [];
  }
}
