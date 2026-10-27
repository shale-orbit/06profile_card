import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
        home: ProfileCard(),
      );
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('个人名片')),
        body: Center(
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
                const Row(children: [
                  Stack(clipBehavior: Clip.none, children: [
                    CircleAvatar(radius: 28, child: Text('赵')),
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
                        Text('赵昱珊'),
                        Text('计算机大二学生'),
                      ],
                    ),
                  ),
                ]),
                const SizedBox(height: 12),
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
                          Text(e.$1),
                          Text(e.$2),
                        ]),
                      ),
                  ]),
                ),
                const SizedBox(height: 12),
                // 标签云（Wrap）
                const Wrap(spacing: 8, runSpacing: 6, children: [
                  Text('Flutter'),
                  Text('Java'),
                  Text('美食'),
                  Text('娱乐'),
                ]),
              ],
            ),
          ),
        ),
      );
}
