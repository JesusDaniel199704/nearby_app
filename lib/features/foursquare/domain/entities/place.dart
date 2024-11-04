// To parse this JSON data, do
//
//     final place = placeFromJson(jsonString);

import 'dart:convert';

Place placeFromJson(String str) => Place.fromJson(json.decode(str));

String placeToJson(Place data) => json.encode(data.toJson());

class Place {
  List<Result>? results;
  Context? context;

  Place({
    this.results,
    this.context,
  });

  Place copyWith({
    List<Result>? results,
    Context? context,
  }) =>
      Place(
        results: results ?? this.results,
        context: context ?? this.context,
      );

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
        context:
            json["context"] == null ? null : Context.fromJson(json["context"]),
      );

  Map<String, dynamic> toJson() => {
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
        "context": context?.toJson(),
      };
}

class Context {
  GeoBounds? geoBounds;

  Context({
    this.geoBounds,
  });

  Context copyWith({
    GeoBounds? geoBounds,
  }) =>
      Context(
        geoBounds: geoBounds ?? this.geoBounds,
      );

  factory Context.fromJson(Map<String, dynamic> json) => Context(
        geoBounds: json["geo_bounds"] == null
            ? null
            : GeoBounds.fromJson(json["geo_bounds"]),
      );

  Map<String, dynamic> toJson() => {
        "geo_bounds": geoBounds?.toJson(),
      };
}

class GeoBounds {
  Circle? circle;

  GeoBounds({
    this.circle,
  });

  GeoBounds copyWith({
    Circle? circle,
  }) =>
      GeoBounds(
        circle: circle ?? this.circle,
      );

  factory GeoBounds.fromJson(Map<String, dynamic> json) => GeoBounds(
        circle: json["circle"] == null ? null : Circle.fromJson(json["circle"]),
      );

  Map<String, dynamic> toJson() => {
        "circle": circle?.toJson(),
      };
}

class Circle {
  DropOff? center;
  int? radius;

  Circle({
    this.center,
    this.radius,
  });

  Circle copyWith({
    DropOff? center,
    int? radius,
  }) =>
      Circle(
        center: center ?? this.center,
        radius: radius ?? this.radius,
      );

  factory Circle.fromJson(Map<String, dynamic> json) => Circle(
        center:
            json["center"] == null ? null : DropOff.fromJson(json["center"]),
        radius: json["radius"],
      );

  Map<String, dynamic> toJson() => {
        "center": center?.toJson(),
        "radius": radius,
      };
}

class DropOff {
  int? latitude;
  int? longitude;

  DropOff({
    this.latitude,
    this.longitude,
  });

  DropOff copyWith({
    int? latitude,
    int? longitude,
  }) =>
      DropOff(
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
      );

