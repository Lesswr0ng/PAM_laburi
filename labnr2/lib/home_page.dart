import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Blue header background
          Container(
            height: 190,
            width: double.infinity,
            color: kPrimaryBlue,
          ),

          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 17),

                // "Hi, Kristin" / "Let's start learning" + avatar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi, Kristin',
                            style: GoogleFonts.poppins(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Let's start learning",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.white.withOpacity(0.85),
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/images/avatar.png',
                        width: 36,
                        height: 49.98,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 19),

                // Learned today card
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Learned today',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: kMutedGrey,
                              ),
                            ),
                            Text(
                              'My courses',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: kPrimaryBlue,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '46min',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: kDarkText,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '/ 60min',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: kMutedGrey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 6,
                              color: kSearchBg,
                            ),
                            Container(
                              width: 210,
                              height: 6,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.white,
                                    kProgressOrange,
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 17),


                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: SizedBox(
                    width: 510,
                    height: 154.655,
                    child: ClipRect(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          // FIRST BLUE CARD
                          Positioned(
                            left: 0,
                            top: 0.65,
                            child: _LearnTodayCard(),
                          ),

                          // SECOND BLUE CARD
                          Positioned(
                            left: 261,
                            top: 0,
                            child: _PeekCard(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(
                      20,
                      14,
                      20,
                      20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x33B8B8D2),
                          offset: Offset(0, 8),
                          blurRadius: 12,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Learning Plan',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: kDarkText,
                          ),
                        ),

                        const SizedBox(height: 25),

                        _PlanItem(
                          title: 'Packaging Design',
                          current: 40,
                          total: 48,
                          ringColor: const Color(0xFF707070),
                        ),

                        const SizedBox(height: 17),

                        _PlanItem(
                          title: 'Product Design',
                          current: 6,
                          total: 24,
                          secondRing: true,
                          ringColor: const Color(0xFFF4F3FD),
                        ),
                      ],
                    ),
                  ),
                ),

                // More space between Learning Plan and Meetup
                const SizedBox(height: 24),


                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: _MeetupCard(),
                ),

                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LearnTodayCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 253.173,
      height: 154,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Blue background
            Container(
              width: 253.173,
              height: 154,
              color: const Color(0xFFCEECFE),
            ),

            // Title
            Positioned(
              top: 19.5,
              left: 18.15,
              width: 242.85,
              child: Text(
                'What do you want to learn today ?',
                maxLines: 1,
                softWrap: false,
                overflow: TextOverflow.visible,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: kDarkText,
                ),
              ),
            ),

            // Orange Get Started button
            Positioned(
              top: 104.5,
              left: 18.15,
              child: Image.asset(
                'assets/images/get_started_button.png',
                width: 85,
                height: 31,
                fit: BoxFit.contain,
              ),
            ),

            // First illustration
            Positioned(
              top: 13.4,
              right: 0,
              child: Image.asset(
                'assets/images/left_illustration.png',
                width: 118.69,
                height: 134.22,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PeekCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 249,
      height: 154,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Blue background
            Container(
              width: 249,
              height: 154,
              color: const Color(0xFFD9ECFF),
            ),

            // Second illustration
            Positioned(
              top: 15,
              left: -45,
              child: Image.asset(
                'assets/images/right_illustration.png',
                width: 249,
                height: 154,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlanItem extends StatelessWidget {
  final String title;
  final int current;
  final int total;
  final Color ringColor;
  final bool secondRing;


  const _PlanItem({
    required this.title,
    required this.current,
    required this.total,
    this.ringColor = const Color(0xFF707070),
    this.secondRing = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Progress ring
        CustomPaint(
          size: const Size(18, 18),
          painter: secondRing
              ? _SecondRingPainter()
              : _OpenRingPainter(
            color: ringColor,
          ),
        ),


        const SizedBox(width: 29),

        // Course name
        Expanded(
          child: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: kDarkText,
            ),
          ),
        ),

        // Progress numbers
        RichText(
          text: TextSpan(
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: kDarkText,
            ),
            children: [
              TextSpan(
                text: '$current',
              ),
              TextSpan(
                text: '/$total',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: kMutedGrey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MeetupCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: const Color(0xFFEFE0FF),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x33B8B8D2),
            offset: Offset(0, 8),
            blurRadius: 12,
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Large decorative circle
          Positioned(
            top: 8.25,
            left: 224.67,
            child: Container(
              width: 96.51,
              height: 96.51,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFF5ECFF).withOpacity(0.56),
              ),
            ),
          ),

          // Small decorative circle
          Positioned(
            top: 21.01,
            left: 237.43,
            child: Container(
              width: 71,
              height: 71,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFF8F2FF).withOpacity(0.8),
              ),
            ),
          ),

          // Meetup title
          Positioned(
            top: 26.64,
            left: 21.42,
            child: Text(
              'Meetup',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF440687),
              ),
            ),
          ),

          // Meetup subtitle
          Positioned(
            top: 55.1,
            left: 22.74,
            width: 251,
            child: Text(
              'Off-line exchange of learning experiences',
              maxLines: 1,
              softWrap: false,
              overflow: TextOverflow.visible,
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: const Color(0xFF440687),
              ),
            ),
          ),

          // Avatar 1
          Positioned(
            top: 20,
            left: 248.65,
            child: Image.asset(
              'assets/images/Group_136.png',
              width: 51.11,
              height: 51.11,
            ),
          ),

          // Avatar 2
          Positioned(
            top: 45.54,
            left: 278.67,
            child: Image.asset(
              'assets/images/Group_137.png',
              width: 33.34,
              height: 43.86,
            ),
          ),

          // Avatar 3
          Positioned(
            top: 47.24,
            left: 234.45,
            child: Image.asset(
              'assets/images/Avatar_03.png',
              width: 35.31,
              height: 42.09,
            ),
          ),
        ],
      ),
    );
  }
}

class _OpenRingPainter extends CustomPainter {
  final Color color;

  _OpenRingPainter({
    this.color = const Color(0xFF707070),
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    final rect = Rect.fromLTWH(
      1.5,
      1.5,
      size.width - 3,
      size.height - 3,
    );

    const startAngle = -1.5708;
    const sweepAngle = 4.71239;

    canvas.drawArc(
      rect,
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _OpenRingPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

class _SecondRingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(
      1.5,
      1.5,
      size.width - 3,
      size.height - 3,
    );

    // Light 18x18 ring
    final lightPaint = Paint()
      ..color = const Color(0xFFF4F3FD)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      rect,
      -1.5708,
      4.71239,
      false,
      lightPaint,
    );

    // Dark 9x9-ish portion
    final darkPaint = Paint()
      ..color = const Color(0xFF707070)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      rect,
      -1.5708,
      1.5708,
      false,
      darkPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _SecondRingPainter oldDelegate) {
    return false;
  }
}

