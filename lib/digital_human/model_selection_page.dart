import 'package:flutter/material.dart';
import 'package:flutter_application_1/digital_human/overheadsquat_model_page.dart';
import 'package:flutter_application_1/digital_human/snatch_model_page.dart';
import 'package:flutter_application_1/digital_human/swat_model_page.dart';
import 'package:flutter_application_1/digital_human/kick_model_page.dart';
import 'package:flutter_application_1/chat/presentation/chat_page.dart';

class ModelSelectionPage extends StatelessWidget {
  const ModelSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Personal Coach"),
        actions: [
          // 聊天按钮
          IconButton(
            icon: const Icon(Icons.chat),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChatPage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // 标题
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "学习动作",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // 模型列表
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                // Swat 模型
                _buildModelCard(
                  context,
                  title: "波比跳",
                  description: "非常好的减脂动作,提高心肺功能",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SwatModelPage()),
                    );
                  },
                ),

                const SizedBox(height: 16),

                // Kick 模型
                _buildModelCard(
                  context,
                  title: "踢腿",
                  description: "格斗动作",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const KickModelPage()),
                    );
                  },
                ),

                //过头蹲
                _buildModelCard(
                  context,
                  title: "过头蹲",
                  description: "筛查关节灵活度和柔韧性",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OverheadsquatModelPage()),
                    );
                  },
                ),

                //snatch
                _buildModelCard(
                  context,
                  title: "高抓",
                  description: "爆发力训练",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SnatchModelPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 构建模型卡片
  Widget _buildModelCard(
    BuildContext context, {
    required String title,
    required String description,
    String? imagePath,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 模型预览图（如果有的话）
            if (imagePath != null)
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  imagePath,
                  height: 150,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    // 如果图片加载失败，显示占位符
                    return Container(
                      height: 150,
                      color: Colors.grey[300],
                      child: const Icon(
                        Icons.image,
                        size: 50,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ),

            // 模型信息
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: onTap,
                        child: const Text("学习动作"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
