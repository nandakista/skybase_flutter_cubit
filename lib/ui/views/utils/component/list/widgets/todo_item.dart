import 'package:flutter/material.dart';
import 'package:skybase/ui/views/utils/component/list/widgets/expandable_sub_item.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({
    super.key,
    required this.subItemCount,
    required this.onDone,
    required this.onDoneSub,
    required this.onTap,
    required this.child,
    required this.subItemBuilder,
  });

  final Widget child;
  final int subItemCount;
  final IndexedWidgetBuilder subItemBuilder;
  final VoidCallback onDone;
  final void Function(BuildContext context, int index) onDoneSub;
  final VoidCallback onTap;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState<T> extends State<TodoItem> {
  bool isExpand = false;
  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 8),
              InkWell(
                onTap: () {
                  setState(() {
                    isDone = !isDone;
                  });
                  widget.onDone();
                },
                child:
                Icon(isDone ? Icons.check_circle : Icons.circle_outlined),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: InkWell(
                  onTap: widget.onTap,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 16),
                    child: widget.child,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isExpand = !isExpand;
                  });
                },
                child: Icon(
                  isExpand
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
          if (isExpand)
            ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.subItemCount,
              itemBuilder: (context, index) {
                return ExpandableSubItem(
                  onDoneSub: () {
                    widget.onDoneSub(context, index);
                  },
                  child: widget.subItemBuilder(context, index),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 4);
              },
            ),
        ],
      ),
    );
  }
}