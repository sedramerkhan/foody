import 'dart:io';

import 'package:foody/hive_registrar.g.dart';
import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<void> initAndRegisterHiveAdapters() async {
  // Get the application support directory (more secure than documents)
  final appDir = await getApplicationSupportDirectory();
  // Create a custom subdirectory for Hive databases
  final hiveDir = Directory('${appDir.path}/hive_databases');

  // Ensure the directory exists
  if (!await hiveDir.exists()) {
    await hiveDir.create(recursive: true);
  }

  final path = hiveDir.path;

  // Initialize Hive
  Hive.init(path);

  // Register User adapter
  Hive.registerAdapters();

}

