import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:skybase/ui/views/utils/component/list/widgets/todo_item.dart';
import 'package:skybase/ui/widgets/sky_appbar.dart';

class ListSamplePage extends StatelessWidget {
  static const String route = 'list';

  const ListSamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    List dataTugas = [
      'Tugas 1 he',
      'Tugas 2 hehe',
      'Tugas 3 hehehe',
      'Tugas 4 HEHEHEHE',
    ];

    List subTugas = [
      'Sub tugas 1 he',
      'Sub tugas 2 hehe',
      'Sub tugas 3 hehehe',
    ];

    return Scaffold(
      appBar: SkyAppBar.primary(title: 'List Utility'),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: dataTugas.length,
        itemBuilder: (context, index) {
          final item = dataTugas[index];
          return TodoItem(
            subItemCount: subTugas.length,
            subItemBuilder: (context, index) {
              final subItem = subTugas[index];
              return Text(subItem);
            },
            child: Text(item),
            onTap: () {
              //
              log('To detail');
            },
            onDone: () {
              log('Done Tugas');
            },
            onDoneSub: (context, index) {
              final subItem = subTugas[index];
              log('Done $subItem');
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 4);
        },
      ),
    );
  }
}
