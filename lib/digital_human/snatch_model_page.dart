import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';

class SnatchModelPage extends StatefulWidget {
  const SnatchModelPage({super.key});

  @override
  State<SnatchModelPage> createState() => _KickModelPageState();
}

class _KickModelPageState extends State<SnatchModelPage> {
  // 模型路径
  final String modelPath = 'assets/snatch.glb';

  // 控制器
  final O3DController controller = O3DController();

  // 调试信息
  String debugInfo = '正在加载模型...';

  // 是否正在播放动画
  bool isPlaying = false;

  // 当前选择的动画名称
  String? currentAnimationName;

  // 已知的动画列表
  final List<String> knownAnimations = [
    'Animation', // Kick 模型可能的动画名称
  ];

  @override
  void initState() {
    super.initState();

    // 延迟加载动画信息
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;

      setState(() {
        debugInfo = '模型加载完成，可以检查动画或直接播放动画。\n'
            '已知的动画: ${knownAnimations.join(", ")}';
      });
    });
  }

  // 检查可用的动画
  void checkAnimations() {
    setState(() {
      debugInfo = '正在检查动画...\n'
          '请等待模型完全加载...';
    });

    // 添加延迟以确保模型已加载
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;

      try {
        // 尝试获取动画列表
        controller.availableAnimations().then((animations) {
          setState(() {
            if (animations.isEmpty) {
              debugInfo = '没有找到动画！\n'
                  '这个模型可能没有动画。';
            } else {
              debugInfo = '找到以下动画:\n'
                  '${animations.join(", ")}\n'
                  '共 ${animations.length} 个动画\n'
                  '现在可以尝试播放这些动画。';
            }
          });
        }).catchError((error) {
          setState(() {
            debugInfo = '检查动画时出错: $error\n'
                '这通常是因为模型尚未完全加载。\n'
                '请稍等片刻再试。';
          });
        });
      } catch (e) {
        setState(() {
          debugInfo = '检查动画时发生异常: $e';
        });
      }
    });
  }

  // 显示动画选择对话框
  void showAnimationSelector() {
    try {
      setState(() {
        debugInfo = '正在加载动画列表...\n'
            '请稍等...';
      });

      // 添加延迟以确保模型已加载
      Future.delayed(const Duration(seconds: 2), () {
        if (!mounted) return;

        // 尝试获取动画列表
        controller.availableAnimations().then((animations) {
          if (!mounted) return;

          if (animations.isEmpty) {
            setState(() {
              debugInfo = '没有找到动画！';
            });
            return;
          }

          // 显示动画选择对话框
          showDialog(
            context: context,
            builder: (dialogContext) => AlertDialog(
              title: const Text('选择动画'),
              content: SizedBox(
                width: double.maxFinite,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: animations.length,
                  itemBuilder: (_, index) {
                    final animation = animations[index];
                    return ListTile(
                      title: Text(animation),
                      selected: currentAnimationName == animation,
                      onTap: () {
                        Navigator.of(dialogContext).pop();
                        setState(() {
                          currentAnimationName = animation;
                          debugInfo = '已选择动画: $animation\n'
                              '点击"播放动画"开始播放。';
                        });
                      },
                    );
                  },
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(dialogContext).pop(),
                  child: const Text('取消'),
                ),
              ],
            ),
          );
        }).catchError((error) {
          if (!mounted) return;

          setState(() {
            debugInfo = '加载动画列表时出错: $error\n'
                '尝试使用已知的动画列表。';
          });

          // 如果无法获取动画列表，使用已知的动画列表
          showDialog(
            context: context,
            builder: (dialogContext) => AlertDialog(
              title: const Text('选择已知动画'),
              content: SizedBox(
                width: double.maxFinite,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: knownAnimations.length,
                  itemBuilder: (_, index) {
                    final animation = knownAnimations[index];
                    return ListTile(
                      title: Text(animation),
                      selected: currentAnimationName == animation,
                      onTap: () {
                        Navigator.of(dialogContext).pop();
                        setState(() {
                          currentAnimationName = animation;
                          debugInfo = '已选择动画: $animation\n'
                              '点击"播放动画"开始播放。';
                        });
                      },
                    );
                  },
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(dialogContext).pop(),
                  child: const Text('取消'),
                ),
              ],
            ),
          );
        });
      });
    } catch (e) {
      setState(() {
        debugInfo = '显示动画选择器时出错: $e';
      });
    }
  }

  // 播放动画
  void playAnimation() {
    try {
      setState(() {
        debugInfo = '正在尝试播放动画...\n'
            '请等待模型完全加载...';
        isPlaying = true;
      });

      // 添加延迟以确保模型已加载
      Future.delayed(const Duration(seconds: 1), () {
        if (!mounted) return;

        try {
          // 选择要播放的动画
          String animationName;

          // 如果用户已选择动画，则使用该动画
          if (currentAnimationName != null) {
            animationName = currentAnimationName!;
          }
          // 否则使用默认动画
          else {
            animationName = 'Animation'; // Kick 模型的默认动画
          }

          // 设置动画名称并播放
          controller.animationName = animationName;
          controller.play();

          setState(() {
            currentAnimationName = animationName;
            debugInfo = '正在播放动画: $animationName';
          });
        } catch (e) {
          setState(() {
            debugInfo = '播放动画时出错: $e\n'
                '尝试使用直接播放方法...';
          });

          // 尝试直接播放
          try {
            controller.play();

            setState(() {
              debugInfo = '正在使用直接播放方法。\n'
                  '如果看到动画，说明模型有动画。';
            });
          } catch (e) {
            setState(() {
              debugInfo = '直接播放方法也失败: $e\n'
                  '这个模型可能没有动画或不兼容。';
              isPlaying = false;
            });
          }
        }
      });
    } catch (e) {
      setState(() {
        debugInfo = '播放动画时出错: $e';
        isPlaying = false;
      });
    }
  }

  // 暂停动画
  void pauseAnimation() {
    try {
      controller.pause();

      setState(() {
        debugInfo = '已暂停动画';
        isPlaying = false;
      });
    } catch (e) {
      setState(() {
        debugInfo = '暂停动画时出错: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("高抓"),
        actions: [
          // 帮助按钮
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('帮助'),
                  content: const SingleChildScrollView(
                    child: Text(
                      '这个页面显示 Kick 模型及其动画。\n\n'
                      '- 点击"检查动画"查看模型中的可用动画\n'
                      '- 点击"选择动画"从列表中选择要播放的动画\n'
                      '- 点击"播放动画"开始播放当前选择的动画\n'
                      '- 点击"暂停动画"暂停当前播放的动画\n\n'
                      'Kick 模型可能的动画名称为：Animation',
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('关闭'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // 3D 模型显示区域
          Expanded(
            child: O3D(
              src: modelPath,
              controller: controller,
              autoPlay: false,
              autoRotate: true,
              cameraControls: true,
            ),
          ),

          // 控制按钮区域
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                // 检查动画按钮
                ElevatedButton(
                  onPressed: checkAnimations,
                  child: const Text('检查动画'),
                ),

                // 选择动画按钮
                ElevatedButton(
                  onPressed: showAnimationSelector,
                  child: const Text('选择动画'),
                ),

                // 播放/暂停按钮
                ElevatedButton(
                  onPressed: isPlaying ? pauseAnimation : playAnimation,
                  child: Text(isPlaying ? '暂停动画' : '播放动画'),
                ),
              ],
            ),
          ),

          // 当前动画信息
          if (currentAnimationName != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '当前动画: $currentAnimationName',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

          // 调试信息区域
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              '调试信息:\n$debugInfo',
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // O3DController 没有 dispose 方法
    // 我们只需要调用 super.dispose()
    super.dispose();
  }
}
