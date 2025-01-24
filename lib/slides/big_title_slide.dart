import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

/// A big fact slide with a custom builder.
class BigFactSlide extends FlutterDeckSlideWidget {
  BigFactSlide({
    super.key,
    required this.route,
    required this.title,
    this.subtitle,
    this.backgroundBuilder,
    this.footerBuilder,
    this.headerBuilder,
  }) : super(
          configuration: FlutterDeckSlideConfiguration(
            route: route,
            // header: FlutterDeckHeaderConfiguration(
            //   title: title,
            // ),
          ),
        );

  /// The title of the slide.
  final String title;

  /// The subtitle of the slide.
  final String? subtitle;

  /// The route of the slide on the web.
  final String route;

  /// The custom background builder of the slide.
  final WidgetBuilder? backgroundBuilder;

  /// The custom footer builder of the slide.
  final WidgetBuilder? footerBuilder;

  /// The custom header builder of the slide.
  final WidgetBuilder? headerBuilder;

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlide.bigFact(
      title: title,
      subtitle: subtitle,
      backgroundBuilder: backgroundBuilder,
      footerBuilder: footerBuilder,
      headerBuilder: headerBuilder,
    );
  }
}
