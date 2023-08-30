// ignore_for_file: unused_local_variable, prefer_const_declarations

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/model_class.dart';

// Recently added movies

class MoviesApi {
  static Future<List<movies>> recentlyAddedList() async {
    final url =
        'https://api.themoviedb.org/3/trending/movie/day?api_key=ab7b2ea558efe239067d55bcb6d15fbf';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final result = json['results'] as List<dynamic>;
    final moviesObj = result.map((e) {
      return movies.fromMap(e);
    }).toList();
    return moviesObj;
  }

  // latest movies

  static Future<List<movies>> recomendedMovies() async {
    final url =
        'https://api.themoviedb.org/3/movie/popular?api_key=ab7b2ea558efe239067d55bcb6d15fbf';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final result = json['results'] as List<dynamic>;
    final moviesObj = result.map((e) {
      return movies.fromMap(e);
    }).toList();
    return moviesObj;
  }

  static Future<List<movies>> exclusivesMovies() async {
    final url =
        'https://api.themoviedb.org/3/movie/upcoming?api_key=ab7b2ea558efe239067d55bcb6d15fbf';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final result = json['results'] as List<dynamic>;
    final moviesObj = result.map((e) {
      return movies.fromMap(e);
    }).toList();
    return moviesObj;
  }

  static Future<List<movies>> latestMovies() async {
    final url =
        'https://api.themoviedb.org/3/movie/top_rated?api_key=ab7b2ea558efe239067d55bcb6d15fbf';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final result = json['results'] as List<dynamic>;
    final moviesObj = result.map((e) {
      return movies.fromMap(e);
    }).toList();
    return moviesObj;
  }

  static Future<List<movies>> topMovies() async {
    final url =
        'https://api.themoviedb.org/3/movie/now_playing?api_key=ab7b2ea558efe239067d55bcb6d15fbf';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final result = json['results'] as List<dynamic>;
    final moviesObj = result.map((e) {
      return movies.fromMap(e);
    }).toList();
    return moviesObj;
  }

  static Future<List<movies>> topSeries() async {
    final url =
        'https://api.themoviedb.org/3/tv/top_rated?api_key=ab7b2ea558efe239067d55bcb6d15fbf';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      final result = json['results'] as List<dynamic>;
      final moviesObj = result.map((e) {
        return movies.fromMap(e);
      }).toList();
      return moviesObj;
    } else {
      return [];
    }
  }

  static Future<List<movies>> topTV() async {
    final url =
        'https://api.themoviedb.org/3/tv/airing_today?api_key=ab7b2ea558efe239067d55bcb6d15fbf';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      final result = json['results'] as List<dynamic>;
      final moviesObj = result.map((e) {
        return movies.fromMap(e);
      }).toList();
      return moviesObj;
    } else {
      return [];
    }
  }

  static Future<List<movies>> exclusiveTVShows() async {
    final url =
        'https://api.themoviedb.org/3/discover/movie?api_key=ab7b2ea558efe239067d55bcb6d15fbf';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      final result = json['results'] as List<dynamic>;
      final moviesObj = result.map((e) {
        return movies.fromMap(e);
      }).toList();
      return moviesObj;
    } else {
      return [];
    }
  }

  static Future<List<movies>> mysteryAndTrillerTV() async {
    final url =
        'https://api.themoviedb.org/3/movie/upcoming?api_key=ab7b2ea558efe239067d55bcb6d15fbf';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      final result = json['results'] as List<dynamic>;
      final moviesObj = result.map((e) {
        return movies.fromMap(e);
      }).toList();
      return moviesObj;
    } else {
      return [];
    }
  }

  static Future<List<movies>> search(value) async {
    if (value == null) {
      return [];
    }

    final url =
        'https://api.themoviedb.org/3/search/movie?query=${value}&include_adult=false&language=en-US&api_key=ab7b2ea558efe239067d55bcb6d15fbf';

    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      final result = json['results'] as List<dynamic>;
      final moviesObj = result.map((e) {
        return movies.fromMap(e);
      }).toList();

      return moviesObj;
    } else {
      return [];
    }
  }
}

//

