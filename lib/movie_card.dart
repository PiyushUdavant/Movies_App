import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils.dart';

class MovieCard extends StatelessWidget {
  final String title;
  final String genres;
  final double rating;
  final String posterUrl;

  const MovieCard({
    super.key, 
    required this.title,
    required this.genres,
    required this.rating,
    required this.posterUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical:12),
      padding: const EdgeInsets.all(6),
      child: Stack(
        children:[
           Positioned(
            left: 0, 
            top: 40, 
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding:const EdgeInsets.only(left: 140.0, right: 16.0, top: 16.0, bottom: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8.0,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppFonts.movieTitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2.0),
                  Text(
                    genres,
                    style: AppFonts.genre,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 18.0),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      color: AppColors.ratingColor,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      "${rating.toStringAsFixed(1)} IMDB",
                      style: AppFonts.rating,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.network(
              posterUrl,
              width: 120, 
              height: 180, 
              fit: BoxFit.cover,
            ),
          ),
        ],
      )
    );
  }
}