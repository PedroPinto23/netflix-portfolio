import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_resume/data/experience_data.dart';

class FetchExperience {
  static Future<ExperiencesData> getData() async {
    try {
      const path = 'assets/data/experience_data.json';
      final response = await rootBundle.loadString(path);
      final data = await json.decode(response);
      final experiences = ExperiencesData.fromJson(data);
      return experiences;
    } catch (e) {
      debugPrint("Fetch Error: $e");
      return ExperiencesData();
    }
  }
}
