import 'package:flutter/material.dart';
import 'package:system_fonts/system_fonts.dart';

/// [SystemFontSelector] is a [DropdownMenu] widget that displays a list of all the available fonts in the system.
/// The user can select a font from the list and the font will be loaded and font name will be passed to the `onFontSelected` callback.
/// All the font names can be showed in their fontfamily if `isFontPreviewEnabled` is set to `true` but this will cause every font to be loaded.
/// Remember every font can be loaded once and if loaded, font will be available for app lifetime,
/// so if you somehow loaded every font once you can use font preview without any additional cost in every [SystemFontSelector] instance.
class SystemFontSelector extends StatefulWidget {
  const SystemFontSelector({
    this.width = 200,
    this.isFontPreviewEnabled = false,
    this.textStyle,
    this.onFontSelected,
    super.key,
  });

  final double width;
  final bool isFontPreviewEnabled;
  final TextStyle? textStyle;

  final Function(String)? onFontSelected;

  @override
  State<SystemFontSelector> createState() => _SystemFontSelectorState();
}

class _SystemFontSelectorState extends State<SystemFontSelector> {
  String? dropdownValue;
  List<String> fontNames = [];

  @override
  void initState() {
    super.initState();
    if (widget.isFontPreviewEnabled) {
      SystemFonts().loadAllFonts().then((value) => setState(() {
            fontNames = value;
          }));
    } else {
      fontNames = SystemFonts().getFontList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      width: widget.width,
      onSelected: (String? value) {
        setState(() {
          dropdownValue = value;
          widget.onFontSelected?.call(value ?? '');
        });
      },
      dropdownMenuEntries: fontNames.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(
          value: value,
          label: value,
          style: MenuItemButton.styleFrom(
              textStyle: widget.textStyle != null
                  ? widget.textStyle!.copyWith(fontFamily: widget.isFontPreviewEnabled ? value : null)
                  : Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontFamily: widget.isFontPreviewEnabled ? value : null, overflow: TextOverflow.ellipsis)),
        );
      }).toList(),
    );
  }
}
