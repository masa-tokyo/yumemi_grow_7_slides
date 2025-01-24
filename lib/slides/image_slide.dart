import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

/// A slide widget that represents a slide with an image.
class ImageSlide extends FlutterDeckSlideWidget {
  ImageSlide({
    super.key,
    required this.route,
    required this.title,
    required this.imageBuilder,
    this.label,
    this.backgroundBuilder,
    this.footerBuilder,
    this.headerBuilder,
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

  /// Creates the image of the slide.
  final Image Function(BuildContext context) imageBuilder;

  /// The label to display below the image.
  ///
  /// If this is null, no label will be displayed.
  final String? label;

  /// A builder for the background of the slide.
  final WidgetBuilder? backgroundBuilder;

  /// A builder for the footer of the slide.
  final WidgetBuilder? footerBuilder;

  /// A builder for the header of the slide.
  final WidgetBuilder? headerBuilder;

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlide.image(
      imageBuilder: imageBuilder,
      label: label,
      backgroundBuilder: backgroundBuilder,
      footerBuilder: footerBuilder,
      headerBuilder: headerBuilder,
    );
  }
}
