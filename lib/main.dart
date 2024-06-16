import 'package:apidash/hive_directory_selector.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'services/services.dart';
import 'consts.dart' show kIsLinux, kIsMacOS, kIsWindows;
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;
  if (kIsLinux) {
    await setupInitialWindow();
  }
  if (kIsMacOS || kIsWindows) {
    var win = getInitialSize();
    await setupWindow(sz: win.$1, off: win.$2);
  }

  runApp(
    HiveDirectorySelector(
      getDirectoryPath: FilePicker.platform.getDirectoryPath,
      child: const ProviderScope(
        child: DashApp(),
      ),
    ),
  );
}
