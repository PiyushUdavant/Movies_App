import 'package:http/http.dart' as http;
import 'dart:convert';

const String apiKey = '811a516cc77e8fd14cb5b58516d3d753';
const String baseUrl = 'https://api.themoviedb.org/3';
Map<int, String> genreMap = {};
Future<void> fetchGenres() async {
  const  url = '$baseUrl/genre/movie/list?api_key=$apiKey&language=en-US';
  final response = await http.get(Uri.parse(url));
  
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final genres = data['genres'];
    
    for (var genre in genres) {
      genreMap[genre['id']] = genre['name'];
    }
    print('Genres Loaded : $genreMap');
  } else {
    throw Exception('Failed to load genres');
  }
}


Future<List> fetchMovies(String query) async{
const String apiKey = '811a516cc77e8fd14cb5b58516d3d753';
  final url = Uri.parse('https://api.themoviedb.org/3/search/movie?query=$query&api_key=$apiKey') ;
  
  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data['results']);
      return data['results'] ?? [];
    } else {
      throw Exception('Failed to load movies');
    }
  } catch (e) {
    print('Error: $e');
    return [];
  }
}

Future<List> popularMoviesfetch() async {
  const apiKey = '811a516cc77e8fd14cb5b58516d3d753';  
  const url = 'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&page=1';
  
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data['results'];
  } else {
    throw Exception('Failed to load popular movies');
  }
}
