import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:ghibli/models/movie.dart';
import 'package:ghibli/screens/home_screen.dart';
import 'package:ghibli/screens/movie_detail_screen.dart';
import 'package:ghibli/services/movies_api_service.dart';
import 'package:go_router/go_router.dart';

class RouterService {
  GoRouter getRouter() {
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          name: 'home',
          builder: (context, state) => HomeScreen(),
        ),
        GoRoute(
          path: '/movie/:id',
          builder: (context, state) {
            final movieId = state.pathParameters['id'];

            return FutureBuilder(
              future: MoviesApiService().getMovies(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                  try {
                    final movie = (snapshot.data! as List<Movie>).firstWhere((m) => m.id == movieId);
                    return MovieDetailScreen(movie: movie);
                  } catch (e) {
                    return Scaffold(
                      appBar: AppBar(title: const Text('Erreur')),
                      body: Center(child: Text('Film introuvable : $movieId')),
                    );
                  }
                } else {
                  return const Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            );
          },
        ),
      ],
    );
  }
}
