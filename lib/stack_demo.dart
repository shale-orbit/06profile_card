import 'package:flutter/material.dart';
void main() => runApp(const StackDemoApp());

class StackDemoApp extends StatelessWidget {
  const StackDemoApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StackDemoPage(),
      );
}

class StackDemoPage extends StatelessWidget {
  const StackDemoPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('任务3：层叠角标')),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // 场景1：头像徽标（与名片页一致）
            const Text('场景1：头像徽标',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const Text(
                'Stack(clipBehavior: Clip.none) + Positioned(right: 0, bottom: 0) + CircleAvatar(radius: 6)',
                style: TextStyle(color: Colors.black54, fontSize: 12)),
            const SizedBox(height: 8),
            Container(
              height: 100,
              color: const Color(0xFFE0E0E0),
              alignment: Alignment.center,
              child: const Stack(clipBehavior: Clip.none, children: [
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
            ),
            const SizedBox(height: 4),
            const Text('记录：绿色在线点叠在头像右下角，位置由 Positioned(right: 0, bottom: 0) 决定',
                style: TextStyle(color: Colors.black87, fontSize: 12)),
            const SizedBox(height: 24),
            // 场景2：图片浮层文字
            const Text('场景2：图片浮层文字',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const Text('Stack(fit: StackFit.expand) + Positioned(left: 12, bottom: 12)，文字垫半透明黑底',
                style: TextStyle(color: Colors.black54, fontSize: 12)),
            const SizedBox(height: 8),
            Container(
              height: 180,
              color: const Color(0xFFE0E0E0),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset('assets/campus.jpg', fit: BoxFit.cover),
                  Positioned(
                    left: 12,
                    bottom: 12,
                    child: Container(
                      color: Colors.black45,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: const Text('赵昱珊 · 计算机大二学生',
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            const Text('记录：文字浮层叠在图片左下角，位置由 Positioned(left: 12, bottom: 12) 决定',
                style: TextStyle(color: Colors.black87, fontSize: 12)),
          ],
        ),
      );
}
