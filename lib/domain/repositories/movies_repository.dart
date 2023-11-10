import 'package:cinemapedia/domain/entities/movie.dart';

// Llama al datasource
abstract class MovieRepository {
  Future<List<Movie>> getNowPlaying({int page = 1});
}