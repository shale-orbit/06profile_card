# profile_card

Flutter 个人名片练习项目，配套课堂"布局与容器"实验：从结构骨架 → 容器装饰 → 规范验收，再到四项自主实践（对齐、弹性分配、层叠角标、容器美化）。

## 环境

| 项目 | 版本 |
|------|------|
| Flutter | 3.47.4（stable） |
| Dart | 3.13.3 |
| DevTools | 2.60.0 |
| 运行目标 | Web（Edge 浏览器，debug 模式） |

## 运行

克隆或下载本仓库后，进入项目根目录（`profile_card`）执行：

```powershell
flutter pub get
flutter run          # 运行名片主页（推荐选 Edge）
```

首次运行前请确认 `flutter doctor` 无报错，并已安装 Chrome / Edge 等浏览器作为 Web 运行设备。

三个自主实践演示页各自是独立入口，同样在项目根目录用 `-t` 指定：

```powershell
flutter run -t lib/alignment_demo.dart   # 任务 1：六种对齐场景
flutter run -t lib/flex_demo.dart        # 任务 2：弹性分配实验
flutter run -t lib/stack_demo.dart       # 任务 3：层叠角标
```

> 注意：改动了 `assets/` 或 `pubspec.yaml` 后热重载不生效，需按 `q` 退出后重新 `flutter run`。

## 目录结构

```
lib/
├── main.dart            # 名片主页（步骤一~三成果）
├── alignment_demo.dart  # 任务 1：mainAxisAlignment 六种取值对比
├── flex_demo.dart       # 任务 2：2:1:1 弹性分配 + 超长内容对照实验
└── stack_demo.dart      # 任务 3：头像徽标 + 图片浮层文字
assets/
└── campus.jpg           # 任务 3 使用的本地图片资源
```

## 名片页布局要点

- `Center` + 固定宽 `Container(width: 340)` 居中呈现卡片，`padding: 16`、圆角 12、下方柔和阴影
- 头像区：`Stack(clipBehavior: Clip.none)` 叠一个右下角绿点 `Positioned`，右侧 `Expanded` 包裹姓名与签名
- 统计条：`Row` 内三个 `Expanded`，各占 1/3 均分整行，浅灰底 `Container` + 圆角 8
- 标签云：`Wrap(spacing: 8, runSpacing: 6)` 自动换行，使用 `Chip` 组件

关键点：`Row` 负责横向排列，`Expanded` 负责分配剩余空间；去掉 `Expanded` 后子组件只按内容宽度收缩，内容超长会触发 `RenderFlex overflowed` 黄黑警告。

## 演示页说明

| 页面 | 变量 | 预期现象 |
|------|------|----------|
| alignment_demo | 仅 `mainAxisAlignment` 变化 | start / center / end / spaceBetween / spaceAround / spaceEvenly 六种排布 |
| flex_demo | 栏宽比例与文本长度 | 2:1:1 比例、默认换行、`maxLines + ellipsis` 省略、无 `Expanded` 时溢出 |
| stack_demo | 叠放位置 | 头像右下角徽标、图片左下角浮层文字 |

`flex_demo` 第 4 组溢出为**刻意设计的对照现象**，用于验证 `Expanded` 的作用，非代码缺陷。

## 验收方式

1. 终端无 `RenderFlex overflowed` 报错，页面无黄黑斜纹
2. 主要间距与规范一致（误差 ±4px 内）
3. DevTools → Widget Inspector 点选组件，核对实际尺寸：卡片宽 340，头像 56×56，绿点 12×12

## 常见问题

| 现象 | 原因与处理 |
|------|-----------|
| 终端按 `r` 无反应 | 终端未获得焦点，先点一下终端区域再按；若已显示命令提示符说明应用已退出，重新 `flutter run` |
| DevTools 页面白屏 | `flutter run` 需保持运行，对页面 `Ctrl+F5` 强制刷新并等待加载 |
| 图片显示红叉、`statusCode: 0` | Web 端跨域限制所限，故改用本地资源 `assets/`；资源变更后须重启应用而非热重载 |
| 页面出现黄黑斜纹 | 容器宽度不足导致 `RenderFlex overflowed`，检查 `Expanded` 是否缺失或窗口是否过窄 |

## 参考

- [Flutter 官方文档](https://docs.flutter.dev/)
- [Flutter 布局教程](https://docs.flutter.dev/ui/layout)
- [DevTools 使用指南](https://docs.flutter.dev/tools/devtools/overview)
