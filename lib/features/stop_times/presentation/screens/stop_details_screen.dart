import 'package:flutter/material.dart';
import 'package:kiedys_dojade/features/stop_times/presentation/widgets/stop_details_widget.dart';
import 'package:kiedys_dojade/shared/domain/entities/stop.dart';

class StopDetailsScreen extends StatelessWidget {
  const StopDetailsScreen({super.key, required this.stop});
  final Stop stop;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(stop.name),
            Text(
              stop.code,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Colors.white70),
            ),
          ],
        ),
      ),
      body: StopDetailsWidget(stopCode: stop.code),
    );
  }
}
