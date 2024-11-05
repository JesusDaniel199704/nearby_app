class Location {
  String address;
  String addressExtended;
  String adminRegion;
  String censusBlock;
  String country;
  String crossStreet;
  String dma;
  String formattedAddress;
  String locality;
  List<String> neighborhood;
  String poBox;
  String postTown;
  String postcode;
  String region;

  Location({
    required this.address,
    required this.addressExtended,
    required this.adminRegion,
    required this.censusBlock,
    required this.country,
    required this.crossStreet,
    required this.dma,
    required this.formattedAddress,
    required this.locality,
    required this.neighborhood,
    required this.poBox,
    required this.postTown,
    required this.postcode,
    required this.region,
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
        neighborhood: List<String>.from(json["neighborhood"].map((x) => x)),
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
        "neighborhood": List<dynamic>.from(neighborhood.map((x) => x)),
        "po_box": poBox,
        "post_town": postTown,
        "postcode": postcode,
        "region": region,
      };
}
