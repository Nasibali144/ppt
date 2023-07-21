// import 'package:flutter/material.dart';
// import 'package:ppt/controllers/base_controller.dart';
// import 'package:ppt/core/service_locator.dart';
// import 'package:provider/provider.dart';
//
// class BaseScreen<T extends BaseController> extends StatelessWidget {
//   final Widget? child;
//   final Widget Function(BuildContext context, Widget? child) builder;
//   const BaseScreen({Key? key, this.child, required this.builder}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<T>(
//       create: (context) => locator<T>(),
//       child: _SubScreen<T>(builder: builder, key: key, child: child),
//     );
//   }
// }
//
// class _SubScreen<T extends BaseController> extends StatefulWidget {
//   final Widget? child;
//   final Widget Function(BuildContext context, Widget? child) builder;
//   const _SubScreen({Key? key, this.child, required this.builder}) : super(key: key);
//
//   @override
//   State<_SubScreen> createState() => _SubScreenState<T>();
// }
//
// class _SubScreenState<T extends BaseController> extends State<_SubScreen> {
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     context.read<T>().init();
//   }
//
//   @override
//   void deactivate() {
//     super.deactivate();
//     context.read<T>().close();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return widget.builder(context, widget.child);
//   }
// }
//
