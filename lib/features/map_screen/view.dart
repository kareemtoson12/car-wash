import 'package:clean_wash/core/widgets/selection_widget.dart';

import 'package:flutter/material.dart';

import '../../core/widgets/screen_title_widget.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ScreenTitleWidget('Pick location'),
                const Divider(),
                SelectionWidget('Select your Location ',
                    'Select where you wantto wash  your car'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
