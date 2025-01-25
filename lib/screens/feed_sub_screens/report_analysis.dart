import 'package:flutter/material.dart';
import 'package:safegaurd/constants/colors.dart';
import 'package:safegaurd/screens/home/home.dart';
import 'package:safegaurd/screens/support&help/help.dart';
import 'package:safegaurd/screens/widgets/appbar.dart';

class ReportAnalysisScreen extends StatelessWidget {
  const ReportAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbar(label: "Report Analysis")
    );
  }
}