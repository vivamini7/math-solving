import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

class LaTeXText extends StatelessWidget {
  final String text;

  const LaTeXText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    final parts = _parseLatex(text);
    return RichText(
      text: TextSpan(
        children: parts.map((part) {
          // LaTeX 인라인 수식 처리 '$$'
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
          }
          // LaTeX 인라인 수식 처리 '\(\)'
          else if (part.startsWith('\\(') && part.endsWith('\\)')) {
            final latex = part.substring(2, part.length - 2);
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
          }
          // LaTeX 수식 처리 '\[\]'
          else if (part.startsWith('\\[') && part.endsWith('\\]')) {
            final latex = part.substring(2, part.length - 2);
            return WidgetSpan(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: Math.tex(
                  latex,
                  textStyle: const TextStyle(fontSize: 16),
                  mathStyle: MathStyle.display,
                ),
              ),
            );
          }
          // Bold 텍스트 처리 '**'
          else if (part.startsWith('**') && part.endsWith('**')) {
            return TextSpan(
              text: part.substring(2, part.length - 2),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            );
          }
          // H4 스타일 처리 '####'
          else if (part.startsWith('####')) {
            final headerText = part.substring(4).trim();
            return TextSpan(
              text: '$headerText\n',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            );
          }
          // H3 스타일 처리 '###'
          else if (part.startsWith('###')) {
            final headerText = part.substring(3).trim();
            return TextSpan(
              text: '$headerText\n',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            );
          }
          // 일반 텍스트 처리
          else {
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
    final regex = RegExp(
      r'\\\[(.*?)\\\]|\$.*?\$|\\\((.*?)\\\)|\*\*(.*?)\*\*|###(.*?)\n|####(.*?)\n',
      dotAll: true,
    );

    final parts = <String>[];
    var lastIndex = 0;

    for (final match in regex.allMatches(text)) {
      if (match.start > lastIndex) {
        parts.add(text.substring(lastIndex, match.start));
      }

      final fullMatch = match.group(0)!;

      if (fullMatch.startsWith('\\[') || fullMatch.startsWith('\\(')) {
        final latex = match.group(1) ?? match.group(2)!;
        parts.add(fullMatch);
      } else if (fullMatch.startsWith('\$')) {
        parts.add(fullMatch);
      } else if (fullMatch.startsWith('**')) {
        parts.add(fullMatch);
      } else if (fullMatch.startsWith('####')) {
        parts.add(fullMatch);
      } else if (fullMatch.startsWith('###')) {
        parts.add(fullMatch);
      }

      lastIndex = match.end;
    }

    if (lastIndex < text.length) {
      parts.add(text.substring(lastIndex));
    }

    return parts;
  }
}
