import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  /// Request Location Permission
  static Future<PermissionStatus> requestLocationPermission(BuildContext context) async {
    var status = await Permission.location.request();
    if (status.isDenied || status.isPermanentlyDenied) {
      _showPermissionDialog(context, 'Location');
    }
    return status;
  }

  /// Request Notification Permission
  static Future<PermissionStatus> requestNotificationPermission(
    BuildContext context,
  ) async {
    var status = await Permission.notification.request();

    if (status.isDenied || status.isPermanentlyDenied) {
      _showPermissionDialog(context, 'Notification');
    }
    return status;
  }

  /// Common dialog for denied permissions
  static void _showPermissionDialog(
    BuildContext context,
    String permissionName,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('$permissionName Permission Required'),
        content: Text(
          'Please enable $permissionName permission in settings to continue.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              openAppSettings();
            },
            child: const Text('Open Settings'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
