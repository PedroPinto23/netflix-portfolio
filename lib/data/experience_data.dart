class ExperiencesData {
  List<Experience>? experiences;
  ExperiencesData({this.experiences});

  factory ExperiencesData.fromJson(Map<String, dynamic> json) =>
      ExperiencesData(
        experiences: List.from(json["experiences"])
            .map((e) => Experience.fromJson(e))
            .toList(),
      );

  Map<String, dynamic> get toMap => {"experiences": experiences};
}

class Experience {
  String? company;
  String? role;
  String? duration;
  String? image;
  String? color;
  List<Description>? description;
  Experience({
    this.company,
    this.role,
    this.duration,
    this.image,
    this.color,
    this.description,
  });

  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
        company: json["company"],
        role: json["role"],
        duration: json["duration"],
        image: json["image"],
        color: json["color"],
        description: List.from(json["description"])
            .map((e) => Description.fromJson(e))
            .toList(),
      );

  Map<String, dynamic> get toMap => {
        "company": company,
        "role": role,
        "duration": duration,
        "image": image,
        "color": color,
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
