import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/data/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 800,
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              "contact",
              style: TextStyle(
                fontFamily: "JetBrains",
                fontSize: 40,
                color: TColors.blue,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "I'm always looking for new opportunities to learn and grow. If you'd like to get in touch, feel free to contact me using the following platforms:",
              style: TextStyle(
                fontFamily: "JetBrains",
                fontSize: 16,
                color: TColors.white,
              ),
            ),
            SizedBox(height: 20),
            _Button(
              "https://raw.githubusercontent.com/simple-icons/simple-icons/develop/icons/gmail.svg",
              "piyushk1264@gmail.com",
              TColors.green,
              "mailto:piyushk1264@gmail.com",
            ),
            SizedBox(height: 10),
            _Button(
              "https://raw.githubusercontent.com/simple-icons/simple-icons/develop/icons/linkedin.svg",
              "@piyushk1264",
              TColors.pink,
              "https://www.linkedin.com/in/piyushk1264/",
            ),
          ],
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  final String url;
  final String text;
  final Color color;
  final String uri;

  const _Button(
    this.url,
    this.text,
    this.color,
    this.uri,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () async {
            Uri uri_ = Uri.parse(uri);
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
                url,
                colorFilter: const ColorFilter.mode(
                  TColors.white,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                text,
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
      return color;
    }

    return TColors.white;
  }
}
