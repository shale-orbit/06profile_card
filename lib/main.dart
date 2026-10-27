import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
          useMaterial3: true,
        ),
        home: const ProfileCard(),
      );
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('个人名片')),
        body: Center(
          // 整体卡片容器：340 宽、16 留白、圆角 12、阴影（与源码一致）
          child: Container(
            width: 340,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2)),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 头像区（teal 底白字 + Stack/Positioned 在线点）+ 姓名与签名
                const Row(children: [
                  Stack(clipBehavior: Clip.none, children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.teal,
                      child: Text('赵', style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: CircleAvatar(radius: 6, backgroundColor: Colors.green),
                    ),
                  ]),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('赵昱珊',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                        Text('计算机大二学生', style: TextStyle(color: Colors.black54)),
                      ],
                    ),
                  ),
                ]),
                const SizedBox(height: 12),
                // 统计条容器（步骤二要求保留）：圆角 + 底色 + 留白
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(children: [
                    for (final e in const [('7', '课程'), ('6', '项目'), ('2', '证书')])
                      Expanded(
                        child: Column(children: [
                          Text(e.$1,
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          Text(e.$2, style: const TextStyle(color: Colors.black54)),
                        ]),
                      ),
                  ]),
                ),
                const SizedBox(height: 12),
                // 标签云（Chip）
                const Wrap(spacing: 8, runSpacing: 6, children: [
                  Chip(label: Text('Flutter')),
                  Chip(label: Text('Java')),
                  Chip(label: Text('美食')),
                  Chip(label: Text('娱乐')),
                ]),
              ],
            ),
          ),
        ),
      );
}
