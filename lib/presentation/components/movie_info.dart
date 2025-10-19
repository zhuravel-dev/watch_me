import 'package:flutter/material.dart';

class MovieInfo extends StatelessWidget {
  final String title;
  final double voteAverage;
  final String releaseDate;
  final String overview;

  const MovieInfo({
    super.key,
    required this.title,
    required this.voteAverage,
    required this.releaseDate,
    required this.overview,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text('⭐ ${voteAverage.toStringAsFixed(1)}', style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 8),
        Text('Release: $releaseDate', style: const TextStyle(fontSize: 14, color: Colors.grey)),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(overview, textAlign: TextAlign.justify, style: const TextStyle(fontSize: 16)),
        ),
      ],
    );
  }
}
