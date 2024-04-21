import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/data/colors.dart';
import 'package:portfolio/models/project/project.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

class ProjectFull extends StatelessWidget {
  final Project project;
  const ProjectFull(this.project, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 800,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                image: project.image!,
                fit: BoxFit.cover,
                height: 200,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "// ${project.name}",
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: TColors.pink,
              ),
            ),
            if (project.users?.isNotEmpty ?? false) ...[
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "${project.users}",
                      style: const TextStyle(
                        fontSize: 16,
                        color: TColors.green,
                      ),
                    ),
                    const TextSpan(
                      text: " users are using the app currently",
                      style: TextStyle(
                        fontSize: 16,
                        color: TColors.white,
                      ),
                    ),
                  ],
                ),
              )
            ],
            const SizedBox(height: 20),
            Text(
              project.description,
              style: const TextStyle(
                fontSize: 16,
                color: TColors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "tech stack",
              style: TextStyle(
                fontSize: 24,
                color: TColors.pink,
              ),
            ),
            const SizedBox(height: 20),
            ...project.technologies.map((tech) => _bulletPoint(tech)),
            const SizedBox(height: 20),
            if (project.demos.isNotEmpty) ...[
              const Text(
                "demos",
                style: TextStyle(
                  fontSize: 24,
                  color: TColors.pink,
                ),
              ),
              const SizedBox(height: 20),
              ...project.demos.map((demo) => _Demo(demo))
            ],
            if (project.links.isNotEmpty) ...[
              const SizedBox(height: 20),
              const Text(
                "links",
                style: TextStyle(
                  fontSize: 24,
                  color: TColors.pink,
                ),
              ),
              const SizedBox(height: 20),
              ...project.links.map((link) => _Button(link)),
            ],
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _bulletPoint(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "•",
          style: TextStyle(
            fontSize: 16,
            color: TColors.blue,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              color: TColors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class _Demo extends StatefulWidget {
  final ProjectDemo demo;
  const _Demo(this.demo, {super.key});

  @override
  State<_Demo> createState() => __DemoState();
}

class __DemoState extends State<_Demo> {
  late final VideoPlayerController _controller;
  bool _hovering = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.demo.link))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _controller.value.isInitialized
            ? MouseRegion(
                onEnter: (_) {
                  setState(() {
                    _hovering = true;
                  });
                },
                onExit: (_) {
                  setState(() {
                    _hovering = false;
                  });
                },
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    if (_controller.value.isPlaying) {
                      _controller.pause();
                    } else {
                      _controller.play();
                    }
                    setState(() {});
                  },
                  child: SizedBox(
                    height: 500,
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: Stack(
                        children: [
                          VideoPlayer(_controller),
                          if (_hovering)
                            Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: TColors.black.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Icon(
                                  _controller.value.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  color: TColors.white,
                                  size: 50,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
        const SizedBox(height: 10),
        Text(
          widget.demo.caption,
          style: const TextStyle(
            fontSize: 16,
            color: TColors.white,
          ),
        ),
      ],
    );
  }
}

class _Button extends StatelessWidget {
  final ProjectLink projectLink;

  const _Button(this.projectLink);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () async {
            Uri uri_ = Uri.parse(projectLink.link);
            if (await canLaunchUrl(uri_)) {
              launchUrl(uri_);
            }
          },
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(TColors.transparent),
            foregroundColor:
                WidgetStateProperty.resolveWith(getForegroundColor),
          ),
          child: Row(
            children: [
              SvgPicture.network(
                projectLink.svgLink,
                colorFilter: const ColorFilter.mode(
                  TColors.white,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                projectLink.title,
                style: const TextStyle(
                  fontFamily: "JetBrains",
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Color getForegroundColor(Set<WidgetState> states) {
    if (states.contains(WidgetState.hovered)) {
      return TColors.blue;
    }

    return TColors.white;
  }
}
