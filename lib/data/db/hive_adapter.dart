import 'package:hive/hive.dart';
import 'package:watch_me/domain/entities/movie.dart';

part 'hive_adapter.g.dart';

@HiveType(typeId: 0)
class MovieHiveModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String overview;

  @HiveField(3)
  final String posterPath;

  @HiveField(4)
  final double voteAverage;

  @HiveField(5)
  final String releaseDate;

  @HiveField(6)
  final String backdropPath;

  MovieHiveModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.voteAverage,
    required this.releaseDate,
    required this.backdropPath,
  });

  factory MovieHiveModel.fromEntity(Movie movie) => MovieHiveModel(
    id: movie.id,
    title: movie.title,
    overview: movie.overview,
    posterPath: movie.posterPath,
    voteAverage: movie.voteAverage,
    releaseDate: movie.releaseDate,
    backdropPath: movie.backdropPath,
  );

  Movie toEntity() => Movie(
    id: id,
    title: title,
    overview: overview,
    posterPath: posterPath,
    voteAverage: voteAverage,
    releaseDate: releaseDate,
    backdropPath: backdropPath,
  );
}
