import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/video_player_card.dart';
import '../widgets/video_list_item.dart';
import '../widgets/section_title.dart';

// Video detail screen for LMS
class VideoDetailScreen extends StatelessWidget {
  const VideoDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: AppColors.primaryColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text(
            'Video - User Interface Design For Beginner',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          titleSpacing: 0,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Video player section
            Padding(
              padding: const EdgeInsets.all(16),
              child: VideoPlayerCard(
                thumbnailUrl:
                    'https://via.placeholder.com/640x360/FF6B6B/FFFFFF?text=Video+Thumbnail',
                onPlayPressed: () {
                  // Handle play video
                },
              ),
            ),
            // Section title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: SectionTitle(title: 'Video Lainnya'),
            ),
            // List of other videos
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, index) {
                final videos = [
                  {
                    'thumbnail':
                        'https://via.placeholder.com/120x70/4ECDC4/FFFFFF?text=Video+1',
                    'title': 'Interaction Design',
                  },
                  {
                    'thumbnail':
                        'https://via.placeholder.com/120x70/45B7D1/FFFFFF?text=Video+2',
                    'title': 'Pengantar Desain Antarmuka Pengguna',
                  },
                  {
                    'thumbnail':
                        'https://via.placeholder.com/120x70/F7DC6F/FFFFFF?text=Video+3',
                    'title': '4 Teori Dasar Desain Antarmuka Pengguna',
                  },
                  {
                    'thumbnail':
                        'https://via.placeholder.com/120x70/BB8FCE/FFFFFF?text=Video+4',
                    'title': 'Tutorial Dasar Figma – UI/UX Design Software',
                  },
                ];
                final video = videos[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: VideoListItem(
                    thumbnailUrl: video['thumbnail']!,
                    title: video['title']!,
                    onTap: () {
                      // Navigate to video detail
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
