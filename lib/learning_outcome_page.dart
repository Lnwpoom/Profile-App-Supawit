import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LearningOutcomePage extends StatefulWidget {
  const LearningOutcomePage({super.key});

  @override
  State<LearningOutcomePage> createState() => _LearningOutcomePageState();
}

class _LearningOutcomePageState extends State<LearningOutcomePage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late List<AnimationController> _cardControllers;

  final List<Map<String, dynamic>> learningOutcomes = [
    {
      'year': 'ปี 1',
      'title': 'เข้าใจพื้นฐานโปรแกรมมิ่ง',
      'description':
          'เรียนรู้ภาษาโปรแกรมมิ่งพื้นฐาน\nทำความเข้าใจโครงสร้างข้อมูล\nฝึกฝนการคิดเชิงตรรกะ',
      'icon': Icons.code,
      'color': const Color(0xFF3B82F6),
      'skills': ['Python', 'Java', 'Algorithm', 'Data Structure'],
    },
    {
      'year': 'ปี 2',
      'title': 'สร้างแอปพื้นฐานได้',
      'description':
          'พัฒนาแอปพลิเคชั่นง่ายๆ\nเรียนรู้ UI/UX Design\nทำงานเป็นทีมได้',
      'icon': Icons.mobile_friendly,
      'color': const Color(0xFF10B981),
      'skills': ['Flutter', 'React', 'UI Design', 'Team Work'],
    },
    {
      'year': 'ปี 3',
      'title': 'ใช้ฐานข้อมูลและ API ได้',
      'description': 'เชื่อมต่อฐานข้อมูล\nสร้างและใช้ API\nจัดการระบบ Backend',
      'icon': Icons.storage,
      'color': const Color(0xFF8B5CF6),
      'skills': ['MySQL', 'REST API', 'Node.js', 'Firebase'],
    },
    {
      'year': 'ปี 4',
      'title': 'พัฒนาโปรเจกต์จริงได้อย่างมีประสิทธิภาพ',
      'description':
          'สร้างโปรเจกต์ขนาดใหญ่\nใช้เครื่องมือ DevOps\nพร้อมทำงานจริง',
      'icon': Icons.rocket_launch,
      'color': const Color(0xFFEF4444),
      'skills': ['Full Stack', 'DevOps', 'Project Management', 'Leadership'],
    },
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _cardControllers = List.generate(
      learningOutcomes.length,
      (index) => AnimationController(
        duration: Duration(milliseconds: 800 + (index * 200)),
        vsync: this,
      ),
    );

    _startAnimations();
  }

  void _startAnimations() async {
    await Future.delayed(const Duration(milliseconds: 300));
    _animationController.forward();

    for (int i = 0; i < _cardControllers.length; i++) {
      await Future.delayed(const Duration(milliseconds: 150));
      _cardControllers[i].forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    for (var controller in _cardControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Widget _buildSkillChip(String skill, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      margin: const EdgeInsets.only(right: 8, bottom: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        skill,
        style: GoogleFonts.kanit(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: color,
        ),
      ),
    );
  }

  Widget _buildLearningCard(Map<String, dynamic> outcome, int index) {
    return SlideTransition(
      position: Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero)
          .animate(
            CurvedAnimation(
              parent: _cardControllers[index],
              curve: Curves.easeOutBack,
            ),
          ),
      child: FadeTransition(
        opacity: _cardControllers[index],
        child: Container(
          margin: const EdgeInsets.only(bottom: 24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: outcome['color'].withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: outcome['color'].withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(
                        outcome['icon'],
                        color: outcome['color'],
                        size: 32,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: outcome['color'],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              outcome['year'],
                              style: GoogleFonts.kanit(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            outcome['title'],
                            style: GoogleFonts.kanit(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF1F2937),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  outcome['description'],
                  style: GoogleFonts.kanit(
                    fontSize: 14,
                    height: 1.6,
                    color: const Color(0xFF6B7280),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'ทักษะที่ได้รับ',
                  style: GoogleFonts.kanit(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF374151),
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  children: outcome['skills']
                      .map<Widget>(
                        (skill) => _buildSkillChip(skill, outcome['color']),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: Text(
          'ผลลัพธ์การเรียนรู้',
          style: GoogleFonts.kanit(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF667eea), Color(0xFF764ba2)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Header Section
          SlideTransition(
            position:
                Tween<Offset>(
                  begin: const Offset(0, -0.5),
                  end: Offset.zero,
                ).animate(
                  CurvedAnimation(
                    parent: _animationController,
                    curve: Curves.easeOutCubic,
                  ),
                ),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF667eea), Color(0xFF764ba2)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        const Icon(Icons.school, color: Colors.white, size: 48),
                        const SizedBox(height: 12),
                        Text(
                          'เส้นทางการเรียนรู้',
                          style: GoogleFonts.kanit(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'วิศวกรรมซอฟต์แวร์ 4 ปี',
                          style: GoogleFonts.kanit(
                            fontSize: 16,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Learning Cards
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(24),
              itemCount: learningOutcomes.length,
              itemBuilder: (context, index) {
                return _buildLearningCard(learningOutcomes[index], index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
