import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

/// A split slide with custom builders for the left and right sections.
class SplitSlide extends FlutterDeckSlideWidget {
  SplitSlide({
    super.key,
    required this.route,
    required this.title,
    required this.leftBuilder,
    required this.rightBuilder,
  }) : super(
          configuration: FlutterDeckSlideConfiguration(
            route: route,
            header: FlutterDeckHeaderConfiguration(
              title: title,
            ),
          ),
        );

  /// The title of the slide.
  final String title;

  /// The route of the slide on the web.
  final String route;

  /// The custom builder for the left section of the slide.
  final WidgetBuilder leftBuilder;

  /// The custom builder for the right section of the slide.
  final WidgetBuilder rightBuilder;

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlide.split(
      leftBuilder: leftBuilder,
      rightBuilder: rightBuilder,
    );
  }
}
