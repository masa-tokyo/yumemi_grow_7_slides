import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yumemi_grow_7_slides/slides/big_title_slide.dart';
import 'package:yumemi_grow_7_slides/slides/blank_slide.dart';
import 'package:yumemi_grow_7_slides/slides/code_highlighting_slide.dart';
import 'package:yumemi_grow_7_slides/slides/image_slide.dart';
import 'package:yumemi_grow_7_slides/slides/split_slide.dart';
import 'package:yumemi_grow_7_slides/slides/title_slide.dart';

final _isHtml = !isSkiaWeb;

void main() {
  // TODO(masaki): consider showing this on production or not
  print('kIsWasm: $kIsWasm');
  print('isSkwasm: $isSkwasm');
  print('isCanvasKit : $isCanvasKit');
  print('isSkiaWeb: $isSkiaWeb');
  print('isHtml: $_isHtml');

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final body1 = TextStyle(fontSize: 32);
    final body2 = TextStyle(fontSize: 16);
    final slides = [
      BlankSlide(
          route: '/config',
          title: 'config',
          builder: (_) {
            return Center(
              child: Column(
                children: [
                  const Text('kIsWasm: $kIsWasm'),
                  Text('isSkwasm: $isSkwasm'),
                  Text('isCanvasKit : $isCanvasKit'),
                  Text('isSkiaWeb: $isSkiaWeb'),
                  Text('version: 10'),
                  CachedNetworkImage(
                    imageUrl: _headerImageUrl,
                    imageRenderMethodForWeb: _isHtml
                        ? ImageRenderMethodForWeb.HtmlImage
                        : ImageRenderMethodForWeb.HttpGet,
                    errorWidget: (_, __, ___) => const Text('error1'),
                  ),
                  CachedNetworkImage(
                    imageUrl: 'https://placehold.jp/150x150.png',
                    imageRenderMethodForWeb: _isHtml
                        ? ImageRenderMethodForWeb.HtmlImage
                        : ImageRenderMethodForWeb.HttpGet,
                    errorWidget: (_, __, ___) => const Text('error2'),
                  ),
                  Image.network(
                    'https://placehold.jp/150x150.png',
                  ),
                  Image.network(
                    _headerImageUrl,
                  ),
                  ExtendedImage.network(
                    _headerImageUrl,
                    // headers: {'Authorization': 'Bearer your_token'},
                  ),
                ],
              ),
            );
          }),
      TitleSlide(
        route: '/title',
        title: 'レンダラーをwasmからhtmlに切り替えてみた',
        // title: 'wasmでFlutterをデプロイしてみる',
        subtitle: 'Masaki Sato',
      ),
      SplitSlide(
          route: '/self-intro',
          title: '自己紹介',
          leftBuilder: (_) {
            return DefaultTextStyle(
                style: body1,
                child: MarkdownBody(
                  data: '''
  - Flutter エンジニア（フリーランス）
  - Codemagic
    - 記事執筆
    - コミュニティサポート
  - イベント運営
    - FlutterGakkai ← 2/7(金)@西新宿！
    - Tokyo Flutter Hackathon
    - FlutterNinjas
  ''',
                  styleSheet: MarkdownStyleSheet(
                    p: body1,
                    listBullet: body2,
                  ),
                ));
          },
          rightBuilder: (_) {
            return Column(
              children: [
                Image.asset(
                  'assets/profile.jpg',
                ),
                Text(
                  'Masaki Sato',
                  style: body1,
                ),
              ],
            );
          }),
      ImageSlide(
          route: '/fact-1',
          title: '#FlutterInProduction',
          imageBuilder: (_) => Image.asset('assets/flutter_in_production.png')),
      // TODO(masaki): add image of FlutterInProduction & check the performance in details
      // https://www.youtube.com/live/AEXIrThTgb0?si=BmTLG4feOAK6FC4M&t=1065
      BigFactSlide(route: '/comment-1', title: 'wasm良さそう'),
      ImageSlide(
        route: '/fact-2',
        title: 'Flutter 3.27 から...',
        imageBuilder: (_) => Image.asset(
          'assets/html_renderer.png',
        ),
      ),
      // TODO(masaki): (nice-to-have) check when the official document deleted
      // BigFactSlide(route: '/fact-2/1', title: '公式のページにももうhtmlは無い'),
      // https://docs.flutter.dev/platform-integration/web/renderers
      // See: https://docs.flutter.dev/to/web-html-renderer-deprecation
      BigFactSlide(route: '/comment-2', title: 'wasmやんなきゃ'),
      TitleSlide(route: '/definition', title: 'wasmとは'),
      // stable from 3.22
      // at least 3.24 is recommended
      // https://docs.flutter.dev/platform-integration/web/wasm#switch-to-the-latest-version-of-flutter
      BigFactSlide(route: '/definition/1', title: 'Web Assembly の略'),
      BigFactSlide(
          route: '/definition/2', title: 'バイナリ形式で吐き出されるプログラミング言語のコンパイル先'),
      SplitSlide(
        route: '/definition/4',
        title: 'wasm とは',
        leftBuilder: (_) {
          return DefaultTextStyle(
            style: body1,
            child: MarkdownBody(
              data: '''
  - Canvaskit レンダラー（デフォルト)
  - html レンダラー(非推奨) 
  - skwasm レンダラー → これにする
  ''',
              styleSheet: MarkdownStyleSheet(
                p: body1,
                listBullet: body2,
              ),
            ),
          );
        },
        rightBuilder: (_) {
          return Column(
            children: [
              Image.asset(
                'assets/flutter_kaigi.png',
              ),
              Gap(8),
              GestureDetector(
                onTap: () {
                  launchUrl(
                      Uri(path: 'https://www.youtube.com/watch?v=YvWAAlLHg5Q'));
                },
                child: Text(
                  'https://www.youtube.com/watch?v=YvWAAlLHg5Q',
                  style: body2.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          );
        },
      ),
      // TODO(masaki): (nice-to-have) check available browsers
      // https://bema.jp/articles/20241025/#:~:text=Copy-,Skwasm%EF%BC%88Wasm%EF%BC%89,-Skwasm%EF%BC%88Wasm%EF%BC%89%E3%83%AC%E3%83%B3
      // https://docs.flutter.dev/platform-integration/web/wasm#learn-more-about-browser-compatibility
      TitleSlide(route: '/implementation', title: '手順'),
      BigFactSlide(
          route: '/implementation-1',
          title: '吐き出し自体は、flutter build web --wasm`で出来る'),
      // https://www.notion.so/masakisato/prep-for-Yumemi-grow-LT-168a4128da0f8019bb18e9c2770ca88e
      ImageSlide(
          route: '/implementation-2',
          title: 'header',
          imageBuilder: (_) => Image.network(_headerImageUrl)),

      // ImageSlide(
      //   route: '/implementation-X',
      //   title: 'header',
      //   imageBuilder: (context) => Image(
      //     image: ExtendedNetworkImageProvider(
      //       _headerImageUrl,
      //       cache: true,
      //     ),
      //     fit: BoxFit.cover,
      //   ),
      // ),
      CodeHighlightSlide(
          route: '/implementation-3',
          title: 'firebase hosting の場合',
          code: ''''
  "hosting": [
    {
      "target": "wasm",
      "public": "build/web",
      "ignore": [
        "firebase.json",
        "**/.*",
        "**/node_modules/**"
      ],
      "headers": [
        {
          "source": "**/*",
          "headers": [
            {
              "key": "Cross-Origin-Embedder-Policy",
              "value": "require-corp"
            },
            {
              "key": "Cross-Origin-Opener-Policy",
              "value": "same-origin"
            }
          ]
        }
      ]
    }
  ],
''',
          language: 'json'),

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

const _headerImageUrl =
    'https://firebasestorage.googleapis.com/v0/b/yumemi-grow-7-slides.firebasestorage.app/o/http_server.png?alt=media&token=3fa17425-76ad-4525-a126-ba58fff056bc';
