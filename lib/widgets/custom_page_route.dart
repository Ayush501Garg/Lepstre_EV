import 'package:flutter/material.dart';

enum TransitionType { fade, slide, scale }

class CustomPageRoute extends PageRouteBuilder {
  final Widget child;
  final TransitionType transitionType;
  final Duration duration;

  CustomPageRoute({
    required this.child,
    this.transitionType = TransitionType.scale,
    this.duration = const Duration(milliseconds: 600),
  }) : super(
         transitionDuration: duration,
         pageBuilder: (context, animation, secondaryAnimation) => child,
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           final curve = CurvedAnimation(
             parent: animation,
             curve: Curves.easeInOut,
           );

           switch (transitionType) {
             case TransitionType.fade:
               return FadeTransition(opacity: curve, child: child);
             case TransitionType.scale:
               return ScaleTransition(scale: curve, child: child);
             case TransitionType.slide:
               return SlideTransition(
                 position: Tween<Offset>(
                   begin: const Offset(1, 0),
                   end: Offset.zero,
                 ).animate(curve),
                 child: child,
               );
           }
         },
       );
}
