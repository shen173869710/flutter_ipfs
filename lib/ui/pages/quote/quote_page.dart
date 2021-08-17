
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipfsnets/http/quote_api.dart';
import 'package:ipfsnets/models/main_tab_entiy.dart';
import 'package:ipfsnets/models/quote_optional_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/res/colors.dart';
import 'package:ipfsnets/ui/pages/quote/quote_controller.dart';
import 'package:ipfsnets/ui/pages/quote/quote_optional_page.dart';
import 'package:ipfsnets/ui/pages/quote/quote_optional_serach_page.dart';
import 'package:ipfsnets/ui/pages/quote/quote_search_page.dart';
import '../../../include.dart';

class QuotePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _QuoteStatus();
  }
}

class _QuoteStatus extends State<QuotePage> with AutomaticKeepAliveClientMixin,TickerProviderStateMixin{

  List<MainTabEntiy> entiys = [];
  final QuoteController controller = Get.put(QuoteController());
  late TabController tabController = TabController(length: entiys.length, vsync: this);

  @override
  bool get wantKeepAlive => true;


  @override
  void initState() {
    super.initState();
    entiys = [
      MainTabEntiy(S.current.quote_item_1, QuoteOptionalPage(1)),
      MainTabEntiy(S.current.quote_item_2, QuoteOptionalPage(2)),
      MainTabEntiy(S.current.quote_item_3, QuoteOptionalPage(3)),
      MainTabEntiy(S.current.quote_item_4, QuoteOptionalSearchPage(4)),
    ];
    GlobalEntiy.history = StringUtil.getList();
    getData();
  }

  Future<void> getData() async {
    BaseEntity baseEntity = await QuoteApi.getQuoteRecomend();
    if (baseEntity.isOk()) {
      List<QuoteOptionalEntity> barEntity = baseEntity.data;
      if (barEntity != null && barEntity.length > 0) {
        int length = barEntity.length;
        GlobalEntiy.recomend.clear();
        for(int i = 0; i < length; i++) {
          GlobalEntiy.recomend.add(barEntity[i].name);
        }
        LogUtil.e( GlobalEntiy.recomend.length);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetBuilder<QuoteController>(builder:(userController){
      return  Scaffold(
          appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colours.app_bar_bg,
              title: Text("IPFSNETS", style: ITextStyles.whiteTitle,
              ),
              actions: [
                IconButton(icon: Icon(Icons.search,color: Colours.text_white,),onPressed: () async{
                  String? result = await showSearch<String>(context: context,delegate: SearchBarDelegate());
                  if (StringUtil.isNotEmpty(result!)) {
                    tabController.index = 3;
                    setState(() {
                        controller.setResule(result);
                    });

                  }
                })
              ],
              bottom: PreferredSize(
                preferredSize: Size(double.infinity, 55.w),
                child: Material(
                    color: Colours.app_bar_bg,
                    child:Container(
                        decoration: BoxDecoration(
                            color: Colours.layout_bg,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(30.w), topRight: Radius.circular(30.w))
                        ),
                        child: TabBar(
                          controller: tabController,
                          isScrollable: false,
                          indicatorColor: Colours.button_sel,
                          labelColor: Colours.item_title_color,
                          unselectedLabelColor: Colours.item_content_color,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorPadding: EdgeInsets.only(bottom: 15.w),
                          tabs: entiys.map((e) => Tab(text: e.title,)).toList(),
                        ))),)
          ),
          body: TabBarView(
              controller: tabController,
              children: entiys.isEmpty?[]:entiys.map((item) => item.widget).toList(),));
    });
  }
}


class SearchBarDelegate extends SearchDelegate<String>{

  String searchHint = S.current.quote_search_hint;
  @override
  String get searchFieldLabel => S.current.quote_search_hint;
  //清空按钮
  @override
  List<Widget>buildActions(BuildContext context){
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = "", //搜索值为空
      )
    ];
  }
  //返回上级按钮
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation
        ),
        onPressed: ()=> close(context, "") //点击时关闭整个搜索页面
    );
  }
  //搜到到内容后的展现
  @override
  Widget buildResults(BuildContext context) {
    if (StringUtil.isNotEmpty(query)) {
      if ( GlobalEntiy.history == null) {
        GlobalEntiy.history = [];
      }
      int lenght = GlobalEntiy.history.length;
      bool has = false;
      for(int i = 0; i < lenght; i++) {
          if (GlobalEntiy.history[i] == query.trim()){
            has = true;
          }
      }
      if (!has) {
        GlobalEntiy.history.add(query);
        StringUtil.saveList(GlobalEntiy.history);
      }
    }
    close(context, query);
    return Container();
  }
  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16.0, right: 16.0),
      child: ListView(
        primary: false,
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(height: 20.w),
          Row(
            children: [
              Text(S.current.quote_search_history, style: ITextStyles.itemTitle,),
              Expanded(child: SizedBox(),),
              GestureDetector(child:Text(S.current.quote_search_clean, style: ITextStyles.itemContent,),onTap: (){
                GlobalEntiy.history.clear();
                StringUtil.saveList(GlobalEntiy.history);
                close(context, query);
              },)

            ],
          ),

          SizedBox(height: 20.w),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: GlobalEntiy.history.map((childNode) {
              return InkWell(
                child: new ClipRRect(
                  borderRadius: BorderRadius.circular(20.w),
                  child: Container(
                    padding: EdgeInsets.only(top: 10.w,bottom: 10.w,left: 30.w,right: 30.w),
                    color: Color(0xFFF4F5F7),
                    child: Text(
                      childNode,
                      style: ITextStyles.itemTitle,
                    ),
                  ),
                ),
                onTap: () {
                  searchHint = "";
                  query = childNode;
                  LogUtil.e(query);
                  close(context, query);
                },
              );
            }).toList(),
          ),
          SizedBox(height: 20.w),
          Text(S.current.quote_search_recomend, style: ITextStyles.itemTitle,),
          SizedBox(height: 20.w),
          Wrap(spacing: 8.0, runSpacing: 8.0,
            children: GlobalEntiy.recomend.map((childNode) {
              return InkWell(
                child: new ClipRRect(
                  borderRadius: BorderRadius.circular(20.w),
                  child: Container(
                    padding: EdgeInsets.only(top: 10.w,bottom: 10.w,left: 30.w,right: 30.w),
                    color: Color(0xFFF4F5F7),
                    child: Text(childNode, style: ITextStyles.itemTitle),
                  ),
                ),
                onTap: () {
                  searchHint = "";
                  query = childNode;
                  close(context, query);
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  _loadData() async {
    //网络加载

  }


}