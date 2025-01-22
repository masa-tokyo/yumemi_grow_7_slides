import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final slides = [
      FlutterDeckSlide.title(title: 'wasmでFlutterをデプロイしてみる'),
      // TODO(masaki): self introduction
      FlutterDeckSlide.title(title: '自己紹介'),
      FlutterDeckSlide.bigFact(
        title: 'wasmのパフォーマンス良くなってきているらしい by FlutterInProduction',
      ),
      // TODO(masaki): add image of FlutterInProduction
      // https://www.youtube.com/live/AEXIrThTgb0?si=BmTLG4feOAK6FC4M&t=1065
      FlutterDeckSlide.bigFact(
        title: 'wasm良さそう',
      ),
      FlutterDeckSlide.bigFact(
        title: 'htmlレンダラー非推奨になった since 3.27',
      ),
      // TODO(masaki): add screenshot for html deprecation
      // The HTML Renderer is deprecated. Do not use "--web-renderer=html".
      // See: https://docs.flutter.dev/to/web-html-renderer-deprecation
      FlutterDeckSlide.bigFact(
        title: 'wasmやんなきゃ',
      ),
      FlutterDeckSlide.title(
        title: 'wasmとは',
      ),
      // TODO(masaki): add explanation
      // TODO(masaki): introduce the FlutterKaigi session
      FlutterDeckSlide.title(
        title: '手順',
      ),
      // TODO(masaki): describe how to deploy
      // TODO(masaki): show expensive behaviors
      BlankSlide(
        title: 'Expensive behaviors',
        route: '/expensive-behaviors',
        builder: (context) {
          return Center(
            child: Text(
              'Expensive behaviors',
            ),
          );
        },
      ),
      // TODO(masaki): show how different, if possible

      FlutterDeckSlide.title(
        title: 'Thank you! 👋',
      ),
    ];

    return FlutterDeckApp(
      slides: List.generate(8, (index) {
        return slides[index];
      }),

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
  BlankSlide({
    super.key,
    required this.route,
    required this.title,
    required this.builder,
  }) : super(
          configuration: FlutterDeckSlideConfiguration(
            route: route,
            header: FlutterDeckHeaderConfiguration(
              title: title,
            ),
          ),
        );

  final String title;

  final String route;

  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: builder,
    );
  }
}
