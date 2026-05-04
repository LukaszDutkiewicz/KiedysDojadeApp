import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

/// Helper uprawnień (cienka warstwa nad `permission_handler`).
/// Flow w [ensure]: granted → true; permanentlyDenied → dialog z
/// `rationale` + `openAppSettings()` → false; w przeciwnym razie
/// systemowy prompt przez `permission.request()`.
/// Używany przez ekrany przed sięgnięciem po sensor / medium / kontakty.
class PermissionHelper {
  static Future<bool> ensure(
    BuildContext context,
    Permission permission, {
    required String rationale,
  }) async {
    var status = await permission.status;

    if (status.isGranted) return true;

    if (status.isPermanentlyDenied) {
      // Po `await` (powyżej `permission.status`) widget mógł zostać usunięty
      // z drzewa — np. użytkownik cofnął się z ekranu. Wtedy `context` jest
      // już nieprawidłowy i pokazanie dialogu rzuci błąd „BuildContext used
      // after dispose". Sprawdzenie `context.mounted` chroni przed tym.
      // Ten sam wzorzec powtarza się w ekranach (`mounted` w State<>).
      if (!context.mounted) return false;
      final goSettings = await _showSettingsDialog(context, rationale);
      if (goSettings == true) await openAppSettings();
      return false;
    }

    status = await permission.request();
    return status.isGranted;
  }

  static Future<bool?> _showSettingsDialog(BuildContext context, String rationale) {
    return showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Brak uprawnień'),
        content: Text('$rationale\n\nOtworzyć ustawienia aplikacji?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Anuluj')),
          FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Ustawienia')),
        ],
      ),
    );
  }
}
