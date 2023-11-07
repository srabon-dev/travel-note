import 'dart:typed_data';


class Travel{

  final int? id;
  final String title;
  final String city;
  final String country;
  final String startDate;
  final String endDate;
  final Uint8List? image;
  final String description;
  final String note;
  final String? stampUrl;
  final Uint8List? stamp;

  Travel({
    this.id,
    required this.title,
    required this.city,
    required this.country,
    required this.description,
    required this.note,
    required this.startDate,
    required this.endDate,
    required this.image,
    required this.stampUrl,
    required this.stamp,
  });

  factory Travel.formMap(Map<String, dynamic> json) => Travel(
      id: json['id'] as int,
      title: json['title'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
      image: json['image'],
      note: json['note'] as String,
      description: json['description'] as String,
      stampUrl: json['stampUrl'] as String,
      stamp: json['stamp']
  );

  Map<String, dynamic> toMap() {
    var map = {
      'title': title,
      "city" : city,
      "country" : country,
      "description" : description,
      "note" : note,
      "startDate" : startDate,
      "endDate" : endDate,
      "image" : image,
      "stampUrl" : stampUrl,
      "stamp" : stamp
    };

    if (id != null) {
      map["id"] = id;
      map["image"] = image;
      map["stamp"] = stamp;
    }
    return map;
  }

  @override
  String toString() {
    return 'Travel{id: $id, title: $title, city: $city, country: $country, startDate: $startDate, endDate: $endDate, image: $image, description: $description, note: $note, stampUrl:$stampUrl, stamp: $stamp}';
  }
}



/*class NoteFields {
  static List<String> values = [
    id,
    title,
    city,
    country,
    startDate,
    endDate,
    image,
    note,
    comments,
    passport
  ];

  static const String id = "_id";
  static const String title = "title";
  static const String city = "city";
  static const String country = "country";
  static const String startDate = "startDate";
  static const String endDate = "endDate";
  static const String image = "image";
  static const String note = "note";
  static const String comments = "comments";
  static const String passport = "passport";
}

const String tableNote = "travel";*/

/*class AddTripModel {
  final int? id;
  final String title;
  final String city;
  final String country;
  final String startDate;
  final String endDate;
  final Uint8List image;
  final String note;
  final String comments;
  final Uint8List passport;

  AddTripModel(
      {this.id,
      required this.title,
      required this.city,
      required this.country,
      required this.startDate,
      required this.endDate,
      required this.image,
      required this.note,
      required this.comments,
      required this.passport});

  AddTripModel copy({
    int? id,
    String? title,
    String? city,
    String? country,
    String? startDate,
    String? endDate,
    Uint8List? image,
    String? note,
    String? comments,
    Uint8List? passport,
  }) =>
      AddTripModel(
          id: id ?? this.id,
          title: title ?? this.title,
          city: city ?? this.city,
          country: country ?? this.country,
          startDate: startDate ?? this.startDate,
          endDate: endDate ?? this.endDate,
          image: image ?? this.image,
          note: note ?? this.note,
          comments: comments ?? this.comments,
          passport: passport ?? this.passport
      );

  static AddTripModel formJson(Map<String, dynamic> json) => AddTripModel(
      id: json[NoteFields.id] as int,
      title: json[NoteFields.title] as String,
      city: json[NoteFields.city] as String,
      country: json[NoteFields.country] as String,
      startDate: json[NoteFields.startDate] as String,
      endDate: json[NoteFields.endDate] as String,
      image: json[NoteFields.image],
      note: json[NoteFields.note] as String,
      comments: json[NoteFields.comments] as String,
      passport: json[NoteFields.image]
  );

  Map<String, dynamic> toJson() => {
    NoteFields.id: id,
    NoteFields.title: title,
    NoteFields.city: city,
    NoteFields.country: country,
    NoteFields.startDate: startDate,
    NoteFields.endDate: startDate,
    NoteFields.image: image,
    NoteFields.note: note,
    NoteFields.comments: comments,
    NoteFields.passport: passport
  };
}*/
