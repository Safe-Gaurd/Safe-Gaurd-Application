import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:safegaurd/backend/providers/report.dart';
import 'package:safegaurd/backend/providers/user_provider.dart';

class AppProvider
{
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => UserProvider()),
    ChangeNotifierProvider(create: (_) => ReportDataProvider()),
  ];
}