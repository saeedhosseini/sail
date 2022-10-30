import 'package:flutter/material.dart';
import 'package:sail_app/constant/app_colors.dart';
import 'package:sail_app/constant/app_dimens.dart';
import 'package:sail_app/constant/app_images.dart';
import 'package:sail_app/constant/app_strings.dart';
import 'package:sail_app/models/user_model.dart';
import 'package:sail_app/utils/navigator_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GuidePage extends StatefulWidget {
  const GuidePage({Key? key}) : super(key: key);

  @override
  GuidePageState createState() => GuidePageState();
}

class GuidePageState extends State<GuidePage> {
  var guides = [AppImages.guide1, AppImages.guide2, AppImages.guide3];
  var _showButton = false;

  @override
  Widget build(BuildContext context) {
    UserModel().setIsFirstOpen(false);

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            _guideWidget(),
            Positioned(
                right: ScreenUtil().setWidth(30),
                bottom: ScreenUtil().setHeight(30),
                child: Offstage(
                  offstage: !_showButton,
                  child: Center(
                      child: TextButton(
                    style: TextButton.styleFrom(
                      primary: AppColors.themeColor,
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                    ),
                    onPressed: () {
                      NavigatorUtil.goHomePage(context);
                    },
                    child: const Text(AppStrings.openDoor, style: TextStyle(fontSize: AppDimens.bigTextSize)),
                  )),
                )),
          ],
        ));
  }

  Widget _guideWidget() {
    return const SizedBox();
    /*return Swiper(
      itemCount: guides.length,
      //item数量
      scrollDirection: Axis.horizontal,
      //滚动方向 设置为Axis.vertical如果需要垂直滚动
      itemBuilder: (BuildContext context, int index) {
        return Image.asset(
          guides[index],
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        );
      },
      autoplay: false,
      //自动滚动
      loop: false,
      //循环滚动
      pagination: const SwiperPagination(
          alignment: Alignment.bottomCenter,
          builder: DotSwiperPaginationBuilder(
            activeColor: Color(0xFFFF5722), //选中的颜色
            color: Color(0xFF999999), //非选中的颜色
          )),
      onIndexChanged: ((value) {
        //图片数组下标变化监听
        if (value == guides.length - 1) {
          setState(() {
            _showButton = true;
          });
        } else if (_showButton && value != guides.length - 1) {
          //减少非必要的setState 只有当滑动到最后一张图片然后向做滑动的时候触发
          setState(() {
            _showButton = false;
          });
        }
      }),
    );*/
  }
}
