import'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class AppColors{
  static const Color boldTextColor = Color(0xFF212121);
  static const Color ratingColor = Color(0xFF5EC570);
  static const Color lowRatingColor = Color(0xFF1C7EEB);
  static const Color text = Color(0xFF26262e);
  static const Color greyColor = Color(0xFFFFFFFF);
}

class AppFonts{
  static final TextStyle titleStyle = GoogleFonts.montserrat(
    color: AppColors.boldTextColor,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle movieTitle = GoogleFonts.montserrat(
    color: AppColors.text,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
   static final TextStyle genre = GoogleFonts.montserrat(
    color: Colors.grey.shade600,
    fontSize: 14,
  );

  static final TextStyle rating = GoogleFonts.montserrat(
    color: Colors.white,
    fontSize: 12,
  );

}

String baseImageUrl = "https://image.tmdb.org/t/p/w500";

String getPosterUrl(String path) {
  return '$baseImageUrl$path';
}
class Movie {
  final String title;
  final String genre;
  final double rating;
  final String posterPath;

  Movie({
    required this.title,
    required this.genre,
    required this.rating,
    required this.posterPath,
  });


}

