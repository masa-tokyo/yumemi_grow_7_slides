import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:yumemi_grow_7_slides/slides/big_title_slide.dart';
import 'package:yumemi_grow_7_slides/slides/blank_slide.dart';
import 'package:yumemi_grow_7_slides/slides/title_slide.dart';

void main() {
  const isRunningWithWasm = bool.fromEnvironment('dart.tool.dart2wasm');
  // TODO(masaki): consider showing this on production or not
  print('isRunningWithWasm: $isRunningWithWasm');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final slides = [
      TitleSlide(route: '/title', title: 'wasmでFlutterをデプロイしてみる'),
      // TODO(masaki): self introduction
      TitleSlide(route: '/self-intro', title: '自己紹介'),
      TitleSlide(
          route: '/fact-1',
          title: 'wasmのパフォーマンス良くなってきているらしい by FlutterInProduction'),
      // TODO(masaki): add image of FlutterInProduction & check the performance in details
      // https://www.youtube.com/live/AEXIrThTgb0?si=BmTLG4feOAK6FC4M&t=1065
      BigFactSlide(route: '/comment-1', title: 'wasm良さそう'),
      TitleSlide(route: '/fact-2', title: 'htmlレンダラー非推奨になった since 3.27'),
      BigFactSlide(route: '/fact-2/1', title: '公式のページにももうhtmlは無い'),
      // https://docs.flutter.dev/platform-integration/web/renderers
      // TODO(masaki): add screenshot for html deprecation
      // The HTML Renderer is deprecated. Do not use "--web-renderer=html".
      // See: https://docs.flutter.dev/to/web-html-renderer-deprecation
      BigFactSlide(route: '/comment-2', title: 'wasmやんなきゃ'),
      TitleSlide(route: '/definition', title: 'wasmとは'),
      // stable from 3.22
      // at least 3.24 is recommended
      // https://docs.flutter.dev/platform-integration/web/wasm#switch-to-the-latest-version-of-flutter
      BigFactSlide(route: '/definition/1', title: 'Web Assembly の略'),
      BigFactSlide(
          route: '/definition/2', title: 'バイナリ形式で吐き出されるプログラミング言語のコンパイル先'),
      // TODO(masaki): (nice-to-have) compare wasm with html with some images
      // TODO(masaki): check available browsers
      // https://bema.jp/articles/20241025/#:~:text=Copy-,Skwasm%EF%BC%88Wasm%EF%BC%89,-Skwasm%EF%BC%88Wasm%EF%BC%89%E3%83%AC%E3%83%B3
      // https://docs.flutter.dev/platform-integration/web/wasm#learn-more-about-browser-compatibility
      BigFactSlide(route: '/definition/3', title: 'html：テキスト'),
      // TODO(masaki): introduce the FlutterKaigi session
      TitleSlide(route: '/implementation', title: '手順'),
      BigFactSlide(
          route: '/implementation-1',
          title: '吐き出し自体は、flutter build web --wasm`で出来る'),
      // https://www.notion.so/masakisato/prep-for-Yumemi-grow-LT-168a4128da0f8019bb18e9c2770ca88e
      // TODO(masaki): explain about header
      TitleSlide(route: '/implementation-2', title: 'header'),
      // TODO(masaki): (nice-to-have) explain how to check
      // 1. bool.fromEnvironment('dart.tool.dart2wasm')
      // 2. local web server
      // https://docs.flutter.dev/deployment/web#building-the-app-for-release
      // TODO(masaki): show expensive behaviors(maybe scroller)
      // show something like this debug view:
      // https://youtu.be/YvWAAlLHg5Q?si=fp3BJcVbOZrZkEz5&t=1546
      // TODO(masaki): (nice-to-have) add build arguments(--html, --wasm, etc) on .idea runConfigurations
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
      // TODO(masaki): check how to deal with problems that html renderer was solving
      //  1. showing お豆腐 on loading
      // https://zenn.dev/tsuruo/articles/773a5a7ca14924#1.-canvaskit%E3%81%AE%E3%83%AC%E3%83%B3%E3%83%80%E3%83%AA%E3%83%B3%E3%82%B0%E6%96%B9%E6%B3%95%E3%81%A0%E3%81%A8%E3%80%81%E8%AA%AD%E3%81%BF%E8%BE%BC%E3%81%BF%E6%99%82%E3%81%AB%E6%97%A5%E6%9C%AC%E8%AA%9E%E3%81%8C%E8%B1%86%E8%85%90%EF%BC%88%E2%96%A1%EF%BC%89%E3%81%AB%E3%81%AA%E3%82%8B
      // 2. CORS issue for images(with ExtendedImage, image not showing) <- need to clarify why you need to cache on web
      // https://zenn.dev/tsuruo/articles/773a5a7ca14924#1.-canvaskit%E3%81%AE%E3%83%AC%E3%83%B3%E3%83%80%E3%83%AA%E3%83%B3%E3%82%B0%E6%96%B9%E6%B3%95%E3%81%A0%E3%81%A8%E3%80%81%E8%AA%AD%E3%81%BF%E8%BE%BC%E3%81%BF%E6%99%82%E3%81%AB%E6%97%A5%E6%9C%AC%E8%AA%9E%E3%81%8C%E8%B1%86%E8%85%90%EF%BC%88%E2%96%A1%EF%BC%89%E3%81%AB%E3%81%AA%E3%82%8B
      // https://docs.flutter.dev/platform-integration/web/web-images
      // TODO(masaki): (nice-to-have) explain how to clear previous cache
      // https://zenn.dev/flutteruniv_dev/articles/03d5e212c3b51e
      // TODO(masaki): (nice-to-have) add some FAQ
      // https://docs.flutter.dev/platform-integration/web/faq
      TitleSlide(route: '/end', title: 'Thank you! 👋'),
    ];

    return FlutterDeckApp(
      slides: List.generate(slides.length, (index) {
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
