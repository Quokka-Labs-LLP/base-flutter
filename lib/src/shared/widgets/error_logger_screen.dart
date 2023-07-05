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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FutureBuilder(
          future: CustomLogger.fetchLogs(),
          builder: (_, snapshot) {
            if (snapshot.hasData &&
                snapshot.data != null &&
                snapshot.data!.errorData != null &&
                snapshot.data!.errorData!.isNotEmpty) {
              List<ErrorData> errorData = snapshot.data!.errorData!;
              return ListView.builder(
                itemBuilder: (_, index) => ListTile(
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
