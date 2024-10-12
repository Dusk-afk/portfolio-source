import 'package:flutter/material.dart';
import 'package:portfolio/data/my_projects.dart';
import 'package:portfolio/presentation/pages/projects/project_card.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double width = constraints.maxWidth;

      // At any width: w
      // We want to have width of each card to be 300
      // So, we can have (w - 20) / 300 cards in a row
      int crossAxisCount = ((width - 20) / 300).floor();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          ...[
            for (int i = 0; i < myProjects.length; i += crossAxisCount)
              Row(
                children: [
                  for (int j = i; j < i + crossAxisCount; j++)
                    if (j < myProjects.length)
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: ProjectCard(myProjects[j]),
                        ),
                      )
                    else
                      const Spacer(),
                ],
              ),
          ]
        ],
      );
    });
  }
}
