import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

/// A blank slide with a custom builder.
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

  /// The title of the slide.
  final String title;

  /// The route of the slide on the web.
  final String route;

  /// The custom builder of the slide.
  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: builder,
    );
  }
}
