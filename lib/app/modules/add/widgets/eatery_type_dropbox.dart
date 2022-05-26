import 'package:flutter/material.dart';
import 'package:food_shopping_app/app/model/eatery.dart';

class EateryTypeDropbox extends StatefulWidget {
  final TextEditingController controller;

  const EateryTypeDropbox({Key? key, required this.controller})
      : super(key: key);

  @override
  State<EateryTypeDropbox> createState() => _EateryTypeDropboxState();
}

class _EateryTypeDropboxState extends State<EateryTypeDropbox> {
  String _currentSelectedValue = EateryType.TYPE_FOOD;

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      builder: (FormFieldState<String> state) {
        return InputDecorator(
          decoration: InputDecoration(
              hintText: 'Please select expense',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _currentSelectedValue,
              isDense: true,
              onChanged: (String? newValue) {
                setState(() {
                  _currentSelectedValue = newValue ?? EateryType.TYPE_OTHER;
                  widget.controller.text = _currentSelectedValue;
                });
              },
              items: EateryType.TYPE_VALUES.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
