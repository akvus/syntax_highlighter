import 'package:flutter/material.dart';
import 'package:syntax_highlighter/syntax_highlighter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Syntax Highlighter Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Syntax Highlighter Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _exampleCode = '''class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
''';

  @override
  Widget build(BuildContext context) {
    final SyntaxHighlighterStyle style =
        Theme.of(context).brightness == Brightness.dark
            ? DarkSyntaxHighlighterStyle()
            : LightSyntaxHighlighterStyle();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(fontFamily: 'monospace', fontSize: 10.0),
              children: <TextSpan>[
                DartSyntaxHighlighter(
                  syntaxHighlighterStyle: style,
                ).format(_exampleCode)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LightSyntaxHighlighterStyle extends SyntaxHighlighterStyle {
  @override
  TextStyle? get baseStyle => const TextStyle(color: Color(0xFF000000));

  @override
  TextStyle? get classStyle => const TextStyle(color: Color(0xFF512DA8));

  @override
  TextStyle? get commentStyle => const TextStyle(color: Color(0xFF9E9E9E));

  @override
  TextStyle? get constantStyle => const TextStyle(color: Color(0xFF795548));

  @override
  TextStyle? get keywordStyle => const TextStyle(color: Color(0xFF9C27B0));

  @override
  TextStyle? get numberStyle => const TextStyle(color: Color(0xFF1565C0));

  @override
  TextStyle? get punctuationStyle => const TextStyle(color: Color(0xFF000000));

  @override
  TextStyle? get stringStyle => const TextStyle(color: Color(0xFF43A047));
}

class DarkSyntaxHighlighterStyle extends SyntaxHighlighterStyle {
  @override
  TextStyle? get baseStyle => const TextStyle(color: Color(0xFFFFFFFF));

  @override
  TextStyle? get classStyle => const TextStyle(color: Color(0xFF009688));

  @override
  TextStyle? get commentStyle => const TextStyle(color: Color(0xFF9E9E9E));

  @override
  TextStyle? get constantStyle => const TextStyle(color: Color(0xFF795548));

  @override
  TextStyle? get keywordStyle => const TextStyle(color: Color(0xFF80CBC4));

  @override
  TextStyle? get numberStyle => const TextStyle(color: Color(0xFF1565C0));

  @override
  TextStyle? get punctuationStyle => const TextStyle(color: Color(0xFFFFFFFF));

  @override
  TextStyle? get stringStyle => const TextStyle(color: Color(0xFF009688));
}
