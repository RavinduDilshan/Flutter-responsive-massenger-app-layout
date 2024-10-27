import 'package:animated_responsive_app_layout/models/data.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';
import 'star_button.dart';

enum EmailType { preview, threaded, primaryThreaded }

class EmailWidget extends StatefulWidget {
  final bool isSelected;
  final bool isPreview;
  final bool showHeadline;
  final bool isThreaded;
  final void Function()? onSelected;
  final Email email;

  const EmailWidget(
      {super.key,
      required this.email,
      this.isSelected = false,
      this.isPreview = true,
      this.isThreaded = false,
      this.showHeadline = false,
      this.onSelected});

  @override
  State<EmailWidget> createState() => _EmailWidgetState();
}

class _EmailWidgetState extends State<EmailWidget> {
  late final ColorScheme _colorScheme = Theme.of(context).colorScheme;
  late Color unselectedColor = Color.alphaBlend(
      _colorScheme.primary.withOpacity(0.08), _colorScheme.surface);

  Color get _surfaceColor => switch (widget) {
        EmailWidget(isPreview: false) => _colorScheme.surface,
        EmailWidget(isSelected: true) => _colorScheme.primaryContainer,
        _ => unselectedColor
      };
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onSelected,
      child: Card(
        elevation: 0,
        color: _surfaceColor,
        clipBehavior: Clip.hardEdge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.showHeadline) ...[
              EmailHeadline(email: widget.email, isSelected: widget.isSelected)
            ],
            EmailContent(
                email: widget.email,
                isPreview: widget.isPreview,
                isThreaded: widget.isThreaded,
                isSelected: widget.isSelected)
          ],
        ),
      ),
    );
  }
}

class EmailContent extends StatefulWidget {
  final Email email;
  final bool isPreview;
  final bool isThreaded;
  final bool isSelected;
  const EmailContent(
      {super.key,
      required this.email,
      required this.isPreview,
      required this.isThreaded,
      required this.isSelected});

  @override
  State<EmailContent> createState() => _EmailContentState();
}

class _EmailContentState extends State<EmailContent> {
  late final ColorScheme _colorScheme = Theme.of(context).colorScheme;
  late final TextTheme _textTheme = Theme.of(context).textTheme;

  Widget get contentSpacer => SizedBox(height: widget.isThreaded ? 20 : 2);
  String get lastActiveLabel {
    final DateTime now = DateTime.now();
    if (widget.email.sender.lastActive.isAfter(now)) throw ArgumentError();
    final Duration elapsedTime =
        widget.email.sender.lastActive.difference(now).abs();
    return switch (elapsedTime) {
      Duration(inSeconds: < 60) => '${elapsedTime.inSeconds}s',
      Duration(inMinutes: < 60) => '${elapsedTime.inMinutes}m',
      Duration(inHours: < 24) => '${elapsedTime.inHours}h',
      Duration(inDays: < 365) => '${elapsedTime.inDays}d',
      _ => throw UnimplementedError()
    };
  }

  TextStyle? get contentTextStyle => switch (widget) {
        EmailContent(isThreaded: true) => _textTheme.bodyLarge,
        EmailContent(isSelected: true) => _textTheme.bodyMedium
            ?.copyWith(color: _colorScheme.onPrimaryContainer),
        _ =>
          _textTheme.bodyMedium?.copyWith(color: _colorScheme.onSurfaceVariant)
      };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutBuilder(builder: (context, constraints) {
            return Row();
          })
        ],
      ),
    );
  }
}