  factory DropOff.fromJson(Map<String, dynamic> json) => DropOff(
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

class Result {
  String? fsqId;
  List<Category>? categories;
  List<Chain>? chains;
  String? closedBucket;
  DateTime? dateClosed;
  String? description;
  int? distance;
  String? email;
  String? fax;
  Features? features;
  Geocodes? geocodes;
  Hours? hours;
  List<Ular>? hoursPopular;
  String? link;
  Location? location;
  String? menu;
  String? name;
  List<Photo>? photos;
  int? popularity;
  int? price;
  int? rating;
  RelatedPlaces? relatedPlaces;
  SocialMedia? socialMedia;
  Stats? stats;
  String? storeId;
  List<String>? tastes;
  String? tel;
  String? timezone;
  List<Tip>? tips;
  String? venueRealityBucket;
  bool? verified;
  String? website;

  Result({
    this.fsqId,
    this.categories,
    this.chains,
    this.closedBucket,
    this.dateClosed,
    this.description,
    this.distance,
    this.email,
    this.fax,
    this.features,
    this.geocodes,
    this.hours,
    this.hoursPopular,
    this.link,
    this.location,
    this.menu,
    this.name,
    this.photos,
    this.popularity,
    this.price,
    this.rating,
    this.relatedPlaces,
    this.socialMedia,
    this.stats,
    this.storeId,
    this.tastes,
    this.tel,
    this.timezone,
    this.tips,
    this.venueRealityBucket,
    this.verified,
    this.website,
  });

  Result copyWith({
    String? fsqId,
    List<Category>? categories,
    List<Chain>? chains,
    String? closedBucket,
    DateTime? dateClosed,
    String? description,
    int? distance,
    String? email,
    String? fax,
    Features? features,
    Geocodes? geocodes,
    Hours? hours,
    List<Ular>? hoursPopular,
    String? link,
    Location? location,
    String? menu,
    String? name,
    List<Photo>? photos,
    int? popularity,
    int? price,
    int? rating,
    RelatedPlaces? relatedPlaces,
    SocialMedia? socialMedia,
    Stats? stats,
    String? storeId,
    List<String>? tastes,
    String? tel,
    String? timezone,
    List<Tip>? tips,
    String? venueRealityBucket,
    bool? verified,
    String? website,
  }) =>
      Result(
        fsqId: fsqId ?? this.fsqId,
        categories: categories ?? this.categories,
        chains: chains ?? this.chains,
        closedBucket: closedBucket ?? this.closedBucket,
        dateClosed: dateClosed ?? this.dateClosed,
        description: description ?? this.description,
        distance: distance ?? this.distance,
        email: email ?? this.email,
        fax: fax ?? this.fax,
        features: features ?? this.features,
        geocodes: geocodes ?? this.geocodes,
        hours: hours ?? this.hours,
        hoursPopular: hoursPopular ?? this.hoursPopular,
        link: link ?? this.link,
        location: location ?? this.location,
        menu: menu ?? this.menu,
        name: name ?? this.name,
        photos: photos ?? this.photos,
        popularity: popularity ?? this.popularity,
        price: price ?? this.price,
        rating: rating ?? this.rating,
        relatedPlaces: relatedPlaces ?? this.relatedPlaces,
        socialMedia: socialMedia ?? this.socialMedia,
        stats: stats ?? this.stats,
        storeId: storeId ?? this.storeId,
        tastes: tastes ?? this.tastes,
        tel: tel ?? this.tel,
        timezone: timezone ?? this.timezone,
        tips: tips ?? this.tips,
        venueRealityBucket: venueRealityBucket ?? this.venueRealityBucket,
        verified: verified ?? this.verified,
        website: website ?? this.website,
      );

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        fsqId: json["fsq_id"],
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"]!.map((x) => Category.fromJson(x))),
        chains: json["chains"] == null
            ? []
            : List<Chain>.from(json["chains"]!.map((x) => Chain.fromJson(x))),
        closedBucket: json["closed_bucket"],
        dateClosed: json["date_closed"] == null
            ? null
            : DateTime.parse(json["date_closed"]),
        description: json["description"],
        distance: json["distance"],
        email: json["email"],
        fax: json["fax"],
        features: json["features"] == null
            ? null
            : Features.fromJson(json["features"]),
        geocodes: json["geocodes"] == null
            ? null
            : Geocodes.fromJson(json["geocodes"]),
        hours: json["hours"] == null ? null : Hours.fromJson(json["hours"]),
        hoursPopular: json["hours_popular"] == null
            ? []
            : List<Ular>.from(
                json["hours_popular"]!.map((x) => Ular.fromJson(x))),
        link: json["link"],
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        menu: json["menu"],
        name: json["name"],
        photos: json["photos"] == null
            ? []
            : List<Photo>.from(json["photos"]!.map((x) => Photo.fromJson(x))),
        popularity: json["popularity"],
        price: json["price"],
        rating: json["rating"],
        relatedPlaces: json["related_places"] == null
            ? null
            : RelatedPlaces.fromJson(json["related_places"]),
        socialMedia: json["social_media"] == null
            ? null
            : SocialMedia.fromJson(json["social_media"]),
        stats: json["stats"] == null ? null : Stats.fromJson(json["stats"]),
        storeId: json["store_id"],
        tastes: json["tastes"] == null
            ? []
            : List<String>.from(json["tastes"]!.map((x) => x)),
        tel: json["tel"],
        timezone: json["timezone"],
        tips: json["tips"] == null
            ? []
            : List<Tip>.from(json["tips"]!.map((x) => Tip.fromJson(x))),
        venueRealityBucket: json["venue_reality_bucket"],
        verified: json["verified"],
        website: json["website"],
      );

  Map<String, dynamic> toJson() => {
        "fsq_id": fsqId,
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "chains": chains == null
            ? []
            : List<dynamic>.from(chains!.map((x) => x.toJson())),
        "closed_bucket": closedBucket,
        "date_closed":
            "${dateClosed!.year.toString().padLeft(4, '0')}-${dateClosed!.month.toString().padLeft(2, '0')}-${dateClosed!.day.toString().padLeft(2, '0')}",
        "description": description,
        "distance": distance,
        "email": email,
        "fax": fax,
        "features": features?.toJson(),
        "geocodes": geocodes?.toJson(),
        "hours": hours?.toJson(),
        "hours_popular": hoursPopular == null
            ? []
            : List<dynamic>.from(hoursPopular!.map((x) => x.toJson())),
        "link": link,
        "location": location?.toJson(),
        "menu": menu,
        "name": name,
        "photos": photos == null
            ? []
            : List<dynamic>.from(photos!.map((x) => x.toJson())),
        "popularity": popularity,
        "price": price,
        "rating": rating,
        "related_places": relatedPlaces?.toJson(),
        "social_media": socialMedia?.toJson(),
        "stats": stats?.toJson(),
        "store_id": storeId,
        "tastes":
            tastes == null ? [] : List<dynamic>.from(tastes!.map((x) => x)),
        "tel": tel,
        "timezone": timezone,
        "tips": tips == null
            ? []
            : List<dynamic>.from(tips!.map((x) => x.toJson())),
        "venue_reality_bucket": venueRealityBucket,
        "verified": verified,
        "website": website,
      };
}

class Category {
  int? id;
  String? name;
  String? shortName;
  String? pluralName;
  Photo? icon;

  Category({
    this.id,
    this.name,
    this.shortName,
    this.pluralName,
    this.icon,
  });

