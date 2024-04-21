import 'package:flutter/material.dart';

class Project {
  final String name;
  final String description;
  final String date;
  final String? users;
  final ImageProvider? image;
  final List<String> technologies;
  final List<ProjectDemo> demos;
  final List<ProjectLink> links;

  const Project({
    required this.name,
    required this.description,
    required this.date,
    this.users,
    this.image,
    this.technologies = const [],
    this.demos = const [],
    this.links = const [],
  });
}

class ProjectDemo {
  final String link;
  final String caption;

  const ProjectDemo({
    required this.link,
    required this.caption,
  });
}

class ProjectLink {
  final String svgLink;
  final String link;
  final String title;

  const ProjectLink({
    required this.svgLink,
    required this.link,
    required this.title,
  });
}
