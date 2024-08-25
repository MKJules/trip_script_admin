import 'package:flutter/material.dart';

class Location with ChangeNotifier {
  final String id;
  final String name;
  final String city;
  final String region;
  final List<String> images;
  final double rating;
  final String category;
  final List<String> operatingDays;
  final DateTime openingTime;
  final DateTime closingTime;
  final String description;
  final String websiteLink;

  Location({
    required this.id,
    required this.name,
    required this.city,
    required this.region,
    required this.images,
    required this.rating,
    required this.category,
    required this.operatingDays,
    required this.openingTime,
    required this.closingTime,
    required this.description,
    required this.websiteLink,
  });
}
