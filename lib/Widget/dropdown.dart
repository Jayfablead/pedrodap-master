import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MultiSelect extends StatefulWidget {
  final List<String> items;

  const MultiSelect({Key? key, required this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  // this variable holds the selected items
  final List<String> _selectedItems = [];

// This function is triggered when a checkbox is checked or unchecked
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  // this function is called when the Cancel button is pressed
  void _cancel() {
    Navigator.pop(context);
  }

// this function is called when the Submit button is tapped
  void _submit() {
    Navigator.pop(context, _selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black,
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map((item) => Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: Colors.white,
                    ),
                    child: CheckboxListTile(
                      value: _selectedItems.contains(item),
                      title: Text(
                        item,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Meta1',
                            fontWeight: FontWeight.w500,
                            fontSize: 11.sp),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (isChecked) => _itemChange(item, isChecked!),
                    ),
                  ))
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _cancel,
          child: Text(
            'Cancel',
            style: TextStyle(
                color: Colors.grey,
                fontFamily: 'Meta1',
                fontWeight: FontWeight.w500,
                fontSize: 11.sp),
          ),
        ),
        InkWell(
          onTap: _submit,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.white),
            height: 4.5.h,
            width: MediaQuery.of(context).size.width * 0.25,
            child: Text(
              "Done",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Meta1',
                  fontWeight: FontWeight.normal,
                  fontSize: 13.sp),
            ),
          ),
        ),
      ],
    );
  }
}
