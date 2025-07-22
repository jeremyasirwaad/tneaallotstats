import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class AnimatedStatCard extends StatefulWidget {
  final String title;
  final String value;
  final IconData icon;
  final LinearGradient gradient;
  final VoidCallback? onTap;
  final Duration animationDelay;

  const AnimatedStatCard({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    required this.gradient,
    this.onTap,
    this.animationDelay = Duration.zero,
  }) : super(key: key);

  @override
  _AnimatedStatCardState createState() => _AnimatedStatCardState();
}

class _AnimatedStatCardState extends State<AnimatedStatCard>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late AnimationController _slideController;
  late AnimationController _numberController;
  
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _numberAnimation;

  @override
  void initState() {
    super.initState();

    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _slideController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _numberController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.elasticOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _slideController, curve: Curves.easeOutBack),
    );

    _numberAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _numberController, curve: Curves.easeOutCubic),
    );

    // Start animations with delay
    Future.delayed(widget.animationDelay, () {
      if (mounted) {
        _scaleController.forward();
        _slideController.forward();
        _numberController.forward();
      }
    });
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _slideController.dispose();
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_scaleAnimation, _slideAnimation]),
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: SlideTransition(
            position: _slideAnimation,
            child: GestureDetector(
              onTap: widget.onTap,
              child: Container(
                height: 160,
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: widget.gradient,
                  borderRadius: AppTheme.cardRadius,
                  boxShadow: AppTheme.cardShadow,
                ),
                child: Stack(
                  children: [
                    // Background Pattern
                    Positioned(
                      top: -20,
                      right: -20,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -30,
                      left: -30,
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.05),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),

                    // Content
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Icon
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              widget.icon,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),

                          const SizedBox(height: 16),

                          // Title
                          Text(
                            widget.title,
                            style: AppTheme.cardTitle.copyWith(
                              fontSize: 12,
                              height: 1.3,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),

                          const Spacer(),

                          // Animated Value
                          AnimatedBuilder(
                            animation: _numberAnimation,
                            builder: (context, child) {
                              final displayValue = widget.value == '-1' 
                                  ? '...'
                                  : (int.tryParse(widget.value) != null
                                      ? (_numberAnimation.value * int.parse(widget.value)).round().toString()
                                      : widget.value);

                              return Text(
                                displayValue,
                                style: AppTheme.cardValue.copyWith(
                                  fontSize: displayValue.length > 6 ? 22 : 28,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),

                    // Tap Effect Overlay
                    if (widget.onTap != null)
                      Positioned.fill(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: AppTheme.cardRadius,
                            onTap: widget.onTap,
                            splashColor: Colors.white.withOpacity(0.2),
                            highlightColor: Colors.white.withOpacity(0.1),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// Helper function to get appropriate gradient for different stat types
class StatCardGradients {
  static const academic = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF667eea), Color(0xFF764ba2)],
  );

  static const vocational = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFf093fb), Color(0xFFf5576c)],
  );

  static const allotment = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF4facfe), Color(0xFF00f2fe)],
  );

  static const admission = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFfa709a), Color(0xFFfee140)],
  );

  static const college = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFa8edea), Color(0xFFfed6e3)],
  );

  static const government = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF667eea), Color(0xFF764ba2)],
  );
} 