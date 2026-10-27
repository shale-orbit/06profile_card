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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 头像区 + 姓名与签名（两行 Text）
              const Row(children: [
                CircleAvatar(radius: 28, child: Text('赵')),
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
              // 统计条：三个 Expanded 数字块
              Row(children: [
                for (final e in const [('7', '课程'), ('6', '项目'), ('2', '证书')])
                  Expanded(
                    child: Column(children: [
                      Text(e.$1),
                      Text(e.$2),
                    ]),
                  ),
              ]),
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
      );
}