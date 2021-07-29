import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/models/news_model.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/res/colors.dart';
import 'package:ipfsnets/ui/pages/find/new_item.dart';
import 'package:ipfsnets/ui/widget/base_list_page.dart';


const List<NewsModel> newsList = [
  NewsModel(
      "中方将派军舰赴马六甲海峡护航本国船只？外交部：那是谣言', 环球网",
      "111",
      "https://p3.pstatp.com/list/190x124/pgc-image/RGSD09itseweQ",
      "2021-1-1"),
  NewsModel('211高校被误认野鸡大学发怒，名气还没“野鸡”大', '中国新闻周刊',
      'https://p1.pstatp.com/list/190x124/pgc-image/7026a3edfe2b47f59eea94f2b8cd86a4',"2021-1-1"),
  NewsModel(
      '广西矿王黎东明去世：瞒报81死矿难，把记者逼到悬崖边，遭售货员白眼后买下整柜台皮鞋',
      '大河看法',
      'https://p1.pstatp.com/list/190x124/pgc-image/c14366a3b7ab4a3384e3485697d103fe',
      "2021-1-1"),
  NewsModel(
      '六旬父亲“为儿追凶”16年：“赔多少钱都不要，就要他偿命”',
      '中国新闻周刊',
      'https://p3.pstatp.com/list/190x124/pgc-image/c55f17d3a3ac4efe8eaedafdab111079',
      "2021-1-1"),
  NewsModel(
      '五问玛莎拉蒂追尾案：肇事女孩有何背景？或面临死刑？',
      '环球网',
      'https://p1.pstatp.com/list/190x124/pgc-image/RVi866A4f9cVK2',
      "2021-1-1"),
  NewsModel(
      '李若彤：当年为爱作出任性选择，如今看来都是最好的安排',
      '新京报',
      'https://p3.pstatp.com/list/190x124/pgc-image/RVLwKBq5IQMvCW',
      "2021-1-1"),
  NewsModel(
      '好惨一首都！“史诗级”暴雨把华盛顿淹成了……这个样子',
      '环球网',
      'https://p1.pstatp.com/list/190x124/pgc-image/RVic5NyDDeVAi0',
      "2021-1-1"),
  NewsModel(
      '原子弹爆炸半衰期动不动几万年，为何广岛和长崎现在就能居住了？',
      '怪罗科普',
      'https://p1.pstatp.com/list/190x124/pgc-image/317a92302937426c999ea9a5b52121b1',
      "2021-1-1"),
  NewsModel(
      '马超和关羽到底谁强？古书记载颠覆历史，学者：根本不是一个级别',
      '田君良',
      'https://p3.pstatp.com/list/190x124/pgc-image/470fb21c5c884b119116179813b82d2b',
      "2021-1-1")
];

class FindRecommend extends StatefulWidget {
  @override
  _FindRecommendState createState() => _FindRecommendState();
}

class _FindRecommendState extends BaseListPageState<FindRecommend> {
  List<NewsModel> list = List.from(newsList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.bg_color,
      body: buildRefreshView(context)
    );
  }

  @override
  Widget setListView(int index) {
    return NewsItem(list[index]);
  }

  @override
  void onItemClick(BuildContext context, int index) {
    // TODO: implement onItemClick
  }

  @override
  int getListLength() {
    // TODO: implement getListSize
    LogUtil.e("----"+list.length.toString());

    return list.length;
  }


  @override
  Future<BaseEntity> getData() async{
    // TODO: implement getData
    BaseEntity entity = new BaseEntity(1, "2", newsList);
    list.addAll(entity.data);
    return entity;
  }

  @override
  void clearList() {
    list.clear();
  }
}
