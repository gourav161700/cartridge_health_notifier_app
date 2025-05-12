import 'package:flutter/material.dart';

class AddNewFilterPopup {
  static final List<String> _dropdownItems = ['001'];
  static String? _selectedItem;

  static void showFilterDialog(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(
          // needed to update UI inside the dialog
          builder: (context, setState) {
            return AlertDialog(
              title: Text("Choosed Filters"),

              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: DropdownButton<String>(
                      value: _selectedItem,
                      hint: Text("Choosed filter"),
                      isExpanded: true,
                      items:
                          _dropdownItems.map((item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                'Filter id : $item',
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedItem = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        int newIndex = _dropdownItems.length + 1;
                        _dropdownItems.add('Filter $newIndex');
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      "Add New Filter",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text("Ok", style: TextStyle(color: Colors.white)),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
