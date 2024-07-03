import 'package:flutter/material.dart';

class GrayBackgroundChip extends StatefulWidget {
  final Widget label;

  const GrayBackgroundChip({Key? key, required this.label}) : super(key: key);

  @override
  _GrayBackgroundChipState createState() => _GrayBackgroundChipState();
}

class _GrayBackgroundChipState extends State<GrayBackgroundChip> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Chip(
        label: widget.label,
        backgroundColor: _isSelected ? Colors.green : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Colors.green),
        ),
      ),
    );
  }
}