  Category copyWith({
    int? id,
    String? name,
    String? shortName,
    String? pluralName,
    Photo? icon,
  }) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
        shortName: shortName ?? this.shortName,
        pluralName: pluralName ?? this.pluralName,
        icon: icon ?? this.icon,
      );

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        shortName: json["short_name"],
        pluralName: json["plural_name"],
        icon: json["icon"] == null ? null : Photo.fromJson(json["icon"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "short_name": shortName,
        "plural_name": pluralName,
        "icon": icon?.toJson(),
      };
}

class Photo {
  String? id;
  DateTime? createdAt;
  String? prefix;
  String? suffix;
  int? width;
  int? height;
  List<String>? classifications;
  Tip? tip;

  Photo({
    this.id,
    this.createdAt,
    this.prefix,
    this.suffix,
    this.width,
    this.height,
    this.classifications,
    this.tip,
  });

  Photo copyWith({
    String? id,
    DateTime? createdAt,
    String? prefix,
    String? suffix,
    int? width,
    int? height,
    List<String>? classifications,
    Tip? tip,
  }) =>
      Photo(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        prefix: prefix ?? this.prefix,
        suffix: suffix ?? this.suffix,
        width: width ?? this.width,
        height: height ?? this.height,
        classifications: classifications ?? this.classifications,
        tip: tip ?? this.tip,
      );

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        prefix: json["prefix"],
        suffix: json["suffix"],
        width: json["width"],
        height: json["height"],
        classifications: json["classifications"] == null
            ? []
            : List<String>.from(json["classifications"]!.map((x) => x)),
        tip: json["tip"] == null ? null : Tip.fromJson(json["tip"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "prefix": prefix,
        "suffix": suffix,
        "width": width,
        "height": height,
        "classifications": classifications == null
            ? []
            : List<dynamic>.from(classifications!.map((x) => x)),
        "tip": tip?.toJson(),
      };
}

class Tip {
  String? id;
  DateTime? createdAt;
  String? text;
  String? url;
  String? lang;
  int? agreeCount;
  int? disagreeCount;

