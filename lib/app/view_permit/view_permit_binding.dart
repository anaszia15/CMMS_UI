
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/app/job_list/job_list_presenter.dart';
import 'package:cmms/app/view_permit/view_permit_controller.dart';
import 'package:cmms/app/view_permit/view_permit_presenter.dart';
import 'package:cmms/domain/usecases/view_permit_usecase.dart';
import 'package:cmms/domain/usecases/home_usecase.dart';
import 'package:cmms/domain/usecases/job_list_usecase.dart';
import 'package:get/get.dart';


class ViewPermitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ViewPermitController(
        Get.put(
          ViewPermitPresenter(
            ViewPermitUsecase(
              Get.find(),
            ),
          ),
        ),
         JobListPresenter(
          JobListUsecase(
            Get.find(),
          ),
        ),
        
      ),
    );
     Get.lazyPut(
      () => HomeController(
        Get.put(
          HomePresenter(
            HomeUsecase(
              Get.find(),
            ),
          ),
        ),
      ),
    );
    
  }
}
