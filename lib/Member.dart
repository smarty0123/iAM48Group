import 'dart:convert';

List<Member> memberFromJson(String str) =>
    List<Member>.from(json.decode(str).map((x) => Member.fromJson(x)));

String memberToJson(List<Member> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Member {
  Member({
    this.id,
    this.codeName,
    this.displayName,
    this.displayNameEn,
    this.subtitle,
    this.subtitleEn,
    this.profileImageUrl,
    this.coverImageUrl,
    this.caption,
    this.city,
    this.cityEn,
    this.country,
    this.countryEn,
    this.brand,
    this.hashtags,
    this.birthdate,
    this.graduatedAt,
  });

  int id;
  String codeName;
  String displayName;
  String displayNameEn;
  String subtitle;
  String subtitleEn;
  String profileImageUrl;
  String coverImageUrl;
  String caption;
  String city;
  String cityEn;
  Country country;
  Country countryEn;
  Brand brand;
  List<String> hashtags;
  DateTime birthdate;
  DateTime graduatedAt;

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        id: json["id"] == null ? null : json["id"],
        codeName: json["codeName"] == null ? null : json["codeName"],
        displayName: json["displayName"] == null ? null : json["displayName"],
        displayNameEn:
            json["displayNameEn"] == null ? null : json["displayNameEn"],
        subtitle: json["subtitle"] == null ? null : json["subtitle"],
        subtitleEn: json["subtitleEn"] == null ? null : json["subtitleEn"],
        profileImageUrl:
            json["profileImageUrl"] == null ? null : json["profileImageUrl"],
        coverImageUrl:
            json["coverImageUrl"] == null ? null : json["coverImageUrl"],
        caption: json["caption"] == null ? null : json["caption"],
        city: json["city"] == null ? null : json["city"],
        cityEn: json["cityEn"] == null ? null : json["cityEn"],
        country:
            json["country"] == null ? null : countryValues.map[json["country"]],
        countryEn: json["countryEn"] == null
            ? null
            : countryValues.map[json["countryEn"]],
        brand: json["brand"] == null ? null : brandValues.map[json["brand"]],
        hashtags: json["hashtags"] == null
            ? null
            : List<String>.from(json["hashtags"].map((x) => x)),
        birthdate: json["birthdate"] == null
            ? null
            : DateTime.parse(json["birthdate"]),
        graduatedAt: json["graduatedAt"] == null
            ? null
            : DateTime.parse(json["graduatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "codeName": codeName == null ? null : codeName,
        "displayName": displayName == null ? null : displayName,
        "displayNameEn": displayNameEn == null ? null : displayNameEn,
        "subtitle": subtitle == null ? null : subtitle,
        "subtitleEn": subtitleEn == null ? null : subtitleEn,
        "profileImageUrl": profileImageUrl == null ? null : profileImageUrl,
        "coverImageUrl": coverImageUrl == null ? null : coverImageUrl,
        "caption": caption == null ? null : caption,
        "city": city == null ? null : city,
        "cityEn": cityEn == null ? null : cityEn,
        "country": country == null ? null : countryValues.reverse[country],
        "countryEn":
            countryEn == null ? null : countryValues.reverse[countryEn],
        "brand": brand == null ? null : brandValues.reverse[brand],
        "hashtags": hashtags == null
            ? null
            : List<dynamic>.from(hashtags.map((x) => x)),
        "birthdate": birthdate == null
            ? null
            : "${birthdate.year.toString().padLeft(4, '0')}-${birthdate.month.toString().padLeft(2, '0')}-${birthdate.day.toString().padLeft(2, '0')}",
        "graduatedAt": graduatedAt == null
            ? null
            : "${graduatedAt.year.toString().padLeft(4, '0')}-${graduatedAt.month.toString().padLeft(2, '0')}-${graduatedAt.day.toString().padLeft(2, '0')}",
      };
}

enum Brand { CGM48, BNK48 }

final brandValues = EnumValues({"BNK48": Brand.BNK48, "CGM48": Brand.CGM48});

enum Country { TH, JP }

final countryValues = EnumValues({"JP": Country.JP, "TH": Country.TH});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
