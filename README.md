<p>
  <a href="https://pub.dev/packages/markdown_toolbar" alt="Release">
  <img src="https://img.shields.io/pub/v/markdown_toolbar?style=flat-square" /></a>

  <a href="https://github.com/iakmds/markdown_toolbar/issues" alt="Issues">
  <img src="https://img.shields.io/github/issues/iakmds/markdown_toolbar?color=dfb317&style=flat-square" /></a>

  <a href="https://github.com/iakmds/markdown_toolbar/pulls" alt="Pull requests">
  <img src="https://img.shields.io/github/issues-pr/iakmds/markdown_toolbar?style=flat-square" /></a>

  <a href="https://github.com/iakmds/markdown_toolbar/contributors" alt="Contributors">
  <img src="https://img.shields.io/github/contributors/iakmds/markdown_toolbar?style=flat-square" /></a>

  <a href="https://github.com/iakmds/markdown_toolbar/network/members" alt="Forks">
  <img src="https://img.shields.io/github/forks/iakmds/markdown_toolbar?style=flat-square" /></a>

  <a href="https://github.com/iakmds/markdown_toolbar/stargazers" alt="Stars">
  <img src="https://img.shields.io/github/stars/iakmds/markdown_toolbar?style=flat-square" /></a>

  <a href="https://github.com/iakmds/markdown_toolbar/blob/master/LICENSE" alt="License">
  <img src="https://img.shields.io/github/license/iakmds/markdown_toolbar?style=flat-square" /></a>
</p>

A customizable toolbar to enhance your experience of writing Markdown in Flutter apps.

This plugin uses the TextField widget from Flutter (read more below). In the future, it may become independent from it to change any text, no matter where it's coming from.

Get it from [pub.dev](https://pub.dev/packages/markdown_toolbar)

## Table of Contents
- [Screenshots](#screenshots)
- [Features](#features)
    - [Convert to Markdown styles](#convert-your-text-to-these-styles)
    - [Customization](#customization-options)
    - [About the toolbar](#about-the-toolbar)
- [Usage](#usage)
    - [Quick integration](#1-quick-integration)
    - [Custom TextField](#2-custom-textfield)
- [Roadmap](#roadmap)

# Screenshots

<img src="https://raw.githubusercontent.com/iakmds/markdown_toolbar/master/doc/assets/preview01.gif" alt="Preview GIF" width="512">

## Responsive wrapping and collapsable

<img src="https://raw.githubusercontent.com/iakmds/markdown_toolbar/master/doc/assets/horizontal01.png" alt="Horizontal toolbar" width="500">
<img src="https://raw.githubusercontent.com/iakmds/markdown_toolbar/master/doc/assets/horizontal02.png" alt="Horizontal toolbar collapsed" width="500">

<br>

<p float="left">
<img src="https://raw.githubusercontent.com/iakmds/markdown_toolbar/master/doc/assets/vertical01.png" alt="Vertical responsive toolbar" height="300">
<img src="https://raw.githubusercontent.com/iakmds/markdown_toolbar/master/doc/assets/vertical02.png" alt="Vertical responsive toolbar collapsed" height="300">
</p>

# Features

## Convert your text to these styles:
| Convert to | In Markdown | Supported |
| - | - | - |
| Heading (1-6) | `# Heading` | ✅ |
| Bold | `**Bold**` | ✅ |
| Italic | `*Italic*` | ✅ |
| Strikethrough | `~~Strikethrough~~` | ✅ |
| Link | `[Link](https://pub.dev)` | ✅ |
| Image | `![Image](assets/image.png)` | ✅ |
| Code | `` ```Code``` `` | ✅ |
| Bulleted list | `- Bulleted list` | ✅ |
| Numbered list | `1. Numbered list` | ✅ |
| Checkbox | `- [ ] Checkbox` and `- [x] Checkbox` | ✅ |
| Quote | `> Quote` | ✅ |
| Horizontal rule | `---` | ✅ |

## Customization options:
| Action | Example | Visual result |
| - | - | - |
| Collapse toolbar button | ```collapsable: true``` | *Coming soon* |
| Use the included TextField | ```useIncludedTextField: true``` | *Coming soon* |
| Button width | ```width: 70``` | *Coming soon* |
| Button height | ```height: 50``` | *Coming soon* |
| Icon size | ```iconSize: 30``` | *Coming soon* |
| Background color | ```backgroundColor: Colors.blue``` | *Coming soon* |
| Icon color | ```iconColor: Colors.white``` | *Coming soon* |
| Hide individual buttons | ```hideBold: true``` | *Coming soon* |
| Custom tooltips for each button | ```linkTooltip: 'Press to add a link!'``` | *Coming soon* |
| Custom character support (Bold, Italic, Code, Bulleted list and Horizontal rule) | ```customItalicCharacter: '_'``` | *Coming soon* |

You can also hover over the `MarkdownToolbar` widget and its fields inside your IDE to receive more information regarding all the options.

## About the toolbar:
- Platform-independent
- Responsive wrapping (+ optionally collapsable)
- Easy to implement
- Uses its own parser that can be made more precise over time
- No other dependencies apart from the Flutter widgets

# Usage

First, import the package:
```dart
import 'package:markdown_toolbar/markdown_toolbar.dart';
```

You have 2 options:

## 1. Quick integration

For quick integration, simply add the MarkdownToolbar widget (which includes a TextField) and you're done:
```dart
const MarkdownToolbar(useIncludedTextField: true),
```

## 2. Custom TextField

However, if you want to use your own TextField, declare your TextEditingController and FocusNode and set them to the controller and focusNode fields respectively (for both the TextField and MarkdownToolbar widgets):
```dart
final TextEditingController _controller = TextEditingController(); // Declare the TextEditingController
late final FocusNode _focusNode; // Declare the FocusNode

@override
void initState() {
    _controller.addListener(() => setState(() {})); // Update the text when typing
    _focusNode = FocusNode(); // Assign a FocusNode
    super.initState();
}

@override
void dispose() {
    _controller.dispose(); // Dispose the TextEditingController
    _focusNode.dispose(); // Dispose the FocusNode
    super.dispose();
}

// Inside a Column for instance, place the widgets and assign the fields
Column(children: <Widget>[
    MarkdownToolbar(
        useIncludedTextField: false, // Because we want to use our own, set useIncludedTextField to false
        controller: _controller, // Add the _controller
        focusNode: _focusNode, // Add the _focusNode
    ),
    TextField(
        controller: _controller, // Add the _controller
        focusNode: _focusNode, // Add the _focusNode
    ),
])
```

For a complete example, check out [example.dart](https://github.com/iakmds/markdown_toolbar/blob/master/example/markdown_toolbar_example.dart)

# Roadmap
- Ability to rearrange the buttons through a List (and thus remove the need for hideButton booleans, as you can simply not include the unwanted buttons inside the list)
- Custom character support for all buttons to change the added Markdown characters on click
- Custom button support
- Custom function support when clicking a button (Useful for integrating things like a File Picker when inserting an Image instead of having to manually type out the path)
- More customization (Gaps, Aligning, Button style, etc.)
- Add Emoji button
