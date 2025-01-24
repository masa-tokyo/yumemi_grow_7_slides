import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

/// A slide widget that represents a slide with code highlighting.
class CodeHighlightSlide extends FlutterDeckSlideWidget {
  CodeHighlightSlide({
    super.key,
    required this.route,
    required this.title,
    required this.code,
    required this.language,
    this.fileName,
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

  /// The code to be highlighted.
  final String code;

  /// The programming language of the code.
  final String language;

  /// The file name of the code.
  final String? fileName;

  /// A builder for the background of the slide.
  final WidgetBuilder? backgroundBuilder;

  /// A builder for the footer of the slide.
  final WidgetBuilder? footerBuilder;

  /// A builder for the header of the slide.
  final WidgetBuilder? headerBuilder;

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => Center(
        child: FlutterDeckCodeHighlightTheme(
          data: FlutterDeckCodeHighlightTheme.of(context).copyWith(
            textStyle: FlutterDeckTheme.of(context).textTheme.bodySmall,
          ),
          child: FlutterDeckCodeHighlight(
            code: code,
            fileName: fileName,
            language: language,
          ),
        ),
      ),
    );
  }
}
