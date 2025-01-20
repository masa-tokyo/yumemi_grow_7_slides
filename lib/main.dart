import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterDeckApp(
      slides: [
        FlutterDeckSlide.title(title: 'Sample Title'),
        FlutterDeckSlide.bigFact(
          title: 'Big Fact',
        ),
        BlankSlide(
          title: 'aaa',
          route: '/blank-slide',
        ),
        FlutterDeckSlide.blank(
          configuration: FlutterDeckSlideConfiguration(
            route: '/expensive-behaviors',
            // the header title is not shown
            title: 'Expensive behaviors',
          ),
          builder: (context) {
            return Center(
              child: Text(
                'Expensive behaviors',
              ),
            );
          },
        ).withSlideConfiguration(
          FlutterDeckSlideConfiguration(
              // the title is not shown
              route: '/expensive-behaviors',
              title: 'Expensive behaviors'),
        ),
        FlutterDeckSlide.title(
          backgroundBuilder: (context) => Container(
            color: Colors.blue,
          ),
          configuration: const FlutterDeckSlideConfiguration(
            route: '/end',
            // this title is not shown
            title: 'Thank you!',
            footer: FlutterDeckFooterConfiguration(showFooter: false),
          ),
          title: 'Thank you! 👋',
        ),
      ],
      configuration: FlutterDeckConfiguration(
          // possible to show the same header on all slides
          // header:
          //     FlutterDeckHeaderConfiguration(showHeader: true, title: 'Sample'),
          // when turned off, the header should be specified by subclassing FlutterDeckSlideWidget
          // header: const FlutterDeckHeaderConfiguration(
          //   showHeader: false,
          // ),
          ),
      // speakerInfo: FlutterDeckSpeakerInfo(
      //     name: 'Masaki Sato',
      //     description: 'Flutter Freelance',
      //     socialHandle: '@masa-tokyo',
      //     imagePath: 'not-configured-yet'),
    );
  }
}

class BlankSlide extends FlutterDeckSlideWidget {
  BlankSlide({super.key, required this.route, required this.title})
      : super(
          configuration: FlutterDeckSlideConfiguration(
            route: '/blank-slide',
            header: FlutterDeckHeaderConfiguration(
              title: title,
            ),
          ),
        );

  final String title;

  final String route;

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => const Text('Blank Slide'),
    );
  }
}
