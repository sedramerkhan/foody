import 'package:flutter/material.dart';

/// Global navigator key for accessing context without BuildContext
/// 
/// This key is used to access the root navigator context, which allows
/// accessing AppLocalizations and other context-dependent features
/// without passing BuildContext around.
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

