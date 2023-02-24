class Experiences {
  List<Experience>? experiences;
  Experiences({this.experiences});

  factory Experiences.fromJson(Map<String, dynamic> json) => Experiences(
        experiences: json["experiences"],
      );

  Map<String, dynamic> get toMap => {"experiences": experiences};
}

class Experience {
  String? title;
  String? image;
  List<Description>? description;
  Experience({this.title, this.image, this.description});

  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
        title: json["title"],
        image: json["image"],
        description: json["description"],
      );

  Map<String, dynamic> get toMap => {
        "title": title,
        "image": image,
        "description": description,
      };
}

class Description {
  String? item;
  Description({this.item});
  factory Description.fromJson(Map<String, dynamic> json) => Description(
        item: json["item"],
      );

  Map<String, dynamic> get toMap => {"item": item};
}
