import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 17),

              // "Course" title + avatar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Course',
                    style: GoogleFonts.poppins(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: kDarkText,
                    ),
                  ),
                  Image.asset(
                    'assets/images/avatar.png',
                    width: 36,
                    height: 49.98,
                    fit: BoxFit.contain,
                  ),
                ],
              ),

              const SizedBox(height: 15),

              // Search bar (335 x 48, top 112, bg #F4F3FD)
              Container(
                width: double.infinity,
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: kSearchBg,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.grey),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Find Cousre',
                        style: GoogleFonts.poppins(color: Colors.grey, fontSize: 14),
                      ),
                    ),
                    const Icon(Icons.tune, color: Colors.grey, size: 20),
                  ],
                ),
              ),

              const SizedBox(height: 4),

              // Recommendations row (335 x 108, top 164)
              SizedBox(
                height: 108,
                child: Row(
                  children: [
                    Expanded(
                      child: _CategoryCard(
                        bgColor: kCardLanguageBg,
                        bgWidth: 160,
                        bgHeight: 77.46,
                        bgTop: 30.54,
                        bgLeft: 0,
                        illustrationPath: 'assets/images/language_illustration.png',
                        illustrationWidth: 109.77,
                        illustrationHeight: 108,
                        illustrationLeft: 1,
                        illustrationTop: 0,
                        labelPath: 'assets/images/language_label.png',
                        labelLeft: 78.21,
                        labelTop: 74.95,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: _CategoryCard(
                        bgColor: kCardPaintingBg,
                        bgWidth: 160,
                        bgHeight: 77.46,
                        bgTop: 30.54,
                        bgLeft: 0,
                        illustrationPath: 'assets/images/painting_illustration.png',
                        illustrationWidth: 117.97,
                        illustrationHeight: 86.66,
                        illustrationLeft: 0.25,
                        illustrationTop: 21.33,
                        labelPath: 'assets/images/painting_label.png',
                        labelLeft: 88.69,
                        labelTop: 74.95,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 36),

              // "Choice your course" title - Poppins Medium 18, #1F1F39
              Text(
                'Choice your course',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: kDarkText,
                ),
              ),

              const SizedBox(height: 12),

              // Tabs (253 x 28, top 348)
              Row(
                children: [
                  _TabPill(label: 'All', selected: true),
                  const SizedBox(width: 10),
                  _TabPill(label: 'Poular', selected: false),
                  const SizedBox(width: 10),
                  _TabPill(label: 'New', selected: false),
                ],
              ),

              const SizedBox(height: 24),

              // Course list (335 x 320, top 400) - carduri cu umbra
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: const [
                    _CourseListItem(
                      title: 'Product Design v1.0',
                      author: 'Robertson Connie',
                      price: '\$190',
                      hours: '16 hours',
                    ),
                    SizedBox(height: 16),
                    _CourseListItem(
                      title: 'Java Development',
                      author: 'Nguyen Shane',
                      price: '\$190',
                      hours: '16 hours',
                    ),
                    SizedBox(height: 16),
                    _CourseListItem(
                      title: 'Visual Design',
                      author: 'Bert Pullman',
                      price: '\$250',
                      hours: '14 hours',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Card categorie recomandata (Language / Painting)
class _CategoryCard extends StatelessWidget {
  final Color bgColor;
  final double bgWidth;
  final double bgHeight;
  final double bgTop;
  final double bgLeft;
  final String illustrationPath;
  final double illustrationWidth;
  final double illustrationHeight;
  final double illustrationLeft;
  final double illustrationTop;
  final String labelPath;
  final double labelLeft;
  final double labelTop;

  const _CategoryCard({
    required this.bgColor,
    required this.bgWidth,
    required this.bgHeight,
    required this.bgTop,
    required this.bgLeft,
    required this.illustrationPath,
    required this.illustrationWidth,
    required this.illustrationHeight,
    required this.illustrationLeft,
    required this.illustrationTop,
    required this.labelPath,
    required this.labelLeft,
    required this.labelTop,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        height: 108,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: bgLeft,
              top: bgTop,
              child: Container(
                width: bgWidth,
                height: bgHeight,
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            Positioned(
              left: illustrationLeft,
              top: illustrationTop,
              child: Image.asset(
                illustrationPath,
                width: illustrationWidth,
                height: illustrationHeight,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              left: labelLeft,
              top: labelTop,
              child: Image.asset(labelPath),
            ),
          ],
        ),
      ),
    );
  }
}

// Pastila din rândul de tab-uri (All / Poular / New)
class _TabPill extends StatelessWidget {
  final String label;
  final bool selected;

  const _TabPill({required this.label, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
      decoration: BoxDecoration(
        color: selected ? kPrimaryBlue : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: GoogleFonts.poppins(
          color: selected ? Colors.white : Colors.grey,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
    );
  }
}

// Element din lista de cursuri - card alb cu umbra
class _CourseListItem extends StatelessWidget {
  final String title;
  final String author;
  final String price;
  final String hours;

  const _CourseListItem({
    required this.title,
    required this.author,
    required this.price,
    required this.hours,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: kCardShadow.withOpacity(0.2),
            offset: const Offset(0, 8),
            blurRadius: 12,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 68,
            height: 68,
            decoration: BoxDecoration(
              color: const Color(0xFFC4C4C4),
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: kDarkText,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.person, size: 10, color: const Color(0xFFB8B8D2)),
                    const SizedBox(width: 4),
                    Text(
                      author,
                      style: GoogleFonts.poppins(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      price,
                      style: GoogleFonts.poppins(
                        color: kPrimaryBlue,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFE7D6),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        hours,
                        style: GoogleFonts.poppins(
                          color: const Color(0xFFE07A3F),
                          fontSize: 10,
                        ),
                      ),
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
}