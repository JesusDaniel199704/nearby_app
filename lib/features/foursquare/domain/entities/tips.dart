class Tip {
  String id;
  DateTime createdAt;
  String text;
  String url;
  String lang;
  int agreeCount;
  int disagreeCount;

  Tip({
    required this.id,
    required this.createdAt,
    required this.text,
    required this.url,
    required this.lang,
    required this.agreeCount,
    required this.disagreeCount,
  });

  Tip copyWith({
    String? id,
    DateTime? createdAt,
    String? text,
    String? url,
    String? lang,
    int? agreeCount,
    int? disagreeCount,
  }) =>
      Tip(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        text: text ?? this.text,
        url: url ?? this.url,
        lang: lang ?? this.lang,
        agreeCount: agreeCount ?? this.agreeCount,
        disagreeCount: disagreeCount ?? this.disagreeCount,
      );

  factory Tip.fromJson(Map<String, dynamic> json) => Tip(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        text: json["text"],
        url: json["url"],
        lang: json["lang"],
        agreeCount: json["agree_count"],
        disagreeCount: json["disagree_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "text": text,
        "url": url,
        "lang": lang,
        "agree_count": agreeCount,
        "disagree_count": disagreeCount,
      };
}
