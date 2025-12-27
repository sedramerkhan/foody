import 'package:flutter/material.dart';

/// Extracts the real arguments map from navigation arguments.
/// 
/// If wrapped under `originalArguments`, unwrap and return it.
/// Otherwise return the args as-is.
Map<String, dynamic> extractData(Map<String, dynamic>? args) {
  if (args == null) return {};
  
  if (args.containsKey('originalArguments') && 
      args['originalArguments'] is Map<String, dynamic>) {
    return args['originalArguments'] as Map<String, dynamic>;
  }
  
  return args;
}

/// Convenience helper to read the current route arguments as a `Map<String, dynamic>`.
Map<String, dynamic>? getRouteArgs(BuildContext context) {
  return ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
}

