class RateMyProfessor {
  final String firstName;
  final String lastName;
  final double rating;
  final int numReviews;
  final int pwta;
  final double difficulty;

  RateMyProfessor({
    required this.firstName,
    required this.lastName,
    required this.rating,
    required this.numReviews,
    required this.pwta,
    required this.difficulty,
  });

  factory RateMyProfessor.fromJson(Map<String, dynamic> json) {
    return RateMyProfessor(
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      rating: json['rating'] as double? ?? 0,
      numReviews: json['numreviews'] as int? ?? 0,
      pwta: json['pwta'] as int? ?? 0,
      difficulty: json['difficulty'] as double? ?? 0,
    );
  }
}