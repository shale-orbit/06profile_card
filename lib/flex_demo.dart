import 'package:flutter/material.dart';
void main() => runApp(const FlexDemoApp());

class FlexDemoApp extends StatelessWidget {
  const FlexDemoApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FlexDemoPage(),
      );
}

class FlexDemoPage extends StatelessWidget {
  const FlexDemoPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('任务2：弹性分配实验')),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            _Case(
              title: '1. 基准：三栏 2:1:1',
              code: 'Expanded(flex: 2) + Expanded(flex: 1) + Expanded(flex: 1)',
              record: '记录：三栏宽度比 = 2:1:1，第一栏正好占整行一半，栏内文字居中',
              longText: false,
              ellipsis: false,
              useExpanded: true,
            ),
            _Case(
              title: '2. 第一栏内容超长（默认行为）',
              code: '布局同上，仅把第一栏文字改长',
              record: '记录：栏宽仍是 2 份不变；文字在栏内自动换行；整行被撑高；无溢出警告',
              longText: true,
              ellipsis: false,
              useExpanded: true,
            ),
            _Case(
              title: '3. 超长 + 限制单行省略号',
              code: 'Text(maxLines: 1, overflow: TextOverflow.ellipsis)',
              record: '记录：栏宽不变；只显示一行，放不下的部分变成“…”',
              longText: true,
              ellipsis: true,
              useExpanded: true,
            ),
            _Case(
              title: '4. 对照组：不用 Expanded',
              code: 'Row 直接包三个 Container（无 flex 约束）',
              record: '记录：各栏按内容自然宽度排列；超长文字不换行；整行向右溢出，出现黄黑条纹，控制台报 RenderFlex overflowed',
              longText: true,
              ellipsis: false,
              useExpanded: false,
            ),
          ],
        ),
      );
}


class _Case extends StatelessWidget {
  const _Case({
    required this.title,
    required this.code,
    required this.record,
    required this.longText,
    required this.ellipsis,
    required this.useExpanded,
  });

  final String title;
  final String code;
  final String record;
  final bool longText;
  final bool ellipsis;
  final bool useExpanded;

  static const _short = '7 课程';
  static const _long =
      '7 门课程：Flutter 移动开发、Java 程序设计、数据结构、操作系统、计算机网络、数据库原理、软件工程导论、Web 前端基础、高等数学、线性代数、概率统计';

  Widget _col(int flex, Color color, String text) {
    final box = Container(
      color: color,
      padding: const EdgeInsets.all(8),
      child: Text(
        text,
        maxLines: ellipsis ? 1 : null,
        overflow: ellipsis ? TextOverflow.ellipsis : null,
      ),
    );
    return useExpanded ? Expanded(flex: flex, child: box) : box;
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text(code, style: const TextStyle(color: Colors.black54, fontSize: 12)),
          const SizedBox(height: 8),
          Row(children: [
            _col(2, const Color(0xFFB2DFDB), longText ? _long : _short),
            _col(1, const Color(0xFFFFE0B2), '6 项目'),
            _col(1, const Color(0xFFBBDEFB), '2 证书'),
          ]),
          const SizedBox(height: 4),
          Text(record, style: const TextStyle(color: Colors.black87, fontSize: 12)),
          const SizedBox(height: 24),
        ],
      );
}
