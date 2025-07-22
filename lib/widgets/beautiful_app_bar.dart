import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class BeautifulAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final LinearGradient? gradient;

  const BeautifulAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.showBackButton = true,
    this.onBackPressed,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient ?? AppTheme.primaryGradient,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: AppBar(
        title: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: showBackButton && Navigator.canPop(context)
            ? IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: onBackPressed ?? () => Navigator.pop(context),
              )
            : null,
        actions: actions?.map((action) {
          // Ensure all actions have white color
          if (action is IconButton) {
            return IconButton(
              icon: action.icon,
              onPressed: action.onPressed,
              color: Colors.white,
            );
          }
          return action;
        }).toList(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class BeautifulPopupMenu extends StatelessWidget {
  final List<PopupMenuEntry<int>> items;
  final Function(int)? onSelected;

  const BeautifulPopupMenu({
    Key? key,
    required this.items,
    this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        popupMenuTheme: PopupMenuThemeData(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 20,
        ),
      ),
      child: PopupMenuButton<int>(
        icon: const Icon(Icons.more_vert, color: Colors.white),
        onSelected: onSelected,
        itemBuilder: (context) => items,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

// Custom popup menu item with better styling
class BeautifulPopupMenuItem extends PopupMenuItem<int> {
  BeautifulPopupMenuItem({
    Key? key,
    required int value,
    required String text,
    IconData? icon,
  }) : super(
          key: key,
          value: value,
          child: _PopupMenuItemContent(text: text, icon: icon),
        );
}

class _PopupMenuItemContent extends StatelessWidget {
  final String text;
  final IconData? icon;

  const _PopupMenuItemContent({
    required this.text,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (icon != null) ...[
          Icon(
            icon,
            color: const Color(0xFF667eea),
            size: 20,
          ),
          const SizedBox(width: 12),
        ],
        Text(
          text,
          style: GoogleFonts.poppins(
            color: const Color(0xFF2D3748),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
} 