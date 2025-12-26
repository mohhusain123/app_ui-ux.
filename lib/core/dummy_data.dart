import 'models/user_model.dart';
import 'models/class_model.dart';
import 'models/assignment_model.dart';
import 'models/notification_model.dart';

class DummyData {
  static final UserModel currentUser = UserModel(
    id: '1',
    name: 'Moh Husain',
    email: 'mohhusain338@gmail.com',
    nim: '2022020100054',
    profileImageUrl: 'https://i.imgur.com/TTJUfsN.jpeg',
  );

  static final List<ClassModel> classes = [
    ClassModel(
      id: '1',
      name: 'Pemrograman Mobile Lanjutan',
      lecturer: 'Dr. Ahmad Fauzi, S.Kom., M.T.',
      description:
          'Mata kuliah lanjutan tentang pengembangan aplikasi mobile dengan fokus pada framework Flutter dan React Native',
      progress: 75,
      imageUrl: 'https://via.placeholder.com/300x200/8B1E1E/FFFFFF?text=Mobile',
    ),
    ClassModel(
      id: '2',
      name: 'Basis Data Terstruktur',
      lecturer: 'Prof. Dr. Siti Nurhaliza, M.Kom.',
      description:
          'Mata kuliah mendalam tentang desain dan implementasi basis data relasional dan non-relasional',
      progress: 60,
      imageUrl:
          'https://via.placeholder.com/300x200/8B1E1E/FFFFFF?text=Database',
    ),
    ClassModel(
      id: '3',
      name: 'Jaringan Komputer & Komunikasi Data',
      lecturer: 'Dr. Budi Santoso, S.T., M.T.',
      description:
          'Mata kuliah tentang arsitektur jaringan, protokol komunikasi, dan implementasi jaringan enterprise',
      progress: 85,
      imageUrl:
          'https://via.placeholder.com/300x200/8B1E1E/FFFFFF?text=Network',
    ),
    ClassModel(
      id: '4',
      name: 'Sistem Operasi',
      lecturer: 'Dr. Maya Sari, S.Kom., M.T.',
      description:
          'Mata kuliah tentang konsep sistem operasi, manajemen proses, memori, dan file system',
      progress: 45,
      imageUrl: 'https://via.placeholder.com/300x200/8B1E1E/FFFFFF?text=OS',
    ),
    ClassModel(
      id: '5',
      name: 'Kecerdasan Buatan',
      lecturer: 'Prof. Dr. Hendra Wijaya, M.Kom.',
      description:
          'Mata kuliah tentang algoritma machine learning, neural networks, dan aplikasi AI dalam industri',
      progress: 30,
      imageUrl: 'https://via.placeholder.com/300x200/8B1E1E/FFFFFF?text=AI',
    ),
    ClassModel(
      id: '6',
      name: 'Pengantar User Interface Design',
      lecturer: 'Dr. Maya Sari, S.Kom., M.T.',
      description:
          'Antarmuka yang dibangun harus memperhatikan prinsip-prinsip desain yang ada. Hal ini diharapkan agar antarmuka yang dibangun bukan hanya menarik secara visual tetapi dengan memperhatikan kaidah-kaidah prinsip desain diharapkan akan mendukung pengguna dalam menggunakan produk secara baik.',
      progress: 65,
      imageUrl: 'https://via.placeholder.com/300x200/8B1E1E/FFFFFF?text=UI',
    ),
  ];

