import 'package:flutter/material.dart';
import 'package:portfolio/data/projects/anime_explore.dart';
import 'package:portfolio/data/projects/fitwiz.dart';
import 'package:portfolio/data/projects/imdb_clone.dart';
import 'package:portfolio/data/projects/spotify_clone.dart';
import 'package:portfolio/models/project/project.dart';

const List<Project> myProjects = [
  Project(
    name: "Funnel",
    description:
        "An accounting application to simplify the process of communication between accountants and business owners",
    date: "2022 - Present",
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
            "https://raw.githubusercontent.com/simple-icons/simple-icons/develop/icons/googlechrome.svg",
        link: "https://funnelnetwork.in",
        title: "funnelnetwork.in",
      ),
    ],
  ),
  Project(
    name: "Fitwiz",
    description:
        "Fitwiz hosts events which users can participate in, fostering a community of fitness enthusiasts and providing extra motivation to achieve their goals.",
    mdDescription: Fitwiz.mdDescription,
    date: "Oct 2024",
    image: AssetImage("assets/fitwiz.png"),
    technologies: [
      "Flutter",
      "Dart",
      "Flask",
      "Python",
      "MySQL",
      "AWS",
      "Docker"
    ],
    links: [
      ProjectLink(
        svgLink:
            "https://raw.githubusercontent.com/simple-icons/simple-icons/develop/icons/googlechrome.svg",
        link: "https://fit-wiz.com",
        title: "fit-wiz.com",
      ),
      ProjectLink(
        svgLink:
            "https://raw.githubusercontent.com/simple-icons/simple-icons/develop/icons/googleplay.svg",
        link: "https://play.google.com/store/apps/details?id=com.fit_wiz",
        title: "Fitwiz",
      ),
      ProjectLink(
        svgLink:
            "https://raw.githubusercontent.com/simple-icons/simple-icons/develop/icons/github.svg",
        link: "https://github.com/Dusk-afk/fitwiz",
        title: "GitHub",
      ),
    ],
  ),
  Project(
    name: "Anime Explore",
    description:
        "Anime Explore is a versatile application designed for effortlessly searching, exploring, and enjoying your favorite anime titles.",
    mdDescription: AnimeExplore.mdDescription,
    date: "May 2024",
    image: AssetImage("assets/anime_explore.webp"),
    technologies: ["Flutter", "Dart", "Jikan API", "BLoC"],
    links: [
      ProjectLink(
        svgLink:
            "https://raw.githubusercontent.com/simple-icons/simple-icons/develop/icons/github.svg",
        link: "https://github.com/Dusk-afk/anime-explore",
        title: "GitHub",
      ),
    ],
  ),
  Project(
    name: "Spotify Clone",
    description:
        "A Spotify clone which features user authentication, music streaming, playlists, and subscription management.",
    mdDescription: SpotifyClone.mdDescription,
    date: "June 2024",
    image: AssetImage("assets/spotify.jpg"),
    technologies: [
      "NextJS",
      "Tailwind CSS",
      "Supabase",
      "PostgreSQL",
      "Stripe"
    ],
    links: [
      ProjectLink(
        svgLink:
            "https://raw.githubusercontent.com/simple-icons/simple-icons/develop/icons/github.svg",
        link: "https://github.com/Dusk-afk/spotify-clone",
        title: "GitHub",
      ),
      ProjectLink(
        svgLink:
            "https://raw.githubusercontent.com/simple-icons/simple-icons/develop/icons/googlechrome.svg",
        link: "https://spotify-clone-lac-tau.vercel.app/",
        title: "Deployed Web App",
      ),
    ],
  ),
  Project(
    name: "House Price Predictor",
    description:
        "Interactive dashboard for California Housing Prices prediction using Streamlit and RandomForest.",
    mdDescription: '''
This project demonstrates the use of the California Housing Prices dataset to build a model that predicts the median house value based on various features.

The dataset utilized is the [California Housing Prices](https://www.kaggle.com/datasets/camnugent/california-housing-prices) from Kaggle. The predictive model employed is a Random Forest Regressor.
                  ''',
    date: "June 2024",
    image: AssetImage("assets/house_price.jpg"),
    technologies: [
      "Python",
      "Pandas",
      "Numpy",
      "Matplotlib",
      "Seaborn",
      "Scikit-learn",
      "Streamlit"
    ],
    links: [
      ProjectLink(
        svgLink:
            "https://raw.githubusercontent.com/simple-icons/simple-icons/develop/icons/github.svg",
        link: "https://github.com/Dusk-afk/California-House-Price-Predictor",
        title: "GitHub",
      ),
      // Deployed
      ProjectLink(
        svgLink:
            "https://raw.githubusercontent.com/simple-icons/simple-icons/develop/icons/googlechrome.svg",
        link: "https://california-house-prices-predictor.streamlit.app/",
        title: "Deployed Web App",
      ),
    ],
  ),
  Project(
    name: "IMDb Clone",
    description:
        "A Spotify clone which features user authentication, music streaming, playlists, and subscription management.",
    mdDescription: ImdbClone.mdDescription,
    date: "June 2024",
    image: AssetImage("assets/imdb.png"),
    technologies: [
      "NextJS",
      "Tailwind CSS",
      "TheMovieDB API",
    ],
    links: [
      ProjectLink(
        svgLink:
            "https://raw.githubusercontent.com/simple-icons/simple-icons/develop/icons/github.svg",
        link: "https://github.com/Dusk-afk/imdb-clone",
        title: "GitHub",
      ),
      ProjectLink(
        svgLink:
            "https://raw.githubusercontent.com/simple-icons/simple-icons/develop/icons/googlechrome.svg",
        link: "https://imdb-clone-xi-ivory.vercel.app/",
        title: "Deployed Web App",
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
            "https://raw.githubusercontent.com/simple-icons/simple-icons/develop/icons/googlechrome.svg",
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
            "https://raw.githubusercontent.com/simple-icons/simple-icons/develop/icons/googlechrome.svg",
        link: "https://dusk-afk.github.io/macos_dock/",
        title: "Deployed Web App",
      ),
    ],
  ),
  Project(
    name: "TODO List App",
    description:
        "A very basic and lightweight todo list app built using Next JS",
    date: "May 2024",
    image: AssetImage("assets/todo.png"),
    technologies: [
      "NextJS",
      "Tailwind CSS",
    ],
    links: [
      ProjectLink(
        svgLink:
            "https://raw.githubusercontent.com/simple-icons/simple-icons/develop/icons/github.svg",
        link: "https://github.com/Dusk-afk/todo-list-app",
        title: "GitHub",
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
