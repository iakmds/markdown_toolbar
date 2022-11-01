import 'package:flutter/material.dart';

import 'parser/parser.dart';

class MarkdownToolbar extends StatefulWidget {
  /// Creates a [MarkdownToolbar] widget.
  ///
  /// The following field is necessary: [useIncludedTextField] (bool)
  ///
  /// If you set [useIncludedTextField] to `true`, you are ready to use the Widget with its included TextField.
  ///
  /// If you set [useIncludedTextField] to `false`, you need a [TextField] widget outside of
  /// the [MarkdownToolbar] which has the same [controller] and [focusNode] set as the [MarkdownToolbar] (see below).
  ///
  /// Remember: In this case, you have to set the [controller] and [focusNode] fields in your
  /// [MarkdownToolbar]. Hover over each field for more details on implementing your own TextField correctly.
  const MarkdownToolbar({
    super.key,
    required this.useIncludedTextField,
    this.controller,
    this.focusNode,
    this.collapsable = false,
    this.backgroundColor = const Color(0xFFEEEEEE),
    this.iconColor = const Color(0xFF303030),
    this.iconSize = 24,
    this.width = 60,
    this.height = 40,
    this.customBoldCharacter = '**',
    this.customItalicCharacter = '*',
    this.customCodeCharacter = '```',
    this.customBulletedListCharacter = '-',
    this.customHorizontalRuleCharacter = '---',
    this.hideHeading = false,
    this.hideBold = false,
    this.hideItalic = false,
    this.hideStrikethrough = false,
    this.hideLink = false,
    this.hideImage = false,
    this.hideCode = false,
    this.hideBulletedList = false,
    this.hideNumberedList = false,
    this.hideCheckbox = false,
    this.hideQuote = false,
    this.hideHorizontalRule = false,
    this.headingTooltip = 'Heading',
    this.boldTooltip = 'Bold',
    this.italicTooltip = 'Italic',
    this.strikethroughTooltip = 'Strikethrough',
    this.linkTooltip = 'Link',
    this.imageTooltip = 'Image',
    this.codeTooltip = 'Code',
    this.bulletedListTooltip = 'Bulleted list',
    this.numberedListTooltip = 'Numbered list',
    this.checkboxTooltip = 'Checkbox',
    this.quoteTooltip = 'Quote',
    this.horizontalRuleTooltip = 'Horizontal rule',
  });

  /// It is recommended that you use your own TextField outside this widget for more customization.
  /// To do that, set [useIncludedTextField] to `false` and implement your own TextField outside.
  /// IMPORTANT: Remember to set the same [controller] and [focusNode] in the TextField as the ones in your [MarkdownToolbar].
  /// Hover over the 2 fields for more details.
  ///
  /// If you want to use the included TextField as a quick solution, set [useIncludedTextField] to `true` and you are ready to go.
  final bool useIncludedTextField;

  /// In order to use a custom TextField, assign a [TextEditingController] to the [controller] field.
  /// ```
  /// final TextEditingController _controller = TextEditingController(); //Declare the TextEditingController
  /// @override
  /// void initState() {
  ///   super.initState();
  ///   _controller.addListener(() => setState(() {})); //To update the text inside the [controller] add a listener and call setState()
  /// }
  /// @override
  /// void dispose() {
  ///   _controller.dispose(); //Dispose the TextEditingController in dispose()
  ///   super.dispose();
  /// }
  /// MarkdownToolbar(controller: _controller, ...), //Set the TextEditingController in the toolbar
  /// TextField(controller: _controller, ...), //Set the same _controller in your TextField
  /// ```
  final TextEditingController? controller;

