import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/dummy_data.dart';
import '../../../../core/models/assignment_model.dart';
import '../../../../core/models/class_model.dart';
import '../../../../core/models/notification_model.dart';
import '../../../../core/widgets/custom_card.dart';
import '../../../../routes/app_routes.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _isSearching ? _buildSearchAppBar() : _buildNormalAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Large Welcome Banner - Made responsive
              LayoutBuilder(
                builder: (context, constraints) {
                  final screenHeight = MediaQuery.of(context).size.height;
                  final bannerHeight =
                      screenHeight * 0.25; // 25% of screen height
                  return Container(
                    width: double.infinity,
                    height: bannerHeight.clamp(140, 220), // Min 140, max 220
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.primary,
                          AppColors.primary.withOpacity(0.8),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white.withOpacity(0.2),
                            child: Text(
                              DummyData.currentUser.name[0].toUpperCase(),
                              style: AppTextStyles.headline2.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Selamat Datang!',
                                  style: AppTextStyles.headline2.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  DummyData.currentUser.name,
                                  style: AppTextStyles.headline3.copyWith(
                                    color: Colors.white.withOpacity(0.9),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  'Semangat belajar hari ini! Tetap fokus dan raih target Anda.',
                                  style: AppTextStyles.bodyText2.copyWith(
                                    color: Colors.white.withOpacity(0.8),
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),

              // Important Announcement Banner
              _buildAnnouncementBanner(),

              const SizedBox(height: 24),

              // Overall Progress Statistics - Made responsive
              LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.primary.withOpacity(0.8),
                          AppColors.primary,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Statistik Keseluruhan',
                                style: AppTextStyles.headline3.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            // Circular Progress Chart
                            Container(
                              width: 60,
                              height: 60,
                              child: Stack(
                                children: [
                                  CircularProgressIndicator(
                                    value: _calculateAverageProgress() / 100,
                                    backgroundColor: Colors.white.withOpacity(
                                      0.3,
                                    ),
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                          Colors.white,
                                        ),
                                    strokeWidth: 6,
                                  ),
                                  Center(
                                    child: Text(
                                      '${_calculateAverageProgress()}%',
                                      style: AppTextStyles.caption.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildStatItem(
                              '${DummyData.classes.length}',
                              'Total\nMata Kuliah',
                            ),
                            _buildStatItem(
                              '${DummyData.classes.where((c) => c.progress == 100).length}',
                              'Selesai',
                            ),
                            _buildStatItem(
                              '${DummyData.assignments.where((a) => a.status != AssignmentStatus.graded).length}',
                              'Tugas\nAktif',
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        LinearProgressIndicator(
                          value: _calculateAverageProgress() / 100,
                          backgroundColor: Colors.white.withOpacity(0.3),
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Progress Rata-rata',
                          style: AppTextStyles.caption.copyWith(
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              const SizedBox(height: 24),
              _buildCalendarWidget(context),
              const SizedBox(height: 24),
              Text('Menu Cepat', style: AppTextStyles.headline3),
              const SizedBox(height: 16),
              LayoutBuilder(
                builder: (context, constraints) {
                  // Use GridView for small screens, Row for larger screens
                  if (constraints.maxWidth < 600) {
                    return GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 1.5,
                      children: [
                        _buildQuickMenuItem(Icons.school, 'Kelas', () {
                          Navigator.pushNamed(context, AppRoutes.kelas);
                        }),
                        _buildQuickMenuItem(Icons.assignment, 'Tugas', () {
                          Navigator.pushNamed(context, AppRoutes.tugas);
                        }),
                        _buildQuickMenuItem(Icons.schedule, 'Jadwal', () {
                          Navigator.pushNamed(context, AppRoutes.notifikasi);
                        }),
                        _buildQuickMenuItem(
                          Icons.announcement,
                          'Pengumuman',
                          () {
                            Navigator.pushNamed(context, AppRoutes.notifikasi);
                          },
                        ),
                      ],
                    );
                  } else {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildQuickMenuItem(Icons.school, 'Kelas', () {
                          Navigator.pushNamed(context, AppRoutes.kelas);
                        }),
                        _buildQuickMenuItem(Icons.assignment, 'Tugas', () {
                          Navigator.pushNamed(context, AppRoutes.tugas);
                        }),
                        _buildQuickMenuItem(Icons.schedule, 'Jadwal', () {
                          Navigator.pushNamed(context, AppRoutes.notifikasi);
                        }),
                        _buildQuickMenuItem(
                          Icons.announcement,
                          'Pengumuman',
                          () {
                            Navigator.pushNamed(context, AppRoutes.notifikasi);
                          },
                        ),
                      ],
                    );
                  }
                },
              ),
              const SizedBox(height: 24),
              Text('Fitur Unggulan', style: AppTextStyles.headline3),
              const SizedBox(height: 16),
              _buildFeaturedFeatures(),
              const SizedBox(height: 24),
              Text('Kelas Aktif', style: AppTextStyles.headline3),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: DummyData.classes.length,
                itemBuilder: (context, index) {
                  return _buildClassCard(DummyData.classes[index]);
                },
              ),
              const SizedBox(height: 24),
              _buildRecentActivitySection(context),
              const SizedBox(height: 24),
              _buildTipsAndMotivationSection(context),
              const SizedBox(height: 24),
              _buildDailyQuoteCard(),
              const SizedBox(height: 24),
              _buildUpcomingEventsCard(context),
              const SizedBox(height: 80), // Extra space for FAB
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showQuickActions(context);
        },
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
        elevation: 6,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showQuickActions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),
              Text('Aksi Cepat', style: AppTextStyles.headline3),
              const SizedBox(height: 20),
              _buildQuickActionItem(
                icon: Icons.assignment_add,
                title: 'Tambah Tugas',
                subtitle: 'Buat tugas baru',
                color: Colors.blue,
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Fitur tambah tugas akan segera hadir'),
                    ),
                  );
                },
              ),
              _buildQuickActionItem(
                icon: Icons.note_add,
                title: 'Catatan Baru',
                subtitle: 'Buat catatan kuliah',
                color: Colors.green,
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Fitur catatan akan segera hadir'),
                    ),
                  );
                },
              ),
              _buildQuickActionItem(
                icon: Icons.camera_alt,
                title: 'Scan Dokumen',
                subtitle: 'Scan dan upload dokumen',
                color: Colors.orange,
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Fitur scan dokumen akan segera hadir'),
                    ),
                  );
                },
              ),
              _buildQuickActionItem(
                icon: Icons.help_outline,
                title: 'Bantuan',
                subtitle: 'Panduan dan FAQ',
                color: Colors.purple,
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('Menu bantuan')));
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  Widget _buildQuickActionItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: color),
      ),
      title: Text(title, style: AppTextStyles.bodyText1),
      subtitle: Text(
        subtitle,
        style: AppTextStyles.caption.copyWith(color: Colors.grey),
      ),
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }

  PreferredSizeWidget _buildNormalAppBar() {
    return AppBar(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.onPrimary,
      title: Text(
        'Dashboard',
        style: AppTextStyles.headline3.copyWith(color: AppColors.onPrimary),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.search),
        onPressed: () {
          setState(() => _isSearching = true);
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Notifikasi')));
          },
        ),
      ],
    );
  }

  PreferredSizeWidget _buildSearchAppBar() {
    return AppBar(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.onPrimary,
      title: TextField(
        controller: _searchController,
        autofocus: true,
        style: AppTextStyles.bodyText1.copyWith(color: AppColors.onPrimary),
        decoration: InputDecoration(
          hintText: 'Cari mata kuliah, tugas...',
          hintStyle: AppTextStyles.bodyText2.copyWith(
            color: AppColors.onPrimary.withOpacity(0.7),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
        ),
        onChanged: (value) {
          // Implement search functionality here
          print('Searching for: $value');
        },
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          setState(() {
            _isSearching = false;
            _searchController.clear();
          });
        },
      ),
      actions: [
        if (_searchController.text.isNotEmpty) ...[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              String query = _searchController.text.toLowerCase();
              if (query.contains('kelas') ||
                  query.contains('mata kuliah') ||
                  query.contains('course')) {
                Navigator.pushNamed(context, AppRoutes.kelas);
              } else if (query.contains('tugas') ||
                  query.contains('assignment')) {
                Navigator.pushNamed(context, AppRoutes.tugas);
              } else if (query.contains('jadwal') ||
                  query.contains('schedule') ||
                  query.contains('pengumuman') ||
                  query.contains('announcement') ||
                  query.contains('notifikasi') ||
                  query.contains('notification')) {
                Navigator.pushNamed(context, AppRoutes.notifikasi);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Tidak ada hasil untuk pencarian tersebut'),
                  ),
                );
              }
              setState(() {
                _isSearching = false;
                _searchController.clear();
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              _searchController.clear();
              setState(() {});
            },
          ),
        ],
      ],
    );
  }

  Widget _buildRecentActivitySection(BuildContext context) {
    // Get recent activities from assignments and notifications
    final recentActivities = _getRecentActivities();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Aktivitas Terbaru', style: AppTextStyles.headline3),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Lihat semua aktivitas')),
                );
              },
              child: Text(
                'Lihat Semua',
                style: AppTextStyles.bodyText2.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...recentActivities.map((activity) => _buildActivityItem(activity)),
      ],
    );
  }

  List<Map<String, dynamic>> _getRecentActivities() {
    // Combine recent assignments and notifications
    final activities = <Map<String, dynamic>>[];

    // Add recent assignment submissions
    final recentAssignments = DummyData.assignments
        .where((a) => a.status != AssignmentStatus.notSubmitted)
        .take(3);

    for (final assignment in recentAssignments) {
      activities.add({
        'type': 'assignment',
        'title':
            'Tugas "${assignment.title}" telah ${assignment.status == AssignmentStatus.submitted ? 'dikumpulkan' : 'dinilai'}',
        'subtitle': assignment.classId == '6'
            ? 'Pengantar User Interface Design'
            : 'Mata Kuliah',
        'time': '2 jam yang lalu',
        'icon': Icons.assignment_turned_in,
        'color': assignment.status == AssignmentStatus.graded
            ? Colors.green
            : Colors.blue,
      });
    }

    // Add recent notifications
    final recentNotifications = DummyData.notifications.take(2);
    for (final notification in recentNotifications) {
      activities.add({
        'type': 'notification',
        'title': notification.title,
        'subtitle': notification.message.length > 50
            ? '${notification.message.substring(0, 50)}...'
            : notification.message,
        'time': _formatTimeAgo(notification.timestamp),
        'icon': _getNotificationIcon(notification.type),
        'color': _getNotificationColor(notification.type),
      });
    }

    // Sort by recency (simulated) and take top 5
    return activities.take(5).toList();
  }

  Widget _buildActivityItem(Map<String, dynamic> activity) {
    return CustomCard(
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: (activity['color'] as Color).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              activity['icon'] as IconData,
              color: activity['color'] as Color,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity['title'] as String,
                  style: AppTextStyles.bodyText2.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  activity['subtitle'] as String,
                  style: AppTextStyles.caption.copyWith(color: Colors.grey),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Text(
            activity['time'] as String,
            style: AppTextStyles.caption.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  String _formatTimeAgo(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inHours < 1) {
      return '${difference.inMinutes} menit yang lalu';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} jam yang lalu';
    } else {
      return '${difference.inDays} hari yang lalu';
    }
  }

  IconData _getNotificationIcon(NotificationType type) {
    switch (type) {
      case NotificationType.announcement:
        return Icons.campaign;
      case NotificationType.assignment:
        return Icons.assignment;
      case NotificationType.grade:
        return Icons.grade;
      case NotificationType.system:
        return Icons.settings;
      default:
        return Icons.notifications;
    }
  }

  Color _getNotificationColor(NotificationType type) {
    switch (type) {
      case NotificationType.announcement:
        return Colors.blue;
      case NotificationType.assignment:
        return Colors.orange;
      case NotificationType.grade:
        return Colors.green;
      case NotificationType.system:
        return Colors.grey;
      default:
        return Colors.blue;
    }
  }

  Widget _buildTipsAndMotivationSection(BuildContext context) {
    final tips = [
      {
        'icon': Icons.lightbulb,
        'title': 'Belajar Smart',
        'message':
            'Fokus pada pemahaman konsep, bukan menghafal. Praktik yang konsisten lebih penting daripada belajar semalaman.',
        'color': Colors.amber,
      },
      {
        'icon': Icons.schedule,
        'title': 'Kelola Waktu',
        'message':
            'Buat jadwal belajar tetap dan istirahat yang cukup. Keseimbangan antara belajar dan istirahat meningkatkan produktivitas.',
        'color': Colors.blue,
      },
      {
        'icon': Icons.group,
        'title': 'Diskusi & Kolaborasi',
        'message':
            'Belajar bersama teman dapat memperdalam pemahaman. Jangan ragu bertanya dan berbagi pengetahuan.',
        'color': Colors.green,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tips & Motivasi', style: AppTextStyles.headline3),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Lihat semua tips')),
                );
              },
              child: Text(
                'Lihat Semua',
                style: AppTextStyles.bodyText2.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: tips.length,
            itemBuilder: (context, index) {
              final tip = tips[index];
              return Container(
                width: 280,
                margin: const EdgeInsets.only(right: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      (tip['color'] as Color).withOpacity(0.1),
                      (tip['color'] as Color).withOpacity(0.05),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: (tip['color'] as Color).withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: (tip['color'] as Color).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            tip['icon'] as IconData,
                            color: tip['color'] as Color,
                            size: 18,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            tip['title'] as String,
                            style: AppTextStyles.bodyText2.copyWith(
                              fontWeight: FontWeight.bold,
                              color: tip['color'] as Color,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: Text(
                        tip['message'] as String,
                        style: AppTextStyles.caption.copyWith(
                          color: Colors.grey[700],
                          height: 1.3,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildUpcomingEventsCard(BuildContext context) {
    final upcomingEvents = [
      {
        'title': 'Deadline Tugas UI Design',
        'date': '15 Jan 2024',
        'time': '23:59',
        'type': 'deadline',
        'color': Colors.red,
        'icon': Icons.assignment_late,
      },
      {
        'title': 'Workshop Machine Learning',
        'date': '18 Jan 2024',
        'time': '14:00 - 16:00',
        'type': 'workshop',
        'color': Colors.blue,
        'icon': Icons.build,
      },
      {
        'title': 'Ujian Akhir Semester',
        'date': '25 Jan 2024',
        'time': '08:00 - 10:00',
        'type': 'exam',
        'color': Colors.orange,
        'icon': Icons.school,
      },
    ];

    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.event, color: AppColors.primary, size: 24),
                  const SizedBox(width: 8),
                  Text('Acara Mendatang', style: AppTextStyles.headline3),
                ],
              ),
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Lihat semua acara')),
                  );
                },
                child: Text(
                  'Lihat Semua',
                  style: AppTextStyles.bodyText2.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...upcomingEvents.map((event) => _buildEventItem(event)),
        ],
      ),
    );
  }

  Widget _buildEventItem(Map<String, dynamic> event) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: (event['color'] as Color).withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border(
          left: BorderSide(color: event['color'] as Color, width: 3),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: (event['color'] as Color).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              event['icon'] as IconData,
              color: event['color'] as Color,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event['title'] as String,
                  style: AppTextStyles.bodyText2.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      event['date'] as String,
                      style: AppTextStyles.caption.copyWith(color: Colors.grey),
                    ),
                    const SizedBox(width: 12),
                    Icon(Icons.access_time, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      event['time'] as String,
                      style: AppTextStyles.caption.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildAnnouncementBanner() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFF6B6B), Color(0xFFFF8E53)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFF6B6B).withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Icon(
              Icons.announcement,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pengumuman Penting!',
                  style: AppTextStyles.headline3.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Jadwal ujian akhir semester telah diumumkan. Silakan cek portal akademik untuk detail lengkap.',
                  style: AppTextStyles.bodyText2.copyWith(
                    color: Colors.white.withOpacity(0.9),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              // Navigate to notifications or close banner
            },
            icon: const Icon(Icons.close, color: Colors.white, size: 20),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarWidget(BuildContext context) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    // Get today's schedule (mock data)
    final todaySchedule = [
      {
        'time': '08:00 - 09:30',
        'subject': 'Pemrograman Mobile Lanjutan',
        'type': 'Kuliah',
        'room': 'Ruang 301',
      },
      {
        'time': '10:00 - 11:30',
        'subject': 'Basis Data Terstruktur',
        'type': 'Praktikum',
        'room': 'Lab Komputer 1',
      },
      {
        'time': '13:00 - 14:30',
        'subject': 'Jaringan Komputer',
        'type': 'Kuliah',
        'room': 'Ruang 205',
      },
    ];

    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    color: AppColors.primary,
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  Text('Jadwal Hari Ini', style: AppTextStyles.headline3),
                ],
              ),
              Text(
                '${now.day}/${now.month}/${now.year}',
                style: AppTextStyles.bodyText2.copyWith(color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...todaySchedule.map((schedule) => _buildScheduleItem(schedule)),
          const SizedBox(height: 12),
          Center(
            child: TextButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Lihat jadwal lengkap')),
                );
              },
              icon: Icon(Icons.expand_more, color: AppColors.primary),
              label: Text(
                'Lihat Semua Jadwal',
                style: AppTextStyles.bodyText2.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleItem(Map<String, dynamic> schedule) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border(left: BorderSide(color: AppColors.primary, width: 3)),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            child: Text(
              schedule['time'] as String,
              style: AppTextStyles.caption.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  schedule['subject'] as String,
                  style: AppTextStyles.bodyText2.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Icon(Icons.class_, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      schedule['type'] as String,
                      style: AppTextStyles.caption.copyWith(color: Colors.grey),
                    ),
                    const SizedBox(width: 12),
                    Icon(Icons.location_on, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      schedule['room'] as String,
                      style: AppTextStyles.caption.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int _calculateAverageProgress() {
    final classes = DummyData.classes;
    return classes.isNotEmpty
        ? (classes.map((c) => c.progress).reduce((a, b) => a + b) /
                  classes.length)
              .round()
        : 0;
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: AppTextStyles.headline2.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: AppTextStyles.caption.copyWith(
            color: Colors.white.withOpacity(0.8),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildQuickMenuItem(
    IconData icon,
    String label, [
    VoidCallback? onTap,
  ]) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppColors.primary, size: 30),
          ),
          const SizedBox(height: 8),
          Text(label, style: AppTextStyles.bodyText2),
        ],
      ),
    );
  }

  Widget _buildClassCard(ClassModel classItem) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with icon and progress
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.school,
                  color: AppColors.primary,
                  size: 24,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${classItem.progress}%',
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Course name
          Text(
            classItem.name,
            style: AppTextStyles.bodyText1.copyWith(
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          // Lecturer name
          Text(
            classItem.lecturer,
            style: AppTextStyles.caption.copyWith(color: Colors.grey),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          // Progress bar
          LinearProgressIndicator(
            value: classItem.progress / 100,
            backgroundColor: Colors.grey[300],
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
          ),
          const SizedBox(height: 4),
          Text(
            'Progress',
            style: AppTextStyles.caption.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildDailyQuoteCard() {
    return CustomCard(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purple.withOpacity(0.1),
              Colors.blue.withOpacity(0.1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.purple.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.format_quote,
                    color: Colors.purple,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Kutipan Harian',
                  style: AppTextStyles.headline3.copyWith(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              '"Belajar adalah proses seumur hidup. Setiap hari adalah kesempatan untuk menjadi lebih baik."',
              style: AppTextStyles.bodyText1.copyWith(
                fontStyle: FontStyle.italic,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              '- Albert Einstein',
              style: AppTextStyles.caption.copyWith(
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturedFeatures() {
    final features = [
      {
        'icon': Icons.forum,
        'title': 'Forum Diskusi',
        'description': 'Diskusikan materi kuliah dengan teman',
        'color': Colors.blue,
      },
      {
        'icon': Icons.library_books,
        'title': 'Materi Tambahan',
        'description': 'Akses e-book dan referensi lengkap',
        'color': Colors.green,
      },
      {
        'icon': Icons.quiz,
        'title': 'Latihan Soal',
        'description': 'Uji pemahaman dengan kuis interaktif',
        'color': Colors.orange,
      },
      {
        'icon': Icons.video_library,
        'title': 'Video Pembelajaran',
        'description': 'Tonton video tutorial dan penjelasan',
        'color': Colors.purple,
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.2,
      ),
      itemCount: features.length,
      itemBuilder: (context, index) {
        final feature = features[index];
        return CustomCard(
          child: InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Fitur ${feature['title']} akan segera hadir'),
                ),
              );
            },
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: (feature['color'] as Color).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      feature['icon'] as IconData,
                      color: feature['color'] as Color,
                      size: 24,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    feature['title'] as String,
                    style: AppTextStyles.bodyText2.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    feature['description'] as String,
                    style: AppTextStyles.caption.copyWith(color: Colors.grey),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return CustomCard(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: AppTextStyles.bodyText2.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: AppTextStyles.caption.copyWith(color: Colors.grey),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
