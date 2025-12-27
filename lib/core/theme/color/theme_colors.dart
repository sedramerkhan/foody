part of 'app_colors.dart';

enum ThemeColors {
  // ------- Primary Brand Colors (Food Delivery - Warm Orange/Red) -------
  // Primary color: Warm orange-red for appetite and energy (like Uber Eats, DoorDash)
  brand800(color: Color(0xFFC4320A)), // Dark orange-red
  brand700(color: Color(0xFFE65100)), // Deep orange
  brand600(color: Color(0xFFFF6B35)), // Vibrant orange-red
  brand500(color: Color(0xFFFF5722)), // Primary orange-red (main brand color)
  brand400(color: Color(0xFFFF8A65)), // Light orange-red
  brand300(color: Color(0xFFFFAB91)), // Lighter orange
  brand200(color: Color(0xFFFFCCBC)), // Very light orange
  brand100(color: Color(0xFFFFE0B2)), // Pale orange
  brand50(color: Color(0xFFFFF3E0)), // Very pale orange
  brand25(color: Color(0xFFFFF8F3)), // Almost white with orange tint

  // ------- Secondary Colors (Complementary Warm Yellow) -------
  // Secondary color: Warm yellow for highlights and accents
  secondary(color: Color(0xFFFFB300)), // Warm yellow
  secondary700(color: Color(0xFFFFA000)), // Darker yellow
  secondary500(color: Color(0xFFFFB300)), // Main secondary
  secondary300(color: Color(0xFFFFC107)), // Light yellow
  secondary100(color: Color(0xFFFFF9C4)), // Very light yellow

  // ------- System Colors -------
  blackMain(color: Color(0xFF191C1E)),
  whiteMain(color: Color(0xFFFFFFFF)),

  // ------- Gray Colors -------
  grey900(color: Color(0xFF101828)),
  grey800(color: Color(0xFF1D2939)),
  grey700(color: Color(0xFF344054)),
  grey600(color: Color(0xFF475467)),
  grey500(color: Color(0xFF667085)),
  grey400(color: Color(0xFF98A2B3)),
  grey300(color: Color(0xFFD0D5DD)),
  grey200(color: Color(0xFFE7EAEE)),
  grey100(color: Color(0xFFF2F4F7)),
  grey50(color: Color(0xFFF5F5F5)),
  grey25(color: Color(0xFFFCFCFD)),


  // ------ Red Colors (Error/Warning) -------
  red700(color: Color(0xFFC62828)), // Dark red
  red500(color: Color(0xFFE53935)), // Error red
  red400(color: Color(0xFFEF5350)), // Light red
  red300(color: Color(0xFFE57373)), // Lighter red
  red200(color: Color(0xFFEF9A9A)), // Very light red
  red50(color: Color(0xFFFFEBEE)), // Pale red


  // ------ Rating/Star Color -------
  star(color: Color(0xFFFFB300)), // Warm yellow for ratings


  // ------ Success Colors -------
  success50(color: Color(0xFFE8F5E9)), // Pale green
  success500(color: Color(0xFF4CAF50)), // Success green
  success700(color: Color(0xFF2E7D32)); // Dark green



  const ThemeColors({required this.color});

  final Color color;
}
