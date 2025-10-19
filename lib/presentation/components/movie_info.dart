import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    final formattedDate = _formatDate(releaseDate);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text('⭐ ${voteAverage.toStringAsFixed(1).replaceFirst(RegExp(r'\.?0*$'), '')}'),
        const SizedBox(height: 8),
        Text('Release: $formattedDate', style: const TextStyle(fontSize: 14, color: Colors.grey)),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(overview, textAlign: TextAlign.justify, style: const TextStyle(fontSize: 16)),
        ),
      ],
    );
  }
}

String _formatDate(String dateString) {
  if (dateString.isEmpty) return '';
  try {
    final date = DateTime.parse(dateString);
    return DateFormat('dd.MM.yyyy').format(date);
  } catch (_) {
    return dateString;
  }
}
