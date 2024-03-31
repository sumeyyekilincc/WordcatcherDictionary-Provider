import 'package:dictionary/ui/views/dashboard/vm_dashboard.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(
    create: (context) => VMDashboard(),
  ),
];
