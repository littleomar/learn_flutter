import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/model/common_model.dart';
import 'package:url_launcher/url_launcher.dart';


class LocalNav extends StatelessWidget {

  LocalNav({Key key, this.localNavList}):super(key: key);
  final List<CommonModel> localNavList;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.getInstance().setWidth(750.00),
      height: ScreenUtil.getInstance().setHeight(136.00),
      child: Center(
        child: Container(
          width: ScreenUtil.getInstance().setWidth(702),
          padding: EdgeInsets.fromLTRB(0, ScreenUtil.getInstance().setHeight(16), 0, ScreenUtil.getInstance().setHeight(16)),
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 1),
            borderRadius: BorderRadius.circular(ScreenUtil.getInstance().setHeight(16.00)),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.08),
                offset: Offset(0, ScreenUtil.getInstance().setWidth(4)),
              )
            ]
          ),
          child: Wrap(
            children: localNavList.map((i) => _NavItem(navData: i)).toList(),
          ),
        ),
      ),
    );
  }
}


class _NavItem extends StatelessWidget {

  _NavItem({Key key, this.navData}):super(key: key);
  final CommonModel navData;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.getInstance().setWidth(140.40),
      child: InkWell(
        onTap: () async {
          var url = this.navData.url;
          if (await canLaunch(url)) {
          await launch(url);
          } else {
          throw 'Could not launch $url';
          }
        },
        child: Column(
          children: <Widget>[
            Image.network(
              navData.icon,
              width: ScreenUtil.getInstance().setWidth(80),
              height: ScreenUtil.getInstance().setHeight(68),
            ),
            Text(navData.title),
          ],
        ),
      ),
    );
  }
}