  /// If using a custom TextField, set the [focusNode] to a [FocusNode] Widget in order
  /// to focus the text after clicking a button. Use the FocusNode like this:
  /// ```
  /// late final FocusNode _focusNode; //Declare the FocusNode
  /// @override
  /// void initState() {
  ///   super.initState();
  ///   _focusNode = FocusNode(); //Assign a new FocusNode in initState()
  /// }
  /// @override
  /// void dispose() {
  ///   _focusNode.dispose(); //Dispose the FocusNode in dispose()
  ///   super.dispose();
  /// }
  /// MarkdownToolbar(focusNode: _focusNode, ...), //Set the FocusNode in the toolbar
  /// TextField(focusNode: _focusNode, ...), //Set the same _focusNode in your TextField
  /// ```
  final FocusNode? focusNode;

  /// Make the toolbar collapsable with a button by settings [collapsable] to `true`.
  final bool collapsable;

  /// Set the [backgroundColor] of the buttons. Default: `Colors.grey[200]`
  final Color backgroundColor;

  /// Set the [iconColor] of the buttons. Default: `Colors.grey[850]`
  final Color iconColor;

  /// Set the [iconSize] of the buttons. Default: `24`
  final double iconSize;

  /// Set the [width] of the buttons. Default: `60`.
  final double width;

  /// Set the [height] of the buttons. Default: `40`.
  final double height;

  /// If you want to use an alternative bold character (Default: `**`),
  /// assign a custom [String] to [customBoldCharacter]. For example `__`
  final String customBoldCharacter;

  /// If you want to use an alternative italic character (Default: `*`),
  /// assign a custom [String] to [customItalicCharacter]. For example `_`
  final String customItalicCharacter;

  /// If you want to use an alternative code character (Default: `` ``` ``),
  /// assign a custom [String] to [customCodeCharacter]. For example ``` ` ```
  final String customCodeCharacter;

  /// If you want to use an alternative bulleted list character (Default: `-`),
  /// assign a custom [String] to [customBulletedListCharacter]. For example `*`
  final String customBulletedListCharacter;

  /// If you want to use an alternative horizontal rule character (Default: `---`),
  /// assign a custom [String] to [customHorizontalRuleCharacter]. For example `***`
  final String customHorizontalRuleCharacter;

  /// Hide the heading button by settings [hideHeading] to `true`.
  final bool hideHeading;

  /// Hide the bold button by settings [hideBold] to `true`.
  final bool hideBold;

  /// Hide the italic button by settings [hideItalic] to `true`.
  final bool hideItalic;

  /// Hide the strikethrough button by settings [hideStrikethrough] to `true`.
  final bool hideStrikethrough;

  /// Hide the link button by settings [hideLink] to `true`.
  final bool hideLink;

  /// Hide the image button by settings [hideImage] to `true`.
  final bool hideImage;

  /// Hide the code button by settings [hideCode] to `true`.
  final bool hideCode;

  /// Hide the bulleted list button by settings [hideBulletedList] to `true`.
  final bool hideBulletedList;

  /// Hide the numbered list button by settings [hideNumberedList] to `true`.
  final bool hideNumberedList;

  /// Hide the checkbox button by settings [hideCheckbox] to `true`.
  final bool hideCheckbox;

  /// Hide the quote button by settings [hideQuote] to `true`.
  final bool hideQuote;

  /// Hide the horizontal rule button by settings [hideHorizontalRule] to `true`.
  final bool hideHorizontalRule;

  /// Set a custom tooltip [String] for the heading button. Leave blank ```''``` to disable tooltip.
  final String headingTooltip;

  /// Set a custom tooltip [String] for the bold button. Leave blank ```''``` to disable tooltip.
  final String boldTooltip;

  /// Set a custom tooltip [String] for the italic button. Leave blank ```''``` to disable tooltip.
  final String italicTooltip;

  /// Set a custom tooltip [String] for the strikethrough button. Leave blank ```''``` to disable tooltip.
  final String strikethroughTooltip;

  /// Set a custom tooltip [String] for the link button. Leave blank ```''``` to disable tooltip.
  final String linkTooltip;

  /// Set a custom tooltip [String] for the image button. Leave blank ```''``` to disable tooltip.
  final String imageTooltip;

  /// Set a custom tooltip [String] for the code button. Leave blank ```''``` to disable tooltip.
  final String codeTooltip;