  Tip({
    this.id,
    this.createdAt,
    this.text,
    this.url,
    this.lang,
    this.agreeCount,
    this.disagreeCount,
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
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        text: json["text"],
        url: json["url"],
        lang: json["lang"],
        agreeCount: json["agree_count"],
        disagreeCount: json["disagree_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "text": text,
        "url": url,
        "lang": lang,
        "agree_count": agreeCount,
        "disagree_count": disagreeCount,
      };
}

class Chain {
  String? id;
  String? name;

  Chain({
    this.id,
    this.name,
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

class Features {
  Payment? payment;
  FoodAndDrink? foodAndDrink;
  Services? services;
  Amenities? amenities;
  Attributes? attributes;

  Features({
    this.payment,
    this.foodAndDrink,
    this.services,
    this.amenities,
    this.attributes,
  });

  Features copyWith({
    Payment? payment,
    FoodAndDrink? foodAndDrink,
    Services? services,
    Amenities? amenities,
    Attributes? attributes,
  }) =>
      Features(
        payment: payment ?? this.payment,
        foodAndDrink: foodAndDrink ?? this.foodAndDrink,
        services: services ?? this.services,
        amenities: amenities ?? this.amenities,
        attributes: attributes ?? this.attributes,
      );

  factory Features.fromJson(Map<String, dynamic> json) => Features(
        payment:
            json["payment"] == null ? null : Payment.fromJson(json["payment"]),
        foodAndDrink: json["food_and_drink"] == null
            ? null
            : FoodAndDrink.fromJson(json["food_and_drink"]),
        services: json["services"] == null
            ? null
            : Services.fromJson(json["services"]),
        amenities: json["amenities"] == null
            ? null
            : Amenities.fromJson(json["amenities"]),
        attributes: json["attributes"] == null
            ? null
            : Attributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "payment": payment?.toJson(),
        "food_and_drink": foodAndDrink?.toJson(),
        "services": services?.toJson(),
        "amenities": amenities?.toJson(),
        "attributes": attributes?.toJson(),
      };
}

class Amenities {
  RelatedPlaces? restroom;
  RelatedPlaces? smoking;
  RelatedPlaces? jukebox;
  RelatedPlaces? music;
  RelatedPlaces? liveMusic;
  RelatedPlaces? privateRoom;
  RelatedPlaces? outdoorSeating;
  RelatedPlaces? tvs;
  RelatedPlaces? atm;
  RelatedPlaces? coatCheck;
  RelatedPlaces? wheelchairAccessible;
  Parking? parking;
  RelatedPlaces? sitDownDining;
  String? wifi;

  Amenities({
    this.restroom,
    this.smoking,
    this.jukebox,
    this.music,
    this.liveMusic,
    this.privateRoom,
    this.outdoorSeating,
    this.tvs,
    this.atm,
    this.coatCheck,
    this.wheelchairAccessible,
    this.parking,
    this.sitDownDining,
    this.wifi,
  });

  Amenities copyWith({
    RelatedPlaces? restroom,
    RelatedPlaces? smoking,
    RelatedPlaces? jukebox,
    RelatedPlaces? music,
    RelatedPlaces? liveMusic,
    RelatedPlaces? privateRoom,
    RelatedPlaces? outdoorSeating,
    RelatedPlaces? tvs,
    RelatedPlaces? atm,
    RelatedPlaces? coatCheck,
    RelatedPlaces? wheelchairAccessible,
    Parking? parking,
    RelatedPlaces? sitDownDining,
    String? wifi,
  }) =>
      Amenities(
        restroom: restroom ?? this.restroom,
        smoking: smoking ?? this.smoking,
        jukebox: jukebox ?? this.jukebox,
        music: music ?? this.music,
        liveMusic: liveMusic ?? this.liveMusic,
        privateRoom: privateRoom ?? this.privateRoom,
        outdoorSeating: outdoorSeating ?? this.outdoorSeating,
        tvs: tvs ?? this.tvs,
        atm: atm ?? this.atm,
        coatCheck: coatCheck ?? this.coatCheck,
        wheelchairAccessible: wheelchairAccessible ?? this.wheelchairAccessible,
        parking: parking ?? this.parking,
        sitDownDining: sitDownDining ?? this.sitDownDining,
        wifi: wifi ?? this.wifi,
      );

  factory Amenities.fromJson(Map<String, dynamic> json) => Amenities(
        restroom: json["restroom"] == null
            ? null
            : RelatedPlaces.fromJson(json["restroom"]),
        smoking: json["smoking"] == null
            ? null
            : RelatedPlaces.fromJson(json["smoking"]),
        jukebox: json["jukebox"] == null
            ? null
            : RelatedPlaces.fromJson(json["jukebox"]),
        music: json["music"] == null
            ? null
            : RelatedPlaces.fromJson(json["music"]),
        liveMusic: json["live_music"] == null
            ? null
            : RelatedPlaces.fromJson(json["live_music"]),
        privateRoom: json["private_room"] == null
            ? null
            : RelatedPlaces.fromJson(json["private_room"]),
        outdoorSeating: json["outdoor_seating"] == null
            ? null
            : RelatedPlaces.fromJson(json["outdoor_seating"]),
        tvs: json["tvs"] == null ? null : RelatedPlaces.fromJson(json["tvs"]),
        atm: json["atm"] == null ? null : RelatedPlaces.fromJson(json["atm"]),
        coatCheck: json["coat_check"] == null
            ? null
            : RelatedPlaces.fromJson(json["coat_check"]),
        wheelchairAccessible: json["wheelchair_accessible"] == null
            ? null
            : RelatedPlaces.fromJson(json["wheelchair_accessible"]),
        parking:
            json["parking"] == null ? null : Parking.fromJson(json["parking"]),
        sitDownDining: json["sit_down_dining"] == null
            ? null
            : RelatedPlaces.fromJson(json["sit_down_dining"]),
        wifi: json["wifi"],
      );

  Map<String, dynamic> toJson() => {
        "restroom": restroom?.toJson(),
        "smoking": smoking?.toJson(),
        "jukebox": jukebox?.toJson(),
        "music": music?.toJson(),
        "live_music": liveMusic?.toJson(),
        "private_room": privateRoom?.toJson(),
        "outdoor_seating": outdoorSeating?.toJson(),
        "tvs": tvs?.toJson(),
        "atm": atm?.toJson(),
        "coat_check": coatCheck?.toJson(),
        "wheelchair_accessible": wheelchairAccessible?.toJson(),
        "parking": parking?.toJson(),
        "sit_down_dining": sitDownDining?.toJson(),
        "wifi": wifi,
      };
}

class RelatedPlaces {
  RelatedPlaces();

  RelatedPlaces copyWith() => RelatedPlaces();

  factory RelatedPlaces.fromJson(Map<String, dynamic> json) => RelatedPlaces();

  Map<String, dynamic> toJson() => {};
}

class Parking {
  RelatedPlaces? parking;
  RelatedPlaces? streetParking;
  RelatedPlaces? valetParking;
  RelatedPlaces? publicLot;
  RelatedPlaces? privateLot;

  Parking({
    this.parking,
    this.streetParking,
    this.valetParking,
    this.publicLot,
    this.privateLot,
  });

  Parking copyWith({
    RelatedPlaces? parking,
    RelatedPlaces? streetParking,
    RelatedPlaces? valetParking,
    RelatedPlaces? publicLot,
    RelatedPlaces? privateLot,
  }) =>
      Parking(
        parking: parking ?? this.parking,
        streetParking: streetParking ?? this.streetParking,
        valetParking: valetParking ?? this.valetParking,
        publicLot: publicLot ?? this.publicLot,
        privateLot: privateLot ?? this.privateLot,
      );

  factory Parking.fromJson(Map<String, dynamic> json) => Parking(
        parking: json["parking"] == null
            ? null
            : RelatedPlaces.fromJson(json["parking"]),
        streetParking: json["street_parking"] == null
            ? null
            : RelatedPlaces.fromJson(json["street_parking"]),
        valetParking: json["valet_parking"] == null
            ? null
            : RelatedPlaces.fromJson(json["valet_parking"]),
        publicLot: json["public_lot"] == null
            ? null
            : RelatedPlaces.fromJson(json["public_lot"]),
        privateLot: json["private_lot"] == null
            ? null
            : RelatedPlaces.fromJson(json["private_lot"]),
      );

  Map<String, dynamic> toJson() => {
        "parking": parking?.toJson(),
        "street_parking": streetParking?.toJson(),
        "valet_parking": valetParking?.toJson(),
        "public_lot": publicLot?.toJson(),
        "private_lot": privateLot?.toJson(),
      };
}

class Attributes {
  String? businessMeeting;
  String? clean;
  String? crowded;
  String? datesPopular;
  String? dressy;
  String? familiesPopular;
  String? glutenFreeDiet;
  String? goodForDogs;
  String? groupsPopular;
  String? healthyDiet;
  String? lateNight;
  String? noisy;
  String? quickBite;
  String? romantic;
  String? serviceQuality;
  String? singlesPopular;
  String? specialOccasion;
  String? trendy;
  String? valueForMoney;
  String? veganDiet;
  String? vegetarianDiet;

  Attributes({
    this.businessMeeting,
    this.clean,
    this.crowded,
    this.datesPopular,
    this.dressy,
    this.familiesPopular,
    this.glutenFreeDiet,
    this.goodForDogs,
    this.groupsPopular,
    this.healthyDiet,
    this.lateNight,
    this.noisy,
    this.quickBite,
    this.romantic,
    this.serviceQuality,
    this.singlesPopular,
    this.specialOccasion,
    this.trendy,
    this.valueForMoney,
    this.veganDiet,
    this.vegetarianDiet,
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

class FoodAndDrink {
  Alcohol? alcohol;
  Meals? meals;

  FoodAndDrink({
    this.alcohol,
    this.meals,
  });

  FoodAndDrink copyWith({
    Alcohol? alcohol,
    Meals? meals,
  }) =>
      FoodAndDrink(
        alcohol: alcohol ?? this.alcohol,
        meals: meals ?? this.meals,
      );

  factory FoodAndDrink.fromJson(Map<String, dynamic> json) => FoodAndDrink(
        alcohol:
            json["alcohol"] == null ? null : Alcohol.fromJson(json["alcohol"]),
        meals: json["meals"] == null ? null : Meals.fromJson(json["meals"]),
      );

  Map<String, dynamic> toJson() => {
        "alcohol": alcohol?.toJson(),
        "meals": meals?.toJson(),
      };
}

class Alcohol {
  RelatedPlaces? barService;
  RelatedPlaces? beer;
  RelatedPlaces? byo;
  RelatedPlaces? cocktails;
  RelatedPlaces? fullBar;
  RelatedPlaces? wine;

  Alcohol({
    this.barService,
    this.beer,
    this.byo,
    this.cocktails,
    this.fullBar,
    this.wine,
  });

  Alcohol copyWith({
    RelatedPlaces? barService,
    RelatedPlaces? beer,
    RelatedPlaces? byo,
    RelatedPlaces? cocktails,
    RelatedPlaces? fullBar,
    RelatedPlaces? wine,
  }) =>
      Alcohol(
        barService: barService ?? this.barService,
        beer: beer ?? this.beer,
        byo: byo ?? this.byo,
        cocktails: cocktails ?? this.cocktails,
        fullBar: fullBar ?? this.fullBar,
        wine: wine ?? this.wine,
      );

  factory Alcohol.fromJson(Map<String, dynamic> json) => Alcohol(
        barService: json["bar_service"] == null
            ? null
            : RelatedPlaces.fromJson(json["bar_service"]),
        beer:
            json["beer"] == null ? null : RelatedPlaces.fromJson(json["beer"]),
        byo: json["byo"] == null ? null : RelatedPlaces.fromJson(json["byo"]),
        cocktails: json["cocktails"] == null
            ? null
            : RelatedPlaces.fromJson(json["cocktails"]),
        fullBar: json["full_bar"] == null
            ? null
            : RelatedPlaces.fromJson(json["full_bar"]),
        wine:
            json["wine"] == null ? null : RelatedPlaces.fromJson(json["wine"]),
      );

  Map<String, dynamic> toJson() => {
        "bar_service": barService?.toJson(),
        "beer": beer?.toJson(),
        "byo": byo?.toJson(),
        "cocktails": cocktails?.toJson(),
        "full_bar": fullBar?.toJson(),
        "wine": wine?.toJson(),
      };
}

class Meals {
  RelatedPlaces? barSnacks;
  RelatedPlaces? breakfast;
  RelatedPlaces? brunch;
  RelatedPlaces? lunch;
  RelatedPlaces? happyHour;
  RelatedPlaces? dessert;
  RelatedPlaces? dinner;
  RelatedPlaces? tastingMenu;

  Meals({
    this.barSnacks,
    this.breakfast,
    this.brunch,
    this.lunch,
    this.happyHour,
    this.dessert,
    this.dinner,
    this.tastingMenu,
  });

  Meals copyWith({
    RelatedPlaces? barSnacks,
    RelatedPlaces? breakfast,
    RelatedPlaces? brunch,
    RelatedPlaces? lunch,
    RelatedPlaces? happyHour,
    RelatedPlaces? dessert,
    RelatedPlaces? dinner,
    RelatedPlaces? tastingMenu,
  }) =>
      Meals(
        barSnacks: barSnacks ?? this.barSnacks,
        breakfast: breakfast ?? this.breakfast,
        brunch: brunch ?? this.brunch,
        lunch: lunch ?? this.lunch,
        happyHour: happyHour ?? this.happyHour,
        dessert: dessert ?? this.dessert,
        dinner: dinner ?? this.dinner,
        tastingMenu: tastingMenu ?? this.tastingMenu,
      );

  factory Meals.fromJson(Map<String, dynamic> json) => Meals(
        barSnacks: json["bar_snacks"] == null
            ? null
            : RelatedPlaces.fromJson(json["bar_snacks"]),
        breakfast: json["breakfast"] == null
            ? null
            : RelatedPlaces.fromJson(json["breakfast"]),
        brunch: json["brunch"] == null
            ? null
            : RelatedPlaces.fromJson(json["brunch"]),
        lunch: json["lunch"] == null
            ? null
            : RelatedPlaces.fromJson(json["lunch"]),
        happyHour: json["happy_hour"] == null
            ? null
            : RelatedPlaces.fromJson(json["happy_hour"]),
        dessert: json["dessert"] == null
            ? null
            : RelatedPlaces.fromJson(json["dessert"]),
        dinner: json["dinner"] == null
            ? null
            : RelatedPlaces.fromJson(json["dinner"]),
        tastingMenu: json["tasting_menu"] == null
            ? null
            : RelatedPlaces.fromJson(json["tasting_menu"]),
      );

  Map<String, dynamic> toJson() => {
        "bar_snacks": barSnacks?.toJson(),
        "breakfast": breakfast?.toJson(),
        "brunch": brunch?.toJson(),
        "lunch": lunch?.toJson(),
        "happy_hour": happyHour?.toJson(),
        "dessert": dessert?.toJson(),
        "dinner": dinner?.toJson(),
        "tasting_menu": tastingMenu?.toJson(),
      };
}

class Payment {
  CreditCards? creditCards;
  DigitalWallet? digitalWallet;

  Payment({
    this.creditCards,
    this.digitalWallet,
  });

  Payment copyWith({
    CreditCards? creditCards,
    DigitalWallet? digitalWallet,
  }) =>
      Payment(
        creditCards: creditCards ?? this.creditCards,
        digitalWallet: digitalWallet ?? this.digitalWallet,
      );

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        creditCards: json["credit_cards"] == null
            ? null
            : CreditCards.fromJson(json["credit_cards"]),
        digitalWallet: json["digital_wallet"] == null
            ? null
            : DigitalWallet.fromJson(json["digital_wallet"]),
      );

  Map<String, dynamic> toJson() => {
        "credit_cards": creditCards?.toJson(),
        "digital_wallet": digitalWallet?.toJson(),
      };
}

class CreditCards {
  RelatedPlaces? acceptsCreditCards;
  RelatedPlaces? amex;
  RelatedPlaces? discover;
  RelatedPlaces? visa;
  RelatedPlaces? dinersClub;
  RelatedPlaces? masterCard;
  RelatedPlaces? unionPay;

  CreditCards({
    this.acceptsCreditCards,
    this.amex,
    this.discover,
    this.visa,
    this.dinersClub,
    this.masterCard,
    this.unionPay,
  });

  CreditCards copyWith({
    RelatedPlaces? acceptsCreditCards,
    RelatedPlaces? amex,
    RelatedPlaces? discover,
    RelatedPlaces? visa,
    RelatedPlaces? dinersClub,
    RelatedPlaces? masterCard,
    RelatedPlaces? unionPay,
  }) =>
      CreditCards(
        acceptsCreditCards: acceptsCreditCards ?? this.acceptsCreditCards,
        amex: amex ?? this.amex,
        discover: discover ?? this.discover,
        visa: visa ?? this.visa,
        dinersClub: dinersClub ?? this.dinersClub,
        masterCard: masterCard ?? this.masterCard,
        unionPay: unionPay ?? this.unionPay,
      );

  factory CreditCards.fromJson(Map<String, dynamic> json) => CreditCards(
        acceptsCreditCards: json["accepts_credit_cards"] == null
            ? null
            : RelatedPlaces.fromJson(json["accepts_credit_cards"]),
        amex:
            json["amex"] == null ? null : RelatedPlaces.fromJson(json["amex"]),
        discover: json["discover"] == null
            ? null
            : RelatedPlaces.fromJson(json["discover"]),
        visa:
            json["visa"] == null ? null : RelatedPlaces.fromJson(json["visa"]),
        dinersClub: json["diners_club"] == null
            ? null
            : RelatedPlaces.fromJson(json["diners_club"]),
        masterCard: json["master_card"] == null
            ? null
            : RelatedPlaces.fromJson(json["master_card"]),
        unionPay: json["union_pay"] == null
            ? null
            : RelatedPlaces.fromJson(json["union_pay"]),
      );

  Map<String, dynamic> toJson() => {
        "accepts_credit_cards": acceptsCreditCards?.toJson(),
        "amex": amex?.toJson(),
        "discover": discover?.toJson(),
        "visa": visa?.toJson(),
        "diners_club": dinersClub?.toJson(),
        "master_card": masterCard?.toJson(),
        "union_pay": unionPay?.toJson(),
      };
}

class DigitalWallet {
  RelatedPlaces? acceptsNfc;

  DigitalWallet({
    this.acceptsNfc,
  });

  DigitalWallet copyWith({
    RelatedPlaces? acceptsNfc,
  }) =>
      DigitalWallet(
        acceptsNfc: acceptsNfc ?? this.acceptsNfc,
      );

  factory DigitalWallet.fromJson(Map<String, dynamic> json) => DigitalWallet(
        acceptsNfc: json["accepts_nfc"] == null
            ? null
            : RelatedPlaces.fromJson(json["accepts_nfc"]),
      );

  Map<String, dynamic> toJson() => {
        "accepts_nfc": acceptsNfc?.toJson(),
      };
}

class Services {
  RelatedPlaces? delivery;
  RelatedPlaces? takeout;
  RelatedPlaces? driveThrough;
  DineIn? dineIn;

  Services({
    this.delivery,
    this.takeout,
    this.driveThrough,
    this.dineIn,
  });

  Services copyWith({
    RelatedPlaces? delivery,
    RelatedPlaces? takeout,
    RelatedPlaces? driveThrough,
    DineIn? dineIn,
  }) =>
      Services(
        delivery: delivery ?? this.delivery,
        takeout: takeout ?? this.takeout,
        driveThrough: driveThrough ?? this.driveThrough,
        dineIn: dineIn ?? this.dineIn,
      );

  factory Services.fromJson(Map<String, dynamic> json) => Services(
        delivery: json["delivery"] == null
            ? null
            : RelatedPlaces.fromJson(json["delivery"]),
        takeout: json["takeout"] == null
            ? null
            : RelatedPlaces.fromJson(json["takeout"]),
        driveThrough: json["drive_through"] == null
            ? null
            : RelatedPlaces.fromJson(json["drive_through"]),
        dineIn:
            json["dine_in"] == null ? null : DineIn.fromJson(json["dine_in"]),
      );

  Map<String, dynamic> toJson() => {
        "delivery": delivery?.toJson(),
        "takeout": takeout?.toJson(),
        "drive_through": driveThrough?.toJson(),
        "dine_in": dineIn?.toJson(),
      };
}

class DineIn {
  RelatedPlaces? reservations;
  RelatedPlaces? onlineReservations;
  RelatedPlaces? groupsOnlyReservations;
  RelatedPlaces? essentialReservations;

  DineIn({
    this.reservations,
    this.onlineReservations,
    this.groupsOnlyReservations,
    this.essentialReservations,
  });

  DineIn copyWith({
    RelatedPlaces? reservations,
    RelatedPlaces? onlineReservations,
    RelatedPlaces? groupsOnlyReservations,
    RelatedPlaces? essentialReservations,
  }) =>
      DineIn(
        reservations: reservations ?? this.reservations,
        onlineReservations: onlineReservations ?? this.onlineReservations,
        groupsOnlyReservations:
            groupsOnlyReservations ?? this.groupsOnlyReservations,
        essentialReservations:
            essentialReservations ?? this.essentialReservations,
      );

  factory DineIn.fromJson(Map<String, dynamic> json) => DineIn(
        reservations: json["reservations"] == null
            ? null
            : RelatedPlaces.fromJson(json["reservations"]),
        onlineReservations: json["online_reservations"] == null
            ? null
            : RelatedPlaces.fromJson(json["online_reservations"]),
        groupsOnlyReservations: json["groups_only_reservations"] == null
            ? null
            : RelatedPlaces.fromJson(json["groups_only_reservations"]),
        essentialReservations: json["essential_reservations"] == null
            ? null
            : RelatedPlaces.fromJson(json["essential_reservations"]),
      );

  Map<String, dynamic> toJson() => {
        "reservations": reservations?.toJson(),
        "online_reservations": onlineReservations?.toJson(),
        "groups_only_reservations": groupsOnlyReservations?.toJson(),
        "essential_reservations": essentialReservations?.toJson(),
      };
}

class Geocodes {
  DropOff? dropOff;
  DropOff? frontDoor;
  DropOff? main;
  DropOff? road;
  DropOff? roof;

  Geocodes({
    this.dropOff,
    this.frontDoor,
    this.main,
    this.road,
    this.roof,
  });

  Geocodes copyWith({
    DropOff? dropOff,
    DropOff? frontDoor,
    DropOff? main,
    DropOff? road,
    DropOff? roof,
  }) =>
      Geocodes(
        dropOff: dropOff ?? this.dropOff,
        frontDoor: frontDoor ?? this.frontDoor,
        main: main ?? this.main,
        road: road ?? this.road,
        roof: roof ?? this.roof,
      );

  factory Geocodes.fromJson(Map<String, dynamic> json) => Geocodes(
        dropOff: json["drop_off"] == null
            ? null
            : DropOff.fromJson(json["drop_off"]),
        frontDoor: json["front_door"] == null
            ? null
            : DropOff.fromJson(json["front_door"]),
        main: json["main"] == null ? null : DropOff.fromJson(json["main"]),
        road: json["road"] == null ? null : DropOff.fromJson(json["road"]),
        roof: json["roof"] == null ? null : DropOff.fromJson(json["roof"]),
      );

  Map<String, dynamic> toJson() => {
        "drop_off": dropOff?.toJson(),
        "front_door": frontDoor?.toJson(),
        "main": main?.toJson(),
        "road": road?.toJson(),
        "roof": roof?.toJson(),
      };
}

class Hours {
  String? display;
  bool? isLocalHoliday;
  bool? openNow;
  List<Ular>? regular;

  Hours({
    this.display,
    this.isLocalHoliday,
    this.openNow,
    this.regular,
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
        regular: json["regular"] == null
            ? []
            : List<Ular>.from(json["regular"]!.map((x) => Ular.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "display": display,
        "is_local_holiday": isLocalHoliday,
        "open_now": openNow,
        "regular": regular == null
            ? []
            : List<dynamic>.from(regular!.map((x) => x.toJson())),
      };
}

class Ular {
  String? close;
  int? day;
  String? open;

  Ular({
    this.close,
    this.day,
    this.open,
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

class Location {
  String? address;
  String? addressExtended;
  String? adminRegion;
  String? censusBlock;
  String? country;
  String? crossStreet;
  String? dma;
  String? formattedAddress;
  String? locality;
  List<String>? neighborhood;
  String? poBox;
  String? postTown;
  String? postcode;
  String? region;

  Location({
    this.address,
    this.addressExtended,
    this.adminRegion,
    this.censusBlock,
    this.country,
    this.crossStreet,
    this.dma,
    this.formattedAddress,
    this.locality,
    this.neighborhood,
    this.poBox,
    this.postTown,
    this.postcode,
    this.region,
  });

  Location copyWith({
    String? address,
    String? addressExtended,
    String? adminRegion,
    String? censusBlock,
    String? country,
    String? crossStreet,
    String? dma,
    String? formattedAddress,
    String? locality,
    List<String>? neighborhood,
    String? poBox,
    String? postTown,
    String? postcode,
    String? region,
  }) =>
      Location(
        address: address ?? this.address,
        addressExtended: addressExtended ?? this.addressExtended,
        adminRegion: adminRegion ?? this.adminRegion,
        censusBlock: censusBlock ?? this.censusBlock,
        country: country ?? this.country,
        crossStreet: crossStreet ?? this.crossStreet,
        dma: dma ?? this.dma,
        formattedAddress: formattedAddress ?? this.formattedAddress,
        locality: locality ?? this.locality,
        neighborhood: neighborhood ?? this.neighborhood,
        poBox: poBox ?? this.poBox,
        postTown: postTown ?? this.postTown,
        postcode: postcode ?? this.postcode,
        region: region ?? this.region,
      );

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        address: json["address"],
        addressExtended: json["address_extended"],
        adminRegion: json["admin_region"],
        censusBlock: json["census_block"],
        country: json["country"],
        crossStreet: json["cross_street"],
        dma: json["dma"],
        formattedAddress: json["formatted_address"],
        locality: json["locality"],
        neighborhood: json["neighborhood"] == null
            ? []
            : List<String>.from(json["neighborhood"]!.map((x) => x)),
        poBox: json["po_box"],
        postTown: json["post_town"],
        postcode: json["postcode"],
        region: json["region"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "address_extended": addressExtended,
        "admin_region": adminRegion,
        "census_block": censusBlock,
        "country": country,
        "cross_street": crossStreet,
        "dma": dma,
        "formatted_address": formattedAddress,
        "locality": locality,
        "neighborhood": neighborhood == null
            ? []
            : List<dynamic>.from(neighborhood!.map((x) => x)),
        "po_box": poBox,
        "post_town": postTown,
        "postcode": postcode,
        "region": region,
      };
}

class SocialMedia {
  String? facebookId;
  String? instagram;
  String? twitter;

  SocialMedia({
    this.facebookId,
    this.instagram,
    this.twitter,
  });

  SocialMedia copyWith({
    String? facebookId,
    String? instagram,
    String? twitter,
  }) =>
      SocialMedia(
        facebookId: facebookId ?? this.facebookId,
        instagram: instagram ?? this.instagram,
        twitter: twitter ?? this.twitter,
      );

  factory SocialMedia.fromJson(Map<String, dynamic> json) => SocialMedia(
        facebookId: json["facebook_id"],
        instagram: json["instagram"],
        twitter: json["twitter"],
      );

  Map<String, dynamic> toJson() => {
        "facebook_id": facebookId,
        "instagram": instagram,
        "twitter": twitter,
      };
}

class Stats {
  int? totalPhotos;
  int? totalRatings;
  int? totalTips;

  Stats({
    this.totalPhotos,
    this.totalRatings,
    this.totalTips,
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
