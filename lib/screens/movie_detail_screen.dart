import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ghibli/models/movie.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    double rating = double.tryParse(movie.rtScore ?? "0") != null
        ? double.parse(movie.rtScore!) / 20
        : 0.0;

    return Scaffold(
      appBar: AppBar(title: Text(movie.title ?? '')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Colonne gauche
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(movie.movieBanner ?? '', height: 200),
                  const SizedBox(height: 12),
                  Text("Réalisateur : ${movie.director}"),
                  Text("Producteur : ${movie.producer}"),
                  Text("Durée : ${movie.runningTime} min"),
                  Text("Sortie : ${movie.releaseDate}"),
                ],
              ),
            ),
            const SizedBox(width: 24),
            // Colonne droite
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${movie.originalTitle} (${movie.originalTitleRomanised})",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Text(movie.description ?? ''),
                  const SizedBox(height: 24),
                  const Text("Note"),
                  RatingBarIndicator(
                    rating: rating,
                    itemCount: 5,
                    itemSize: 24.0,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                  ),
                  Text("${movie.rtScore} / 100"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
