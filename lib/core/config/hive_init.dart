

import 'dart:io';

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


    //todo:
    // Hive
    //   ..init(path)
    //   ..registerAdapters();
  }

