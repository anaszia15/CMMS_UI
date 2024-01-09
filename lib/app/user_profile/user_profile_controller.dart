import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/user_profile/user_profile_presenter.dart';
import 'package:cmms/domain/models/get_notification_by_userid_model.dart';
import 'package:cmms/domain/models/getuser_access_byId_model.dart';
import 'package:get/get.dart';

import '../../domain/models/user_detail_model.dart';

class UserProfileController extends GetxController {
  UserProfileController(
    this.userProfilePresenter,
  );
  UserProfilePresenter userProfilePresenter;
  Rx<int> userId = 0.obs;
  Rx<UserDetailsModel?> userDetailModel = UserDetailsModel().obs;
  RxList<PlantList?> plantListModel = <PlantList?>[].obs;
  Rx<GetAccessLevelByIdModel?> accessListModel = GetAccessLevelByIdModel().obs;
  RxList<GetAccessLevel?> accessList = <GetAccessLevel>[].obs;
  Rx<GetNotificationByUserIdModel?> notificationByUserIdModel =
      GetNotificationByUserIdModel().obs;
  RxList<NotificationListByUserId?> notificationListByUserId =
      <NotificationListByUserId>[].obs;

  //int selectedRoleId = 0;
  // Rx<AccessLevelModel?> accessLevelModel = AccessLevelModel().obs;
  // RxList<AccessLevel?> accesslevel = <AccessLevel>[].obs;

  @override
  void onInit() async {
    await setUserId();

    // userId = varUserAccessModel.value.user_id ?? 0; //Get.arguments;
    if (userId.value != 0) {
      await getUserDetails(userId: userId.value, isloading: true);
    }

    super.onInit();
  }

  Future<void> setUserId() async {
    try {
      final _userId = await userProfilePresenter.getValue();
      if (_userId == null || _userId == '' || _userId == "null") {
        var dataFromPreviousScreen = Get.arguments;

        userId.value = dataFromPreviousScreen['userId'];
        userProfilePresenter.saveValue(userId: userId.value.toString());
      } else {
        userId.value = int.tryParse(_userId) ?? 0;
      }
    } catch (e) {
      print(e.toString() + 'userId');
      //  Utility.showDialog(e.toString() + 'userId');
    }
  }

  Future<void> getUserDetails({int? userId, bool? isloading}) async {
    final _userDetailModel = await userProfilePresenter.getUserDetails(
        userId: userId, isLoading: isloading);

    if (_userDetailModel != null) {
      userDetailModel.value = _userDetailModel;
      plantListModel.value = _userDetailModel.plant_list ?? [];
      // selectedRoleId = userDetailModel.value?.role_id ?? 0;
      await getUserAccessListById(userId: userId, isloading: true);
      await getUserNotificationListById(userId: userId, isloading: true);

      // await getRoleAccessList(roleId: selectedRoleId, isloading: true);
    }
  }

  Future<void> getUserNotificationListById(
      {int? userId, bool? isloading}) async {
    final _notificationListModel = await userProfilePresenter
        .getUserNotificationListById(userId: userId, isLoading: isloading);
    if (_notificationListModel != null) {
      notificationByUserIdModel.value = _notificationListModel;
      notificationListByUserId.value =
          notificationByUserIdModel.value?.notification_list ?? [];
    }
  }

  Future<void> getUserAccessListById({int? userId, bool? isloading}) async {
    final _accessListModel = await userProfilePresenter.getUserAccessListById(
        userId: userId, isLoading: isloading);
    print({"repsss", _accessListModel});
    if (_accessListModel != null) {
      accessListModel.value = _accessListModel;
      accessList.value = accessListModel.value?.access_list ?? [];
    }
  }
  // Future<void> getRoleAccessList({int? roleId, bool? isloading}) async {
  //   final _accessLevelModel = await userProfilePresenter.getRoleAccessList(
  //       roleId: roleId, isLoading: isloading);

  //   if (_accessLevelModel != null) {
  //     accessLevelModel.value = _accessLevelModel;
  //     accesslevel.value = accessLevelModel.value?.access_list ?? [];
  //   }
  // }

  Future<void> editProfile() async {
    userProfilePresenter.clearValue();

    Get.toNamed(Routes.addUser, arguments: {
      'userId': userId.value,
    });
  }
}