  /// Set a custom tooltip [String] for the bulleted list button. Leave blank ```''``` to disable tooltip.
  final String bulletedListTooltip;

  /// Set a custom tooltip [String] for the numbered list button. Leave blank ```''``` to disable tooltip.
  final String numberedListTooltip;

  /// Set a custom tooltip [String] for the checkbox button. Leave blank ```''``` to disable tooltip.
  final String checkboxTooltip;

  /// Set a custom tooltip [String] for the quote button. Leave blank ```''``` to disable tooltip.
  final String quoteTooltip;

  /// Set a custom tooltip [String] for the horizontal rule button. Leave blank ```''``` to disable tooltip.
  final String horizontalRuleTooltip;

  @override
  State<MarkdownToolbar> createState() => _MarkdownToolbarState();
}

class _MarkdownToolbarState extends State<MarkdownToolbar> {
  var isCollapsed = false;

  final TextEditingController _includedController = TextEditingController();
  late final FocusNode _includedFocusNode;

  @override
  void initState() {
    if (widget.useIncludedTextField) {
      _includedController.addListener(() => setState(() {}));
      _includedFocusNode = FocusNode();
    }

    super.initState();
  }

  @override
  void dispose() {
    if (widget.useIncludedTextField) {
      _includedController.dispose();
      _includedFocusNode.dispose();
    }

    super.dispose();
  }

