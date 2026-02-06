import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// App color palette matching VS Code Dark theme
class AppColors {
  // Background Colors
  static const Color bgPrimary = Color(0xFF1E1E1E);
  static const Color bgSecondary = Color(0xFF252526);
  static const Color bgTertiary = Color(0xFF2D2D2D);
  static const Color bgElevated = Color(0xFF333333);
  static const Color bgHover = Color(0xFF3C3C3C);
  static const Color bgActive = Color(0xFF094771);

  // Text Colors
  static const Color textPrimary = Color(0xFFD4D4D4);
  static const Color textSecondary = Color(0xFF9D9D9D);
  static const Color textMuted = Color(0xFF6D6D6D);
  static const Color textBright = Color(0xFFFFFFFF);

  // Accent Colors (Syntax Theme)
  static const Color accentBlue = Color(0xFF569CD6);
  static const Color accentLightBlue = Color(0xFF9CDCFE);
  static const Color accentGreen = Color(0xFF6A9955);
  static const Color accentLightGreen = Color(0xFFB5CEA8);
  static const Color accentOrange = Color(0xFFCE9178);
  static const Color accentYellow = Color(0xFFDCDCAA);
  static const Color accentPurple = Color(0xFFC586C0);
  static const Color accentCyan = Color(0xFF4EC9B0);
  static const Color accentRed = Color(0xFFF44747);

  // Phase Badge Colors
  static const Color phase1 = Color(0xFF4CAF50);  // Foundations - Green
  static const Color phase2 = Color(0xFF2196F3);  // Control Flow - Blue
  static const Color phase3 = Color(0xFF9C27B0);  // Functions - Purple
  static const Color phase4 = Color(0xFFFF9800);  // Data Structures - Orange
  static const Color phase5 = Color(0xFF00BCD4);  // The DOM - Cyan
  static const Color phase6 = Color(0xFFE91E63);  // OOP - Pink
  static const Color phase7 = Color(0xFF607D8B);  // Async JS - Blue Gray
  static const Color phase8 = Color(0xFF795548);  // Advanced - Brown

  // UI Colors
  static const Color borderColor = Color(0xFF3C3C3C);
  static const Color borderLight = Color(0xFF454545);

  // Code block colors
  static const Color dotRed = Color(0xFFFF5F56);
  static const Color dotYellow = Color(0xFFFFBD2E);
  static const Color dotGreen = Color(0xFF27C93F);

  /// Get phase color by phase number (1-8)
  static Color getPhaseColor(int phase) {
    switch (phase) {
      case 1: return phase1;
      case 2: return phase2;
      case 3: return phase3;
      case 4: return phase4;
      case 5: return phase5;
      case 6: return phase6;
      case 7: return phase7;
      case 8: return phase8;
      default: return phase1;
    }
  }
}

/// App spacing constants
class AppSpacing {
  static const double space1 = 4;
  static const double space2 = 8;
  static const double space3 = 12;
  static const double space4 = 16;
  static const double space5 = 20;
  static const double space6 = 24;
  static const double space8 = 32;
  static const double space10 = 40;
  static const double space12 = 48;
}

/// App border radius constants
class AppRadius {
  static const double sm = 4;
  static const double base = 8;
  static const double lg = 12;
}

/// App theme configuration
class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.bgPrimary,
      primaryColor: AppColors.accentBlue,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.accentBlue,
        secondary: AppColors.accentYellow,
        surface: AppColors.bgSecondary,
        error: AppColors.accentRed,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.bgSecondary,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.textBright,
        ),
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      cardTheme: CardThemeData(
        color: AppColors.bgSecondary,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          side: const BorderSide(color: AppColors.borderColor),
        ),
      ),
      textTheme: GoogleFonts.interTextTheme().apply(
        bodyColor: AppColors.textPrimary,
        displayColor: AppColors.textBright,
      ),
      iconTheme: const IconThemeData(color: AppColors.textPrimary),
      dividerTheme: const DividerThemeData(
        color: AppColors.borderColor,
        thickness: 1,
      ),
    );
  }
}

/// Text styles for the app
class AppTextStyles {
  // Headings
  static TextStyle get h1 => GoogleFonts.inter(
    fontSize: 36,
    fontWeight: FontWeight.w700,
    color: AppColors.textBright,
    height: 1.3,
  );
  
  static TextStyle get h2 => GoogleFonts.inter(
    fontSize: 30,
    fontWeight: FontWeight.w600,
    color: AppColors.textBright,
    height: 1.3,
  );
  
  static TextStyle get h3 => GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.textBright,
    height: 1.3,
  );
  
  static TextStyle get h4 => GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textBright,
    height: 1.3,
  );

  // Body text
  static TextStyle get body => GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.6,
  );
  
  static TextStyle get bodySecondary => GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.6,
  );
  
  static TextStyle get bodySmall => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.6,
  );

  static TextStyle get caption => GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
    height: 1.5,
  );

  // Code
  static TextStyle get code => GoogleFonts.firaCode(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.6,
  );
  
  static TextStyle get codeSmall => GoogleFonts.firaCode(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  // Logo
  static TextStyle get logoIcon => GoogleFonts.firaCode(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.accentYellow,
  );
  
  static TextStyle get logoText => GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textBright,
  );
}
