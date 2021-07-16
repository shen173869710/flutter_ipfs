class NewsModel {
  /// 新闻标题
   final String title;
  /// 来源
   final String source;
  /// 新闻配图
   final String imgUrl;
   final String time;

   const NewsModel(this.title, this.source, this.imgUrl, this.time);
}