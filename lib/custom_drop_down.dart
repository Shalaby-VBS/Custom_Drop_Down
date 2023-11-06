import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  final List<String> list;
  final Function(String value)? selectedValue;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const CustomDropDown({
    super.key,
    required this.list,
    this.selectedValue,
    this.height,
    this.width,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String? selectedItem = "Select item";

  void setItemType(value) {
    selectedItem = value;
    widget.selectedValue!(value);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: widget.height ?? MediaQuery.of(context).size.height * 0.06,
      width: widget.width ?? MediaQuery.of(context).size.width * 1,
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.white.withOpacity(0.50),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: true,
            isDense: true,
            hint: Text(selectedItem.toString()),
            icon: Icon(
              Icons.arrow_drop_down_rounded,
              color: widget.foregroundColor ?? Colors.white,
            ),
            iconSize: MediaQuery.of(context).size.width * 0.07,
            dropdownColor:
                widget.backgroundColor ?? Colors.white.withOpacity(0.7),
            borderRadius: BorderRadius.circular(10),
            items: widget.list.map((String cast) {
              return DropdownMenuItem<String>(
                value: cast,
                child: Text(
                  cast,
                  style: TextStyle(
                    color: widget.foregroundColor ?? Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.038,
                  ),
                ),
              );
            }).toList(),
            onChanged: (value) {
              setItemType(value);
            },
          ),
        ),
      ),
    );
  }
}
