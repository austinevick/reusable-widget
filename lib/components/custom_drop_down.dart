import 'package:flutter/material.dart';

abstract class DropdownDisplayable {
  String get displayText;
  Widget? get displayImage;
}

class DropdownStringItem implements DropdownDisplayable {
  final String value;

  DropdownStringItem(this.value);

  @override
  String get displayText => value;

  @override
  Widget? get displayImage => null;
}

class DropdownItemModel implements DropdownDisplayable {
  final String text;
  final Widget image;

  DropdownItemModel({required this.text, required this.image});

  @override
  String get displayText => text;

  @override
  Widget get displayImage => image;
}

class AppDropDown<T extends DropdownDisplayable> extends StatefulWidget {
  final double? horizontalMargin;
  final String? labelText;
  final String? hintText;
  final double? widgetHeight, widgetWidth;
  final List<T> items;
  final void Function(T?)? onChanged;

  const AppDropDown({
    Key? key,
    required this.items,
    this.onChanged,
    this.horizontalMargin,
    this.labelText,
    this.widgetHeight = 44,
    this.widgetWidth,
    this.hintText = 'Select Item',
  }) : super(key: key);

  @override
  State<AppDropDown<T>> createState() => _AppDropDownState<T>();
}

class _AppDropDownState<T extends DropdownDisplayable>
    extends State<AppDropDown<T>> {
  bool isFocused = false;
  final _focusNode = FocusNode();
  bool isDropdownOpened = false;

  late GlobalKey actionKey;
  late double renderHeight, renderWidth, xPos, yPos;
  late OverlayEntry? floatingDropDown;
  T? selectedValue;

  @override
  void initState() {
    actionKey = LabeledGlobalKey(widget.labelText ?? "AppDropDown");
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void findDropDownData() {
    RenderBox? renderBox =
        actionKey.currentContext!.findRenderObject() as RenderBox?;
    renderHeight = renderBox!.size.height;
    renderWidth = renderBox.size.width;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    xPos = offset.dx;
    yPos = offset.dy;
  }

  OverlayEntry createFloatingDropDown() {
    // Calculate the maximum height for the dropdown based on the number of items
    const int maxVisibleItems = 7;
    final int itemCount = widget.items.length;
    final double maxHeight = (itemCount <= maxVisibleItems)
        ? itemCount *
            widget
                .widgetHeight! // Adjust the height based on the number of items
        : maxVisibleItems * widget.widgetHeight!;

    return OverlayEntry(builder: (context) {
      return Positioned(
        left: xPos,
        width: renderWidth,
        top: yPos + renderHeight + 6,
        height:
            maxHeight, // Limit the height to show a maximum of 7 items if needed
        child: DropDown<T>(
          itemHeight: widget.widgetHeight!,
          items: widget.items,
          onItemSelected: (item) {
            _onItemSelected(item);
          },
        ),
      );
    });
  }

  void _onItemSelected(T item) {
    setState(() {
      selectedValue = item;
      floatingDropDown!.remove();
      isDropdownOpened = false;
      // Call the onChanged callback to handle the selected value
      if (widget.onChanged != null) {
        widget.onChanged!(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Color borderColor() {
      return isFocused ? Colors.grey : Colors.white12;
    }

    double borderWidth() {
      return isFocused ? 1 : 1;
    }

    Color focusColor() {
      return isFocused ? const Color(0xffD5CFE3) : Colors.transparent;
    }

    return WillPopScope(
      onWillPop: () async {
        if (isDropdownOpened) {
          floatingDropDown!.remove();
          setState(() {
            isDropdownOpened = false;
          });
          return false; // Do not close the dropdown immediately
        }
        return true; // Allow the widget to be popped from the Navigator stack.
      },
      child: InkWell(
        key: actionKey,
        onTap: () {
          // Request focus when the container is tapped
          _focusNode.requestFocus();
          setState(() {
            if (isDropdownOpened) {
              floatingDropDown!.remove();
            } else {
              findDropDownData();
              floatingDropDown = createFloatingDropDown();
              Overlay.of(context).insert(floatingDropDown!);
            }
            isDropdownOpened = !isDropdownOpened;
          });
        },
        child: Focus(
          focusNode: _focusNode,
          onFocusChange: (hasFocus) {
            setState(() {
              isFocused = hasFocus;
              if (!hasFocus && isDropdownOpened) {
                floatingDropDown!.remove();
                isDropdownOpened = false;
              }
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.labelText != null) ...[
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: SelectableText(widget.labelText!)),
                const SizedBox(height: 8),
              ],
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  height: widget.widgetHeight,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: borderColor(),
                      width: borderWidth(),
                    ),
                    borderRadius: BorderRadius.circular(9),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 0,
                        spreadRadius: 4,
                        offset: const Offset(0, 0),
                        color: focusColor(),
                      ),
                    ],
                  ),
                  margin: EdgeInsets.symmetric(
                      horizontal: widget.horizontalMargin ?? 0),
                  child: Row(
                    children: [
                      if (selectedValue != null) ...[
                        Text(
                          selectedValue!.displayText,
                        )
                      ] else
                        Text(
                          '${widget.hintText}',
                        ),
                      const Spacer(),
                      Icon(
                        isDropdownOpened
                            ? Icons.keyboard_arrow_up
                            : Icons
                                .keyboard_arrow_down, // Replace with your actual asset path
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DropDown<T extends DropdownDisplayable> extends StatelessWidget {
  final double itemHeight;
  final List<T> items;
  final void Function(T) onItemSelected;

  const DropDown({
    Key? key,
    required this.itemHeight,
    required this.items,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        height: items.length * itemHeight,
        child: ListView.builder(
          itemCount: items.length,
          itemExtent: itemHeight,
          itemBuilder: (context, index) => DropDownItem<T>(
            item: items[index],
            onTap: () {
              onItemSelected(items[index]);
            },
          ),
        ),
      ),
    );
  }
}

class DropDownItem<T extends DropdownDisplayable> extends StatefulWidget {
  final T item;
  final VoidCallback onTap;

  const DropDownItem({
    Key? key,
    required this.item,
    required this.onTap,
  }) : super(key: key);

  @override
  State<DropDownItem<T>> createState() => _DropDownItemState<T>();
}

class _DropDownItemState<T extends DropdownDisplayable>
    extends State<DropDownItem<T>> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          widget.onTap();
        });
      },
      child: Container(
        height: widget.item.displayImage != null ? 44.0 : 44.0,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        child: Row(
          children: [
            if (widget.item.displayImage != null) ...[
              widget.item.displayImage!,
              const SizedBox(
                width: 8,
              )
            ],
            Text(
              widget.item.displayText,
            ),
            const Spacer(),
            if (isSelected == true)
              const Icon(
                Icons.check, // Replace with your actual asset path
                color: Colors.grey,
              ),
          ],
        ),
      ),
    );
  }
}

/**How To Use the dropdown
 * This is For just Text item
 * Use selectedItem as controller for what you need
 *   DropdownStringItem selectedItem = DropdownStringItem(
    'Item 1',
  );

Use The Following Model To get The string you need
  List<DropdownStringItem> items = [
    DropdownStringItem(
      'Item 1',
    ),
    DropdownStringItem(
      'Item 2',
    ),
    DropdownStringItem(
      'Item 3',
    ),
    // Add more items as needed
  ];
 * 
 * Call This wherever you need
 * AppDropDown<DropdownStringItem>(
                items: items,
                labelText: 'Employee Type',
                hintText: 'Employee Type',
                widgetHeight: heightSize(context, 44),
                onChanged: (item) {
                  setState(() {
                    selectedItem = item!;
                    print(selectedItem.text);
                  });
                },
              )


 * This is for Text amd Widget(eg Image item)
 * Use selectedItem as controller for what you need
 *  DropdownItemModel selectedItem = DropdownItemModel(
    text: 'Item 1',
    image: Icon(Icons.ac_unit),
  );


  List<DropdownItemModel> items = [
    DropdownItemModel(
      text: 'Item 1',
      image: Icon(Icons.ac_unit),
    ),
    DropdownItemModel(
      text: 'Item 2',
      image: Icon(Icons.access_alarm),
    ),
    DropdownItemModel(
      text: 'Item 3',
      image: Icon(Icons.access_time),
    ),
    // Add more items as needed
  ];
  
 *Call this wherever you need
 * AppDropDown<DropdownItemModel>(
                items: items,
                labelText: 'Employee Type',
                hintText: 'Employee Type',
                widgetHeight: heightSize(context, 44),
                onChanged: (item) {
                  setState(() {
                    selectedItem = item!;
                    print(selectedItem.text);
                  });
                },
              )
              * 
 */