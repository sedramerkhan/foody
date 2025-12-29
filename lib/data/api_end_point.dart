/// API endpoint constants
class ApiEndPoint {
  ApiEndPoint._();

  // Auth endpoints
  static const String signIn = '/auth/signin';
  static const String signUp = '/auth/signup';
  static const String signOut = '/auth/signout';

  // Restaurant endpoints
  static const String getRestaurants = '/restaurants';
  static String getMenuItems(String restaurantId) => '/restaurants/$restaurantId/menu';
}

