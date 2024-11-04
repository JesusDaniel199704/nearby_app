class Chain {
  String id;
  String name;

  Chain({
    required this.id,
    required this.name,
  });

  Chain copyWith({
    String? id,
    String? name,
  }) =>
      Chain(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory Chain.fromJson(Map<String, dynamic> json) => Chain(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
