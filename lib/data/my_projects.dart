import 'package:flutter/material.dart';
import 'package:portfolio/models/project/project.dart';

const List<Project> myProjects = [
  Project(
    name: "Funnel",
    description:
        "An accounting application to simplify the process of communication between accountants and business owners",
    date: "2024",
    image: AssetImage("assets/funnel.jpg"),
    technologies: ["Flutter", "Dart", "Flask", "Python", "MySQL", "AWS"],
    demos: [
      ProjectDemo(
        link:
            "https://github.com/Dusk-afk/Dusk-afk/assets/83510709/6749acf9-8ce2-48e4-ace3-18c64c9dc8f8",
        caption:
            "Business owners can very easily scan their invoices and upload them to their accountant's dashboard. Accountants can then process the invoices within the application itself.",
      ),
    ],
    links: [
      ProjectLink(
        svgLink:
            "https://raw.githubusercontent.com/simple-icons/simple-icons/develop/icons/internetexplorer.svg",
        link: "https://funnelnetwork.in",
        title: "funnelnetwork.in",
      ),
    ],
  ),
  Project(
    name: "Kartvahan",
    description:
        "One stop application for all the stakeholders for reflective tape solution by transport department Karnataka",
    date: "2022",
    users: "1K",
    image: NetworkImage(
        "https://play-lh.googleusercontent.com/TpEPmG8KJLvjB74BNSFYohWfAXtsyZ4j87rvveeEfg5_bK_ih6T2VYDrO0A383Jynkw"),
    technologies: [
      "Flutter",
      "Dart",
      "Express.js",
      "Node.js",
      "PostgreSQL",
      "AWS"
    ],
    links: [
      ProjectLink(
        svgLink:
            "https://raw.githubusercontent.com/simple-icons/simple-icons/develop/icons/googleplay.svg",
        link: "https://play.google.com/store/apps/details?id=com.kartvahan",
        title: "Kartvahan",
      )
    ],
  ),
  Project(
    name: "Weather App",
    description:
        "A weather application that shows the current weather at the user's location",
    date: "Jan 2024",
    image: AssetImage("assets/weather.jpg"),
    technologies: ["Flutter", "Dart", "OpenWeatherMap API", "BLoC"],
    links: [
      ProjectLink(
        svgLink:
            "https://raw.githubusercontent.com/simple-icons/simple-icons/develop/icons/github.svg",
        link: "https://github.com/Dusk-afk/weather-app",
        title: "GitHub",
      ),
    ],
  ),
  Project(
    name: "Polyrhythm",
    description:
        "A meditation application that helps users relax and focus by playing polyrhythmic sounds",
    date: "Dec 2023",
    image: AssetImage("assets/polyrhythm.jpg"),
    technologies: ["Flutter", "Dart", "Canvas Painting", "WebAudio"],
    links: [
      ProjectLink(
        svgLink:
            "https://raw.githubusercontent.com/simple-icons/simple-icons/develop/icons/github.svg",
        link: "https://github.com/Dusk-afk/polyrythm-web",
        title: "GitHub",
      ),
      ProjectLink(
        svgLink:
            "https://raw.githubusercontent.com/simple-icons/simple-icons/develop/icons/internetexplorer.svg",
        link: "https://dusk-afk.github.io/polyrythm-web/",
        title: "Deployed Web App",
      ),
    ],
  ),
  Project(
    name: "MacOS Dock",
    description: "A MacOS Dock clone made with Flutter",
    date: "Sept 2023",
    image: AssetImage("assets/dock.png"),
    technologies: ["Flutter", "Dart"],
    demos: [
      ProjectDemo(
        link:
            "https://github.com/Dusk-afk/Dusk-afk/assets/83510709/631cfc1f-69b8-47a0-bd18-1e6538c04c06",
        caption: "",
      )
    ],
    links: [
      ProjectLink(
        svgLink:
            "https://raw.githubusercontent.com/simple-icons/simple-icons/develop/icons/github.svg",
        link: "https://github.com/Dusk-afk/macos_dock",
        title: "GitHub",
      ),
      ProjectLink(
        svgLink:
            "https://raw.githubusercontent.com/simple-icons/simple-icons/develop/icons/internetexplorer.svg",
        link: "https://dusk-afk.github.io/macos_dock/",
        title: "Deployed Web App",
      ),
    ],
  ),
  Project(
    name: "Remove.bg API Wrapper",
    description: "A desktop application to remove background from images",
    date: "2022",
    image: AssetImage("assets/removebg.png"),
    technologies: ["PyQt5", "Python", "Remove.bg API"],
    links: [
      ProjectLink(
        svgLink:
            "https://raw.githubusercontent.com/simple-icons/simple-icons/develop/icons/github.svg",
        link: "https://github.com/Dusk-afk/RemoveBG",
        title: "GitHub",
      ),
    ],
  )
];
