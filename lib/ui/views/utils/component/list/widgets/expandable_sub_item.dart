import 'package:flutter/material.dart';

class ExpandableSubItem extends StatefulWidget {
  const ExpandableSubItem({
    super.key,
    required this.onDoneSub,
    required this.child,
  });

  final VoidCallback onDoneSub;
  final Widget child;

  @override
  State<ExpandableSubItem> createState() => _ExpandableSubItemState();
}

class _ExpandableSubItemState extends State<ExpandableSubItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            widget.onDoneSub();
            setState(() {
              isSelected = !isSelected;
            });
          },
          icon: Icon(
            isSelected ? Icons.check_circle : Icons.circle_outlined,
          ),
        ),
        const SizedBox(width: 12),
        widget.child,
      ],
    );
  }
}