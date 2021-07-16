

import 'package:ipfsnets/models/rechage_record_model.dart';

import '../../../../include.dart';

abstract class BaseListItem extends StatelessWidget {
  final RechageRecordModel data;
  BaseListItem(this.data);
  @override
  Widget build(BuildContext context) {
    return buildItem();
  }

  Widget buildItem();

}