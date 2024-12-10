import 'dart:ui';

import 'package:flutter/material.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key, required this.isLoading, required this.child});
  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return isLoading== true ? Stack(
      children: [
        child,
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            color: Colors.black.withOpacity(0.2),
          ),
        ),
        Center(
          child: CircularProgressIndicator(),
        ),
      ],
    ) : Container(
      child: child,
    );
  }
}