  Widget _buildToolbarItem({
    required IconData icon,
    required VoidCallback? onPressed,
    required String tooltip,
    bool dropdown = false,
    List<DropdownMenuItem<int>> dropdownItems = const [],
    String? dropdownString,
    Function(int)? onDropdownButtonSelect,
  }) {
    return Tooltip(
      message: tooltip,
      child: dropdown
          ? SizedBox(
              width: widget.width,
              height: widget.height,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.backgroundColor,
                  padding: const EdgeInsets.all(0),
                ),
                onPressed: () {},
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    dropdownString != null
                        ? Text(
                            dropdownString,
                            style: TextStyle(
                                color: widget.iconColor,
                                fontSize: 16.0 * widget.iconSize / 20),
                          )
                        : Icon(
                            icon,
                            color: widget.iconColor,
                            size: widget.iconSize,
                          ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        //value: 0,
                        items: dropdownItems,
                        onChanged: (option) {
                          onDropdownButtonSelect != null
                              ? onDropdownButtonSelect(option ?? 0)
                              : null;
                        },
                        icon: Container(),
                      ),
                    )
                  ],
                ),
              ),
            )
          : SizedBox(
              width: widget.width,
              height: widget.height,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.backgroundColor,
                  foregroundColor: widget.iconColor,
                  padding: const EdgeInsets.all(0),
                ),
                onPressed: dropdown ? null : onPressed,
                child: Icon(
                  icon,
                  color: widget.iconColor,
                  size: widget.iconSize,
                ),
              ),
            ),
    );
  }

  Widget _buildCollapseItem() {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.backgroundColor,
          foregroundColor: widget.iconColor,
          padding: const EdgeInsets.all(0),
        ),
        onPressed: () => setState(() {
          isCollapsed = !isCollapsed;
        }),
        child: RotatedBox(
          quarterTurns: 1,
          child: Icon(
            isCollapsed ? Icons.expand_more : Icons.expand_less,
            color: widget.iconColor,
            size: widget.iconSize + 4,
          ),
        ),
      ),
    );
  }

  List<Widget> _toolbarItems({
    required bool useIncludedTextField,
    required bool collapsable,
    required bool hideHeading,
    required bool hideBold,
    required bool hideItalic,
    required bool hideStrikethrough,
    required bool hideLink,
    required bool hideImage,
    required bool hideCode,
    required bool hideBulletedList,
    required bool hideNumberedList,
    required bool hideCheckbox,
    required bool hideQuote,
    required bool hideHorizontalRule,
    required String headingTooltip,
    required String boldTooltip,
    required String italicTooltip,
    required String strikethroughTooltip,
    required String linkTooltip,
    required String imageTooltip,
    required String codeTooltip,
    required String bulletedListTooltip,
    required String numberedListTooltip,
    required String checkboxTooltip,
    required String quoteTooltip,
    required String horizontalRuleTooltip,
  }) {
    if (collapsable && isCollapsed) {
      return [
        _buildCollapseItem(),
      ];
    } else {
      return [
        if (!hideHeading)
          _buildToolbarItem(
            icon: Icons.h_mobiledata,
            tooltip: headingTooltip,
            onPressed: () => onToolbarItemPressed(
              markdownToolbarOption: MarkdownToolbarOption.heading,
            ),
            onDropdownButtonSelect: (int option) => onToolbarItemPressed(
              option: option,
              markdownToolbarOption: MarkdownToolbarOption.heading,
            ),
            dropdown: true,
            dropdownItems: const [
              DropdownMenuItem<int>(
                value: 0,
                child: Text(
                  'H1',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                ),
              ),
              DropdownMenuItem<int>(
                value: 1,
                child: Text(
                  'H2',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 19.0,
                  ),
                ),
              ),
              DropdownMenuItem<int>(
                value: 2,
                child: Text(
                  'H3',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.0,
                  ),
                ),
              ),
              DropdownMenuItem<int>(
                value: 3,
                child: Text(
                  'H4',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 17.0,
                  ),
                ),
              ),
              DropdownMenuItem<int>(
                value: 4,
                child: Text(
                  'H5',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
                ),
              ),
              DropdownMenuItem<int>(
                value: 5,
                child: Text(
                  'H6',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ],
            dropdownString: 'H1',
          ),
        if (!hideBold)
          _buildToolbarItem(
            icon: Icons.format_bold,
            tooltip: boldTooltip,
            onPressed: () => onToolbarItemPressed(
                markdownToolbarOption: MarkdownToolbarOption.bold),
          ),
        if (!hideItalic)
          _buildToolbarItem(
            icon: Icons.format_italic,
            tooltip: italicTooltip,
            onPressed: () => onToolbarItemPressed(
                markdownToolbarOption: MarkdownToolbarOption.italic),
          ),
        if (!hideStrikethrough)
          _buildToolbarItem(
            icon: Icons.format_strikethrough,
            tooltip: strikethroughTooltip,
            onPressed: () => onToolbarItemPressed(
                markdownToolbarOption: MarkdownToolbarOption.strikethrough),
          ),
        if (!hideLink)
          _buildToolbarItem(
            icon: Icons.link,
            tooltip: linkTooltip,
            onPressed: () => onToolbarItemPressed(
                markdownToolbarOption: MarkdownToolbarOption.link),
          ),
        if (!hideImage)
          _buildToolbarItem(
            icon: Icons.image,
            tooltip: imageTooltip,
            onPressed: () => onToolbarItemPressed(
                markdownToolbarOption: MarkdownToolbarOption.image),
          ),
        if (!hideCode)
          _buildToolbarItem(
            icon: Icons.code,
            tooltip: codeTooltip,
            onPressed: () => onToolbarItemPressed(
                markdownToolbarOption: MarkdownToolbarOption.code),
          ),
        if (!hideBulletedList)
          _buildToolbarItem(
            icon: Icons.format_list_bulleted,
            tooltip: bulletedListTooltip,
            onPressed: () => onToolbarItemPressed(
                markdownToolbarOption: MarkdownToolbarOption.unorderedList),
          ),
        if (!hideNumberedList)
          _buildToolbarItem(
            icon: Icons.format_list_numbered,
            tooltip: numberedListTooltip,
            onPressed: () => onToolbarItemPressed(
                markdownToolbarOption: MarkdownToolbarOption.orderedList),
          ),
        if (!hideCheckbox)
          _buildToolbarItem(
            icon: Icons.check_box,
            tooltip: checkboxTooltip,
            onPressed: () => onToolbarItemPressed(
              markdownToolbarOption: MarkdownToolbarOption.checkbox,
            ),
            onDropdownButtonSelect: (int option) => onToolbarItemPressed(
              option: option,
              markdownToolbarOption: MarkdownToolbarOption.checkbox,
            ),
            dropdown: true,
            dropdownItems: const [
              DropdownMenuItem<int>(
                value: 0,
                child: Icon(
                  Icons.check_box_outline_blank,
                  color: Colors.blue,
                ),
              ),
              DropdownMenuItem<int>(
                value: 1,
                child: Icon(
                  Icons.check_box,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        if (!hideQuote)
          _buildToolbarItem(
            icon: Icons.format_quote,
            tooltip: quoteTooltip,
            onPressed: () => onToolbarItemPressed(
                markdownToolbarOption: MarkdownToolbarOption.quote),
          ),
        if (!hideHorizontalRule)
          _buildToolbarItem(
            icon: Icons.horizontal_rule,
            tooltip: horizontalRuleTooltip,
            onPressed: () => onToolbarItemPressed(
                markdownToolbarOption: MarkdownToolbarOption.horizontalRule),
          ),
        if (collapsable) _buildCollapseItem(),
      ];
    }
  }

  void onToolbarItemPressed({
    required MarkdownToolbarOption markdownToolbarOption,
    int? option,
  }) {
    widget.useIncludedTextField
        ? _includedFocusNode.requestFocus()
        : widget.focusNode?.requestFocus();
    Format.toolbarItemPressed(
      markdownToolbarOption: markdownToolbarOption,
      controller: widget.useIncludedTextField
          ? _includedController
          : widget.controller ?? _includedController,
      selection: widget.useIncludedTextField
          ? _includedController.selection
          : widget.controller?.selection ?? _includedController.selection,
      option: option,
      customBoldCharacter: widget.customBoldCharacter,
      customItalicCharacter: widget.customItalicCharacter,
      customCodeCharacter: widget.customCodeCharacter,
      customBulletedListCharacter: widget.customBulletedListCharacter,
      customHorizontalRuleCharacter: widget.customHorizontalRuleCharacter,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          alignment: WrapAlignment.end,
          runSpacing: 4.0,
          children: _toolbarItems(
            useIncludedTextField: widget.useIncludedTextField,
            collapsable: widget.collapsable,
            hideHeading: widget.hideHeading,
            hideBold: widget.hideBold,
            hideItalic: widget.hideItalic,
            hideStrikethrough: widget.hideStrikethrough,
            hideLink: widget.hideLink,
            hideImage: widget.hideImage,
            hideCode: widget.hideCode,
            hideBulletedList: widget.hideBulletedList,
            hideNumberedList: widget.hideNumberedList,
            hideCheckbox: widget.hideCheckbox,
            hideQuote: widget.hideQuote,
            hideHorizontalRule: widget.hideHorizontalRule,
            headingTooltip: widget.headingTooltip,
            boldTooltip: widget.boldTooltip,
            italicTooltip: widget.italicTooltip,
            strikethroughTooltip: widget.strikethroughTooltip,
            linkTooltip: widget.linkTooltip,
            imageTooltip: widget.imageTooltip,
            codeTooltip: widget.codeTooltip,
            bulletedListTooltip: widget.bulletedListTooltip,
            numberedListTooltip: widget.numberedListTooltip,
            checkboxTooltip: widget.checkboxTooltip,
            quoteTooltip: widget.quoteTooltip,
            horizontalRuleTooltip: widget.horizontalRuleTooltip,
          ),
        ),
        if (widget.useIncludedTextField) const SizedBox(height: 4.0),
        if (widget.useIncludedTextField)
          TextField(
            controller: widget.useIncludedTextField
                ? _includedController
                : widget.controller,
            focusNode: widget.useIncludedTextField
                ? _includedFocusNode
                : widget.focusNode,
            minLines: 1,
            maxLines: null,
            decoration: const InputDecoration(
              hintText: 'Your markdown text',
              labelText: 'Text field',
              border: OutlineInputBorder(),
            ),
          ),
      ],
    );
  }
}
