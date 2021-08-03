
import '../include.dart';

class PasswordDiaglog extends StatefulWidget {

  const PasswordDiaglog({Key? key}) : super(key: key);

  @override
  _PasswordDiaglogState createState() => _PasswordDiaglogState();
}

class _PasswordDiaglogState extends State<PasswordDiaglog> {

  int _index = 0;
  final _list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 0, 0];
  final List<String> _codeList = ['', '', '', '', '', ''];

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colours.white,
        height: context.height * 6 / 10.0,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(S.current.password_dialog_title,
                    style: ITextStyles.itemTitle,
                  ),
                ),
                Positioned(
                  right: 16.0,
                  top: 16.0,
                  bottom: 16.0,
                  child: Semantics(
                    label: '关闭',
                    child: GestureDetector(
                      onTap: () => NavigatorUtil.goBack(context),
                      child: Image.asset(R.assetsImgIconClose, width: 25.w, height: 25.w,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(height: 80.w,
                    margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.6, color: Colours.text_gray_c),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Row(
                        children: List.generate(_codeList.length, (i) => _buildInputWidget(i))
                    ),
                  ),
                  Gaps.vGap10,

                  Row(
                    children: [
                      Expanded(child: SizedBox()),
                      Text(S.current.paddword_dailog_forget, style: TextStyle(fontSize: 14, color: Colours.button_sel)),
                      Gaps.hGap16
                    ],
                  )

                ],
              ),
            ),
            Gaps.line,
            Container(
              color: Theme.of(context).dividerTheme.color,
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.953,
                    mainAxisSpacing: 0.6,
                    crossAxisSpacing: 0.6,
                  ),
                  itemCount: 12,
                  itemBuilder: (_, index) => _buildButton(index)
              ),
            ),
          ],
        )
    );
  }

  Widget _buildButton(int index) {
    final color = Colours.dark_button_text;
    return Material(
      color: (index == 9 || index == 11) ? color : null,
      child: InkWell(
        child: Center(
          child: index == 11 ? Semantics(
            label: '删除',
            child: Image.asset(R.assetsImgDel, width: 80.w,height: 80.w,),
          ) : index == 9 ? Semantics(
            label: '无效',
            child: Gaps.empty,
          ) : Text(
            _list[index].toString(),
            style: const TextStyle(fontSize: 26.0),
          ),
        ),
        onTap: () async {
          if (index == 9) {
            return;
          }

          if (index == 11) {
            if (_index == 0) {
              return;
            }
            _codeList[_index - 1] = '';
            _index--;
            setState(() {

            });
            return;
          }
          _codeList[_index] = _list[index].toString();
          _index++;
          if (_index == _codeList.length) {

            var code = '';
            for (var i = 0; i < _codeList.length; i ++) {
              code = code + _codeList[i];
            }
            ToastUtil.show('密码：$code');
            _index = 0;
            for (var i = 0; i < _codeList.length; i ++) {
              _codeList[i] = '';
            }
          }
          setState(() {

          });
        },
      ),
    );
  }

  Widget _buildInputWidget(int p) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: p != 5 ? Border(
            right: Divider.createBorderSide(context, color: Colours.text_gray_c, width: 0.6),
          ) : null,
        ),
        child: Text(_codeList[p].isEmpty ? '' : '●', style: ITextStyles.textSize12,),
      ),
    );
  }
}
