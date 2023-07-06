import 'package:flutter/material.dart';

import '../models/model_export.dart';
import '../utilities/custom_app_logger.dart';

class LoggerScreen extends StatefulWidget {
  const LoggerScreen({super.key});

  @override
  State<LoggerScreen> createState() => _LoggerScreenState();
}

class _LoggerScreenState extends State<LoggerScreen> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async => CustomLogger.sendEmailWithAttachment(
              'PFA logs with the mail',
            ),
            icon: const Icon(
              Icons.share,
            ),
          )
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: CustomLogger.fetchLogs(),
          builder: (final _, final snapshot) {
            if (snapshot.hasData &&
                snapshot.data != null &&
                snapshot.data!.errorData != null &&
                snapshot.data!.errorData!.isNotEmpty) {
              final List<ErrorData> errorData = snapshot.data!.errorData!;
              return ListView.builder(
                itemBuilder: (final _, final index) => ListTile(
                  title: Text(errorData[index].errorDescription ?? ""),
                  subtitle: Text(errorData[index].errorTimestamp ?? ""),
                ),
                itemCount: errorData.length,
              );
            } else {
              return const Text('No logs to display');
            }
          },
        ),
      ),
    );
  }
}
