import 'package:assignment/app/constants/asset_paths.dart';
import 'package:assignment/features/profile/data/model/user_model.dart';

class ProfileMockData {
  static final UserModel user = UserModel(
    name: 'Lucy Bond',
    email: 'lucybond08@gmail.com',
    avatarAsset: AssetPaths.avatarChat4,
  );
}
