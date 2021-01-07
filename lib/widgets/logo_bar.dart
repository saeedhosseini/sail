import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sail_app/constant/app_colors.dart';
import 'package:sail_app/utils/shared_preferences_util.dart';
import 'package:sail_app/view_model/user_view_model.dart';

class LogoBar extends StatelessWidget {
  const LogoBar({
    Key key,
    @required this.isOn,
  }) : super(key: key);

  final bool isOn;

  @override
  Widget build(BuildContext context) {
    UserViewModel _userViewModel = Provider.of<UserViewModel>(context);

    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setWidth(50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Text("瞰视云加速",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 25,
              color: isOn? AppColors.GRAY_COLOR: Colors.white,
            ),
          ),

          // Premium Button
          Material(
            color: isOn? Color(0x66000000): AppColors.DARK_SURFACE_COLOR,
            borderRadius: BorderRadius.circular(15),
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: (){
                SharedPreferencesUtil.getInstance().clear();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 11, horizontal: 15),
                child: Row(
                  children: [
                    Icon(MaterialCommunityIcons.wallet_outline,
                        color: Colors.yellow
                    ),
                    Padding(padding: EdgeInsets.only(left: ScreenUtil().setWidth(5))),
                    Text('余额：${_userViewModel?.userSubscribeEntity?.balance ?? 0}',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}