import 'package:activity_app/MVVM/viewmodels/add_User_Provider.dart';
import 'package:activity_app/MVVM/viewmodels/upload_text_provider.dart';
import 'package:provider/provider.dart';

class ProviderHelper {
  static List<ChangeNotifierProvider> Provider = [
    ChangeNotifierProvider<FirebaseProvider>(
        create: (context) => FirebaseProvider()),
    ChangeNotifierProvider<AddUserProvider>(
        create: (context) => AddUserProvider()),
  ];
}
