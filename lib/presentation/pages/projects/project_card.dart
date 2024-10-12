import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/window/window_bloc.dart';
import 'package:portfolio/data/colors.dart';
import 'package:portfolio/models/project/project.dart';
import 'package:portfolio/models/window/window.dart';
import 'package:portfolio/presentation/pages/projects/project_full.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  const ProjectCard(this.project, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.read<WindowBloc>().add(
              AddWindow(Window(
                title: project.name,
                child: ProjectFull(project),
              )),
            );
      },
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        padding: WidgetStateProperty.all(const EdgeInsets.all(20)),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: project.image != null
                ? Image(
                    image: project.image!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200,
                  )
                : Image.network(
                    "https://via.placeholder.com/300x200",
                    fit: BoxFit.cover,
                    width: 300,
                    height: 200,
                  ),
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  project.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: TColors.green,
                  ),
                ),
              ),
              Text(
                project.date,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: TColors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            project.description,
            style: const TextStyle(
              fontSize: 14,
              color: TColors.white,
            ),
          )
        ],
      ),
    );
  }
}
