import 'package:flutter/material.dart';
void main() => runApp(const AlignmentDemoApp());

class AlignmentDemoApp extends StatelessWidget {
  const AlignmentDemoApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AlignmentDemoPage(),
      );
}

class AlignmentDemoPage extends StatelessWidget {
  const AlignmentDemoPage({super.key});

 
  static const _cases = [
    (MainAxisAlignment.start, 'start', '头像和姓名从左侧起点排（默认值）'),
    (MainAxisAlignment.center, 'center', '头像和姓名整体居中，两端留白相等'),
    (MainAxisAlignment.end, 'end', '头像和姓名整体靠右'),
    (MainAxisAlignment.spaceBetween, 'spaceBetween', '头像贴最左、姓名贴最右'),
    (MainAxisAlignment.spaceAround, 'spaceAround', '两组内容两侧间隙相等（两端间隙减半）'),
    (MainAxisAlignment.spaceEvenly, 'spaceEvenly', '所有间隙完全相等（含两端）'),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('任务1：名片六种对齐')),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            for (var i = 0; i < _cases.length; i++)
              _AlignmentCase(
                index: i + 1,
                alignment: _cases[i].$1,
                name: _cases[i].$2,
                desc: _cases[i].$3,
              ),
          ],
        ),
      );
}

/// 单个对齐场景：标题（含参数名）+ 说明 + 灰底名片头部演示条
class _AlignmentCase extends StatelessWidget {
  const _AlignmentCase({
    required this.index,
    required this.alignment,
    required this.name,
    required this.desc,
  });

  final int index;
  final MainAxisAlignment alignment;
  final String name;
  final String desc;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$index. mainAxisAlignment: $name',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text(desc, style: const TextStyle(color: Colors.black54)),
          const SizedBox(height: 8),
          Container(
            height: 72,
            padding: const EdgeInsets.symmetric(vertical: 8),
            color: const Color(0xFFE0E0E0),
            child: Row(
              mainAxisAlignment: alignment,
              children: const [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.teal,
                  child: Text('赵', style: TextStyle(color: Colors.white)),
                ),
                SizedBox(width: 8),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('赵昱珊', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('计算机大二学生',
                        style: TextStyle(color: Colors.black54, fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      );
}