  static final List<AssignmentModel> assignments = [
    AssignmentModel(
      id: '1',
      title: 'Tugas 1: Aplikasi E-Commerce Mobile',
      description:
          'Buat aplikasi e-commerce lengkap dengan fitur katalog produk, keranjang belanja, dan checkout menggunakan Flutter',
      classId: '1',
      deadline: DateTime.now().add(const Duration(days: 7)),
      status: AssignmentStatus.notSubmitted,
    ),
    AssignmentModel(
      id: '2',
      title: 'Tugas 2: Normalisasi Database Toko Online',
      description:
          'Lakukan normalisasi database untuk sistem e-commerce dengan minimal 15 tabel dan relasi yang kompleks',
      classId: '2',
      deadline: DateTime.now().add(const Duration(days: 3)),
      status: AssignmentStatus.submitted,
    ),
    AssignmentModel(
      id: '3',
      title: 'Tugas 3: Konfigurasi VPN Site-to-Site',
      description:
          'Konfigurasi dan troubleshooting VPN antara dua lokasi menggunakan router Cisco dengan IPsec',
      classId: '3',
      deadline: DateTime.now().subtract(const Duration(days: 1)),
      status: AssignmentStatus.graded,
      score: 85,
    ),
    AssignmentModel(
      id: '4',
      title: 'Tugas 4: Implementasi Threading di Linux',
      description:
          'Implementasi multi-threading untuk aplikasi server menggunakan POSIX threads di environment Linux',
      classId: '4',
      deadline: DateTime.now().add(const Duration(days: 10)),
      status: AssignmentStatus.notSubmitted,
    ),
    AssignmentModel(
      id: '5',
      title: 'Tugas 5: Klasifikasi Gambar dengan CNN',
      description:
          'Buat model Convolutional Neural Network untuk mengklasifikasikan dataset CIFAR-10 menggunakan TensorFlow',
      classId: '5',
      deadline: DateTime.now().add(const Duration(days: 14)),
      status: AssignmentStatus.submitted,
    ),
    AssignmentModel(
      id: '6',
      title: 'Tugas 6: Optimisasi Query Database',
      description:
          'Optimalkan performa query database dengan indexing dan query rewriting untuk dataset besar',
      classId: '2',
      deadline: DateTime.now().subtract(const Duration(days: 3)),
      status: AssignmentStatus.graded,
      score: 92,
    ),
    AssignmentModel(
      id: '7',
      title: 'Tugas UI: Analisis Prinsip Desain',
      description:
          'Analisis dan implementasi 20 prinsip desain antarmuka pada aplikasi mobile sederhana',
      classId: '6',
      deadline: DateTime.now().add(const Duration(days: 5)),
      status: AssignmentStatus.notSubmitted,
    ),
    AssignmentModel(
      id: '8',
      title: 'Kuis: Teori Dasar UI Design',
      description:
          'Kuis tentang empat teori dasar antarmuka pengguna dan best practices UI design',
      classId: '6',
      deadline: DateTime.now().add(const Duration(days: 2)),
      status: AssignmentStatus.submitted,
    ),
    AssignmentModel(
      id: '9',
      title: 'Proyek: Redesign Aplikasi',
      description:
          'Redesign antarmuka aplikasi existing dengan menerapkan prinsip-prinsip UI design yang telah dipelajari',
      classId: '6',
      deadline: DateTime.now().add(const Duration(days: 12)),
      status: AssignmentStatus.notSubmitted,
    ),
  ];

  static final List<NotificationModel> notifications = [
    NotificationModel(
      id: '1',
      title: 'Jadwal Ujian Akhir Semester',
      message:
          'Jadwal ujian akhir semester untuk semua mata kuliah telah diumumkan. Silakan cek portal akademik.',
      type: NotificationType.announcement,
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
      isRead: false,
    ),
    NotificationModel(
      id: '2',
      title: 'Tugas Baru: Mobile App Development',
      message:
          'Tugas baru "Aplikasi E-Commerce Mobile" telah ditambahkan di kelas Pemrograman Mobile Lanjutan',
      type: NotificationType.assignment,
      timestamp: DateTime.now().subtract(const Duration(hours: 5)),
      isRead: true,
    ),
    NotificationModel(
      id: '3',
      title: 'Nilai Tugas VPN Configuration',
      message:
          'Nilai tugas "Konfigurasi VPN Site-to-Site" telah tersedia: 85/100. Lihat detail di portal.',
      type: NotificationType.grade,
      timestamp: DateTime.now().subtract(const Duration(days: 1)),
      isRead: false,
    ),
    NotificationModel(
      id: '4',
      title: 'Pengumuman: Workshop AI',
      message:
          'Workshop "Machine Learning untuk Pemula" akan dilaksanakan pada tanggal 15 Januari 2024',
      type: NotificationType.announcement,
      timestamp: DateTime.now().subtract(const Duration(hours: 8)),
      isRead: true,
    ),
    NotificationModel(
      id: '5',
      title: 'Deadline Extended: Database Project',
      message:
          'Deadline tugas "Normalisasi Database Toko Online" diperpanjang menjadi 10 Januari 2024',
      type: NotificationType.assignment,
      timestamp: DateTime.now().subtract(const Duration(hours: 12)),
      isRead: false,
    ),
    NotificationModel(
      id: '6',
      title: 'Nilai Tugas Query Optimization',
      message:
          'Selamat! Anda mendapat nilai 92/100 untuk tugas "Optimisasi Query Database"',
      type: NotificationType.grade,
      timestamp: DateTime.now().subtract(const Duration(days: 2)),
      isRead: true,
    ),
    NotificationModel(
      id: '7',
      title: 'Maintenance Sistem LMS',
      message:
          'Sistem LMS akan mengalami maintenance pada tanggal 20 Januari 2024 pukul 22:00 - 24:00 WIB',
      type: NotificationType.system,
      timestamp: DateTime.now().subtract(const Duration(days: 3)),
      isRead: true,
    ),
    NotificationModel(
      id: '8',
      title: 'Zoom Meeting: UI Design Principles',
      message:
          'Pertemuan synchronous "Empat Teori Dasar Antarmuka Pengguna" akan dilaksanakan hari ini pukul 14:00 WIB',
      type: NotificationType.announcement,
      timestamp: DateTime.now().subtract(const Duration(hours: 1)),
      isRead: false,
    ),
    NotificationModel(
      id: '9',
      title: 'Tugas Baru: UI Design Analysis',
      message:
          'Tugas baru "Analisis Prinsip Desain" telah ditambahkan di kelas Pengantar User Interface Design',
      type: NotificationType.assignment,
      timestamp: DateTime.now().subtract(const Duration(hours: 6)),
      isRead: false,
    ),
  ];
}
