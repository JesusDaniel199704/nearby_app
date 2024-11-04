class Attributes {
  String businessMeeting;
  String clean;
  String crowded;
  String datesPopular;
  String dressy;
  String familiesPopular;
  String glutenFreeDiet;
  String goodForDogs;
  String groupsPopular;
  String healthyDiet;
  String lateNight;
  String noisy;
  String quickBite;
  String romantic;
  String serviceQuality;
  String singlesPopular;
  String specialOccasion;
  String trendy;
  String valueForMoney;
  String veganDiet;
  String vegetarianDiet;

  Attributes({
    required this.businessMeeting,
    required this.clean,
    required this.crowded,
    required this.datesPopular,
    required this.dressy,
    required this.familiesPopular,
    required this.glutenFreeDiet,
    required this.goodForDogs,
    required this.groupsPopular,
    required this.healthyDiet,
    required this.lateNight,
    required this.noisy,
    required this.quickBite,
    required this.romantic,
    required this.serviceQuality,
    required this.singlesPopular,
    required this.specialOccasion,
    required this.trendy,
    required this.valueForMoney,
    required this.veganDiet,
    required this.vegetarianDiet,
  });

  Attributes copyWith({
    String? businessMeeting,
    String? clean,
    String? crowded,
    String? datesPopular,
    String? dressy,
    String? familiesPopular,
    String? glutenFreeDiet,
    String? goodForDogs,
    String? groupsPopular,
    String? healthyDiet,
    String? lateNight,
    String? noisy,
    String? quickBite,
    String? romantic,
    String? serviceQuality,
    String? singlesPopular,
    String? specialOccasion,
    String? trendy,
    String? valueForMoney,
    String? veganDiet,
    String? vegetarianDiet,
  }) =>
      Attributes(
        businessMeeting: businessMeeting ?? this.businessMeeting,
        clean: clean ?? this.clean,
        crowded: crowded ?? this.crowded,
        datesPopular: datesPopular ?? this.datesPopular,
        dressy: dressy ?? this.dressy,
        familiesPopular: familiesPopular ?? this.familiesPopular,
        glutenFreeDiet: glutenFreeDiet ?? this.glutenFreeDiet,
        goodForDogs: goodForDogs ?? this.goodForDogs,
        groupsPopular: groupsPopular ?? this.groupsPopular,
        healthyDiet: healthyDiet ?? this.healthyDiet,
        lateNight: lateNight ?? this.lateNight,
        noisy: noisy ?? this.noisy,
        quickBite: quickBite ?? this.quickBite,
        romantic: romantic ?? this.romantic,
        serviceQuality: serviceQuality ?? this.serviceQuality,
        singlesPopular: singlesPopular ?? this.singlesPopular,
        specialOccasion: specialOccasion ?? this.specialOccasion,
        trendy: trendy ?? this.trendy,
        valueForMoney: valueForMoney ?? this.valueForMoney,
        veganDiet: veganDiet ?? this.veganDiet,
        vegetarianDiet: vegetarianDiet ?? this.vegetarianDiet,
      );

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        businessMeeting: json["business_meeting"],
        clean: json["clean"],
        crowded: json["crowded"],
        datesPopular: json["dates_popular"],
        dressy: json["dressy"],
        familiesPopular: json["families_popular"],
        glutenFreeDiet: json["gluten_free_diet"],
        goodForDogs: json["good_for_dogs"],
        groupsPopular: json["groups_popular"],
        healthyDiet: json["healthy_diet"],
        lateNight: json["late_night"],
        noisy: json["noisy"],
        quickBite: json["quick_bite"],
        romantic: json["romantic"],
        serviceQuality: json["service_quality"],
        singlesPopular: json["singles_popular"],
        specialOccasion: json["special_occasion"],
        trendy: json["trendy"],
        valueForMoney: json["value_for_money"],
        veganDiet: json["vegan_diet"],
        vegetarianDiet: json["vegetarian_diet"],
      );

  Map<String, dynamic> toJson() => {
        "business_meeting": businessMeeting,
        "clean": clean,
        "crowded": crowded,
        "dates_popular": datesPopular,
        "dressy": dressy,
        "families_popular": familiesPopular,
        "gluten_free_diet": glutenFreeDiet,
        "good_for_dogs": goodForDogs,
        "groups_popular": groupsPopular,
        "healthy_diet": healthyDiet,
        "late_night": lateNight,
        "noisy": noisy,
        "quick_bite": quickBite,
        "romantic": romantic,
        "service_quality": serviceQuality,
        "singles_popular": singlesPopular,
        "special_occasion": specialOccasion,
        "trendy": trendy,
        "value_for_money": valueForMoney,
        "vegan_diet": veganDiet,
        "vegetarian_diet": vegetarianDiet,
      };
}
