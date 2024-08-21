import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

class SimilarProblemText extends StatelessWidget {
  final String text;

  const SimilarProblemText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    final parts = _parseLatex(text);
    return RichText(
      text: TextSpan(
        children: parts.map((part) {
          if (part.contains(r'$')) {
            final latex = part.substring(1, part.length - 1);
            return TextSpan(
              text: '',
              children: [
                WidgetSpan(
                  child: Math.tex(
                    latex,
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            );
          } else {
            return TextSpan(
              text: part,
              style: const TextStyle(fontSize: 16),
            );
          }
        }).toList(),
      ),
    );
  }

  List<String> _parseLatex(String text) {
    final regex = RegExp(r'\$.*?\$');
    final parts = <String>[];
    var lastIndex = 0;

    for (final match in regex.allMatches(text)) {
      if (match.start > lastIndex) {
        parts.add(text.substring(lastIndex, match.start));
      }
      parts.add(text.substring(match.start, match.end));
      lastIndex = match.end;
    }

    if (lastIndex < text.length) {
      parts.add(text.substring(lastIndex));
    }

    return parts;
  }
}
