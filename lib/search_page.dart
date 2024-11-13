import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_fetch.dart';
import 'package:flutter_application_1/movie_card.dart';
import 'package:flutter_application_1/utils.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchController = TextEditingController();
  List _movies = [];
  bool loading = true;
  

  String getGenres(List<dynamic> genreIds) {
    if (genreIds.isEmpty) {
      return 'Action';
    }
    print('Genre IDs for movie: $genreIds');
    return genreIds.map((id) => genreMap[id] ?? '').join(' | ');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchGenres().then((_){
    });
    fetchPopularMovies();
  }

  Future<void> fetchPopularMovies() async{
    setState(() {
      loading = true;
    });
    final movies = await popularMoviesfetch();
    print('Fetched Movies : $movies');
    setState(() {
      _movies  = movies;
      loading = false;
    });
  }

  void searchMovies(String str) async{
    if(str.isEmpty) return fetchPopularMovies();
    final movies = await fetchMovies(str);
    setState(() {
      _movies = movies;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text('Home',
        style: AppFonts.titleStyle,
        ),
        backgroundColor: Colors.grey.shade200,
      ),
      body:Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children:[
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color:Colors.black,
                  ),
                ),
                hintText: 'Search',
                suffixIcon: Icon(Icons.search)
              ),
              onChanged: searchMovies,
            ),
            const SizedBox(height: 20),
            loading ?
            const Center(child: CircularProgressIndicator()) :
            Expanded(
              child: ListView.builder(
                itemCount: _movies.length,
                itemBuilder: (context ,index){
                  final movie = _movies[index];
                  final genres = getGenres(movie['genre_ids'] ?? []);
                  return MovieCard(
                    title: movie['title'] ?? '',
                    genres: genres.isNotEmpty ? genres : 'No Genres Defined',
                    rating: movie['vote_average'] ?? 0.0,
                    posterUrl: movie['poster_path']!= null?
                    'https://image.tmdb.org/t/p/w500${movie['poster_path']}'
                    :'http://motivatevalmorgan.com/wp-content/uploads/2016/06/default-movie-1-3.jpg',
                  );
                }
              )
            )
          ]
        )
      ),
    );
  }
}