import 'package:cyberking_capitals/app/core/values/enums.dart';
import 'package:cyberking_capitals/app/modules/store/controller.dart';
import 'package:cyberking_capitals/app/routes/routes.dart';
import 'package:cyberking_capitals/app/widgets/common_alerts.dart';
import 'package:cyberking_capitals/app/widgets/try_again.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'widgets/store_module_card.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  final _controller = Get.put(StoreController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Store"),
      ),
      body: GetBuilder(
        init: _controller,
        id: "Main Screen",
        initState: (_) {},
        builder: (_) {
          return (_controller.screenState == ScreenState.loading)
              ? const Center(child: CircularProgressIndicator())
              : (_controller.screenState == ScreenState.error)
                  ? TryAgain(
                      onPressed: () {
                        _controller.fetchInitData();
                      },
                    )
                  : _buildLoadedScreen();
        },
      ),
    );
  }

  Column _buildLoadedScreen() {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: RefreshIndicator(
              onRefresh: () async {
                _controller.fetchInitData();
              },
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _controller.moduleList.length,
                itemBuilder: (context, index) => StoreModuleCard(
                  index: index,
                  description: _controller.moduleList[index].moduleDesc,
                  title: _controller.moduleList[index].moduleName,
                  thumbnail: _controller.moduleList[index].thumbnail,
                  moduleFees: _controller.moduleList[index].moduleFees,
                  discount: _controller.moduleList[index].discountAmount,
                  session: _controller.moduleList[index].sessions?.length,
                  productCategory:
                      _controller.moduleList[index].productCategory,
                  onTap: () {
                    Get.toNamed(AppRoute.studyModule, arguments: {
                      "module": _controller.moduleList[index],
                      "isLocked": true
                    });
                  },
                  onBuy: () {
                    final productCategory =
                        _controller.moduleList[index].productCategory;
                    if (productCategory == "Free") {
                      _controller.claimFreeModule(
                          _controller.moduleList[index].productId);
                    } else {
                      CommonAlerts.showWarning(message: "Cooming Soon");
                    }
                    // Get.to(() => PaymentUI());
                  },
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
