import 'package:cinemapedia/domain/entities/movie.dart';


// Clase que definira el origen de los datos
abstract class MoviesDatasource {
  Future<List<Movie>> getNowPlaying({int page = 1});
  
  Future<List<Movie>> getPopular({int page = 1});
  
  Future<List<Movie>> getUpComing({int page = 1});
  
  Future<List<Movie>> getTopRated({int page = 1});
}