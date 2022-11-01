import 'package:flutter/material.dart';
import 'package:markdown_toolbar/markdown_toolbar.dart';

void main() {
  runApp(const MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  late final FocusNode _focusNode;

  @override
  void initState() {
    _controller.addListener(() => setState(() {}));
    _focusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Markdown Toolbar Example'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:
                CrossAxisAlignment.end, // Change the toolbar alignment
            children: <Widget>[
              MarkdownToolbar(
                useIncludedTextField: false, // If you set this to true, remove
                // a) the controller and focusNode fields and b) the TextField outside this widget
                controller: _controller,
                focusNode: _focusNode,
                // Uncomment the options below to observe the changes

                // collapsable: true,
                // backgroundColor: Colors.lightBlue,
                // iconColor: Colors.white,
                // iconSize: 30,
                // width: 70,
                // height: 50,
                // customItalicCharacter: '_',
                // customBulletedListCharacter: '*',
                // customHorizontalRuleCharacter: '***',
                // hideImage: true,
                // hideCode: true,
                // linkTooltip: 'Add a link',
              ),
              //const SizedBox(height: 4.0),
              const Divider(),
              TextField(
                controller: _controller,
                focusNode: _focusNode,
                minLines: 5,
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: 'Placeholder text',
                  labelText: 'Label text',
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
