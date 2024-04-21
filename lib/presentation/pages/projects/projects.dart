import 'package:flutter/material.dart';
import 'package:portfolio/data/my_projects.dart';
import 'package:portfolio/presentation/pages/projects/project_card.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 20),
        Wrap(
          children: myProjects.map((e) => ProjectCard(e)).toList(),
        ),
      ],
    );
  }
}
