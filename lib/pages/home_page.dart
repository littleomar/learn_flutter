import 'package:flutter/material.dart';
import 'package:flutter_app/dao/home_dao.dart';
import 'package:flutter_app/model/home_model.dart';
import 'package:flutter_app/widget/local_nav.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ScrollController _mainScrollController = ScrollController();
  double _listViewOffset = 0;
  HomeModel _homeData;

  @override
  initState() {
    HomeDao.fetch().then((HomeModel val){
      setState(() {
        _homeData = val;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Container(
      child: Stack(
        children: <Widget>[
          NotificationListener(
            onNotification: (notification) {
              if (notification.runtimeType == ScrollUpdateNotification && notification.depth == 0) {
                setState(() {
                  _listViewOffset = notification.metrics.pixels;
                });
                return false;
              } else {
                return false;
              }
            },
            child: ListView(
              controller: _mainScrollController,
              children: <Widget>[
                Container(
                  height: ScreenUtil.getInstance().setHeight(510),
                  child: Stack(
                    children: <Widget>[
                      _HomeSwiper(),
                      Positioned(
                        top: ScreenUtil.getInstance().setWidth(360),
                        child: (_homeData != null) ? LocalNav(localNavList: _homeData.localNavList) : Container(
                          width: 0,
                          height: 0,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Center(
                    child: Text('A'),
                  ),
                ),
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Center(
                    child: Text('A'),
                  ),
                ),
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Center(
                    child: Text('A'),
                  ),
                ),
                Container(
                  height: 600,
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Center(
                    child: Text('A'),
                  ),
                ),
              ],
            ),
          ),
          _CustomerAppBar(offset: _listViewOffset),
        ],
      ),
      );
  }
}






// 自定义顶部appBar，实现滚动透明度渐变的功能
class _CustomerAppBar extends StatelessWidget {
  _CustomerAppBar({Key key,this.offset}):super(key:key);
  static const _MAX_SCROLL_LENGTH = 100;
  final double offset;
  double _opacity;
  @override
  Widget build(BuildContext context) {
    _opacity = offset / _MAX_SCROLL_LENGTH;
    _opacity = _opacity >1 ? 1 : _opacity;
    return offset >=0 ? Container(
      height: ScreenUtil.getInstance().setHeight(88),
      color: Color.fromRGBO(255, 255, 255, _opacity),
    ) : Container(height: 0);
  }
}

// 首页轮播图组件
class _HomeSwiper extends StatelessWidget {
  final List<String> _swiperImgList = [
    "https://dimg04.c-ctrip.com/images/zg0a15000000ypf1tBC70.jpg",
    "https://dimg04.c-ctrip.com/images/zg0q1600000108ozmBD89.jpg",
    "https://dimg04.c-ctrip.com/images/zg0r16000000yrvpo1109.jpg",
    "https://dimg04.c-ctrip.com/images/zg0e15000000yqzweE43E.jpg",
    "https://dimg04.c-ctrip.com/images/zg07170000011kfkn5FD4.jpg",
    "https://dimg04.c-ctrip.com/images/zg0u160000010b5ol640F.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil.getInstance().setHeight(448.24),
      width: ScreenUtil.getInstance().setWidth(750),
      child: Swiper(
        autoplay: true,
        itemCount: _swiperImgList.length,
        itemBuilder: (BuildContext context,int index){
          return new Image.network(_swiperImgList[index],fit: BoxFit.fill,);
        },
        pagination: _CustomPaginationDots(),
      ),
    );
  }
}

// 自定义轮播图下的pagination
class _CustomPaginationDots extends SwiperPlugin {

  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {
    return Positioned(
      top: ScreenUtil.getInstance().setWidth(325.50),
      right: ScreenUtil.getInstance().setWidth(12.00),
      child: Container(
        height: ScreenUtil.getInstance().setWidth(16.00),
        width: ScreenUtil.getInstance().setWidth(188.00),
        child: Row(
          children: List(6).asMap().keys.map((val) {
            return val == config.activeIndex ? dotItem(true) : dotItem(false);
          }).toList(),
        ),
      ),
    );
  }

  Widget dotItem(bool isActive) {
    return Container(
      width: ScreenUtil.getInstance().setWidth(isActive ? 48.00 : 16.00),
      height: ScreenUtil.getInstance().setWidth(16.00),
      margin: EdgeInsets.fromLTRB(ScreenUtil.getInstance().setWidth(2), 0, ScreenUtil.getInstance().setWidth(8), 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ScreenUtil.getInstance().setWidth(16.00)),
        color: isActive ? Color.fromRGBO(255, 255, 255, 1) : Color.fromRGBO(255, 255, 255, 0.4),
      ),
    );
  }
}

