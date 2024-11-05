class Stats {
  int totalPhotos;
  int totalRatings;
  int totalTips;

  Stats({
    required this.totalPhotos,
    required this.totalRatings,
    required this.totalTips,
  });

  Stats copyWith({
    int? totalPhotos,
    int? totalRatings,
    int? totalTips,
  }) =>
      Stats(
        totalPhotos: totalPhotos ?? this.totalPhotos,
        totalRatings: totalRatings ?? this.totalRatings,
        totalTips: totalTips ?? this.totalTips,
      );

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        totalPhotos: json["total_photos"],
        totalRatings: json["total_ratings"],
        totalTips: json["total_tips"],
      );

  Map<String, dynamic> toJson() => {
        "total_photos": totalPhotos,
        "total_ratings": totalRatings,
        "total_tips": totalTips,
      };
}
