class Hours {
  String display;
  bool isLocalHoliday;
  bool openNow;
  List<Ular> regular;

  Hours({
    required this.display,
    required this.isLocalHoliday,
    required this.openNow,
    required this.regular,
  });

  Hours copyWith({
    String? display,
    bool? isLocalHoliday,
    bool? openNow,
    List<Ular>? regular,
  }) =>
      Hours(
        display: display ?? this.display,
        isLocalHoliday: isLocalHoliday ?? this.isLocalHoliday,
        openNow: openNow ?? this.openNow,
        regular: regular ?? this.regular,
      );

  factory Hours.fromJson(Map<String, dynamic> json) => Hours(
        display: json["display"],
        isLocalHoliday: json["is_local_holiday"],
        openNow: json["open_now"],
        regular: List<Ular>.from(json["regular"].map((x) => Ular.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "display": display,
        "is_local_holiday": isLocalHoliday,
        "open_now": openNow,
        "regular": List<dynamic>.from(regular.map((x) => x.toJson())),
      };
}

class Ular {
  String close;
  int day;
  String open;

  Ular({
    required this.close,
    required this.day,
    required this.open,
  });

  Ular copyWith({
    String? close,
    int? day,
    String? open,
  }) =>
      Ular(
        close: close ?? this.close,
        day: day ?? this.day,
        open: open ?? this.open,
      );

  factory Ular.fromJson(Map<String, dynamic> json) => Ular(
        close: json["close"],
        day: json["day"],
        open: json["open"],
      );

  Map<String, dynamic> toJson() => {
        "close": close,
        "day": day,
        "open": open,
      };
}
