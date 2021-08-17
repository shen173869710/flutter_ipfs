import 'dart:async';
import 'package:flutter_qr_reader/flutter_qr_reader.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../include.dart';

// import 'package:image_picker/image_picker.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
// import '../../../../include.dart';
// import 'flutter_qr_reader.dart';
//
// class QrCodeScannerPage extends StatefulWidget {
//
//   const QrCodeScannerPage({Key? key}) : super(key: key);
//
//   @override
//   _QrCodeScannerPageState createState() => _QrCodeScannerPageState();
// }
//
// class _QrCodeScannerPageState extends State<QrCodeScannerPage> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   QRViewController? controller;
//
//   /// In order to get hot reload to work we need to pause the camera if the platform
//   /// is android, or resume the camera if the platform is iOS.
//   @override
//   void reassemble() {
//     super.reassemble();
//     if (Platform.isAndroid) {
//       controller?.pauseCamera();
//     } else if (Platform.isIOS) {
//       controller?.resumeCamera();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final scanArea = (MediaQuery.of(context).size.width < 400 ||
//         MediaQuery.of(context).size.height < 400)
//         ? 250.0
//         : 300.0;
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text(S.current.me_item_8),
//       //   centerTitle: true,
//       //   backgroundColor: Color(0x55000000),
//       // ),
//       body: Stack(
//         children: <Widget>[
//           Positioned.fill(
//             child: QRView(
//               key: qrKey,
//               onQRViewCreated: _onQRViewCreated,
//               overlay: QrScannerOverlayShape(
//                 borderColor: Colors.white,
//                 borderRadius: 10,
//                 borderLength: 20,
//                 borderWidth: 5,
//                 cutOutSize: scanArea,
//               ),
//             ),
//           ),
//
//           Positioned(
//             top: 30,
//             left: 20,
//             child: Center(
//               child: IconButton(
//                 icon:Icon(Icons.arrow_back_ios_rounded, size: 32, color: Colors.white,),
//                 onPressed: () {
//                   NavigatorUtil.goBack(context);
//                 },
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: 130,
//             left: 0,
//             right: 0,
//             child: Center(
//               child: IconButton(
//                 icon: const Icon(Icons.highlight_outlined, size: 32, color: Colors.white,),
//                 onPressed: () {
//                   controller?.toggleFlash();
//                 },
//               ),
//             ),
//           ),
//
//           Positioned(
//             bottom: 20,
//             right: 20,
//             child: IconButton(
//               icon: const Icon(Icons.broken_image_outlined, size: 35, color: Colors.white,),
//               onPressed: () {
//                 _getQrcodeFromImage();
//               },
//             ),
//           ),
//           // const Positioned(
//           //   top: 0,
//           //   left: 0,
//           //   right: 0,
//           //   child: MyAppBar(
//           //     title: S.current.me_item_8,
//           //     backgroundColor: Colors.transparent,
//           //     backImgColor: Colors.white,
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
//
//   void _onQRViewCreated(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((scanData) {
//       /// 避免扫描结果多次回调
//        controller.dispose();
//        Future.delayed(Duration(milliseconds: 200),(){
//          ToastUtil.show(scanData.code.toString());
//          NavigatorUtil.goBackWithParams(context, scanData.code);
//        });
//
//     });
//   }
//
//   Future<void> _getQrcodeFromImage() async {
//     final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
//
//     LogUtil.e("path ==="+pickedFile!.path.toString());
//     if (pickedFile != null) {
//         String data = await FlutterQrReader.imgScan(pickedFile.path);
//         // Uint8List bytes = _image.readAsBytesSync();
//         // String barcode = await scanner.scanBytes(bytes);
//         LogUtil.e("data =================="+data);
//     }
//
//
//   }
//
//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
// }
class QrCodeScannerPage extends StatefulWidget {
   String type;
   QrCodeScannerPage(this.type);
  
  final Widget? headerWidget = AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
  );
  double scanBoxRatio = 0.85;
  Color boxLineColor = Colors.cyanAccent;

  @override
  QrcodeReaderViewState createState() => new QrcodeReaderViewState();
}

/// 扫码后的后续操作
/// ```dart
/// GlobalKey<QrcodeReaderViewState> qrViewKey = GlobalKey();
/// qrViewKey.currentState.startScan();
/// ```
class QrcodeReaderViewState extends State<QrCodeScannerPage> with TickerProviderStateMixin, WidgetsBindingObserver {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  QrReaderViewController? _controller;
  AnimationController? _animationController;
  bool openFlashlight = false;
  late Timer _timer;
  bool _init = false;
  bool _showScanView = false;
  bool _showPermission = true;

  // 如果需要打开APP设置页面进行授权使用该方式获取权限状态
  Completer<bool>? permissionCompleter;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    showScanView();
  }

  Future showScanView() async {
    if (true == await permission()) {
      await Future.delayed(Duration(milliseconds: 300));
      setState(() {
        _init = true;
        _showPermission = false;
        _showScanView = true;
      });
    } else {
      setState(() {
        _init = true;
        _showScanView = false;
        _showPermission = true;
      });
    }
  }

  Future<bool> permission() async {
    final status = await Permission.camera.status;
    return status.isGranted;
  }

  void requestPermission() async {
    final ok = await _requestPermission();
    if (ok) {
      showScanView();
    }
  }

  Future<bool> _requestPermission() async {
    var status = await Permission.camera.status;
    if (status.isRestricted || status.isPermanentlyDenied) {
      openAppSettings();
      permissionCompleter = Completer<bool>();
      return permissionCompleter!.future;
    } else if (!status.isGranted) {
      status = await Permission.camera.request();
    }
    return status.isGranted;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed && permissionCompleter != null) {
      permissionCompleter!.complete(await permission());
    }
  }

  void _initAnimation() {
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
    _animationController!
      ..addListener(_upState)
      ..addStatusListener((state) {
        if (state == AnimationStatus.completed) {
          _timer = Timer(Duration(seconds: 1), () {
            _animationController?.reverse(from: 1.0);
          });
        } else if (state == AnimationStatus.dismissed) {
          _timer = Timer(Duration(seconds: 1), () {
            _animationController?.forward(from: 0.0);
          });
        }
      });
    _animationController!.forward(from: 0.0);
  }

  void _clearAnimation() {
    if (_timer != null) {
      _timer.cancel();
    }

    if (_animationController != null) {
      _animationController?.dispose();
      _animationController = null;
    }
  }

  void _upState() {
    setState(() {});
  }

  void _onCreateController(QrReaderViewController controller) async {
    _controller = controller;
    startScan();
  }

  bool isScan = false;

  Future _onQrBack(data, _) async {
    if (isScan == true) return;
    isScan = true;
    stopScan();
    scanResult(data);
  }

  void startScan() async {
    isScan = false;
    await _controller?.startCamera(_onQrBack);
    _initAnimation();
  }

  void stopScan() {
    _controller?.stopCamera();
    _clearAnimation();
  }

  Future<bool> setFlashlight() async {
    openFlashlight = await _controller?.setFlashlight() ?? false;
    setState(() {});
    return openFlashlight;
  }

  Future _scanImage() async {
    stopScan();
    var image = await ImagePicker().getImage(source: ImageSource.gallery);
    if (image == null) {
      startScan();
      return;
    }
    final rest = await FlutterQrReader.imgScan(image.path);
    LogUtil.e("-----"+rest);
    scanResult(rest);
  }

  @override
  Widget build(BuildContext context) {
    if (_init == false) {
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
      );
    }
    if (_showPermission) {
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  "权限提醒",
                  style: TextStyle(
                    fontSize: 36,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 36),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '功能运行必须权限',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: "相机访问权限：", style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: "扫码程序必须使用相机实时完成扫码识别。"),
                        ],
                      ),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 36),
                    Text(
                      '相册图片识别所需权限',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: "读写手机存储权限：", style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: "实现选取任意图片识别图片中的二维码；该权限会在你主动使用时提示您申请该权限。"),
                        ],
                      ),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 120),
              TextButton(
                onPressed: requestPermission,
                child: Text(
                  '授权运行必须权限',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green[900]),
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
                ),
              ),
            ],
          ),
        ),
      );
    }
    final flashOpen = Image.asset(
      "assets/tool_flashlight_open.png",
      package: "flutter_qr_reader",
      width: 35,
      height: 35,
      color: Colors.white,
    );
    final flashClose = Image.asset(
      "assets/tool_flashlight_close.png",
      package: "flutter_qr_reader",
      width: 35,
      height: 35,
      color: Colors.white,
    );
    return Material(
      color: Colors.black,
      child: LayoutBuilder(builder: (context, constraints) {
        final qrScanSize = constraints.maxWidth * widget.scanBoxRatio;
        final mediaQuery = MediaQuery.of(context);
        if (constraints.maxHeight < qrScanSize * 1.5) {
          print("建议高度与扫码区域高度比大于1.5");
        }
        return Stack(
          children: <Widget>[
            SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              child: _showScanView
                  ? QrReaderView(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                callback: _onCreateController,
              )
                  : Container(),
            ),
            if (widget.headerWidget != null) widget.headerWidget!,
            Positioned(
              left: (constraints.maxWidth - qrScanSize) / 2,
              top: (constraints.maxHeight - qrScanSize) * 0.333333,
              child: CustomPaint(
                painter: QrScanBoxPainter(
                  boxLineColor: widget.boxLineColor,
                  animationValue: _animationController?.value ?? 0,
                  isForward: _animationController?.status == AnimationStatus.forward,
                ),
                child: SizedBox(
                  width: qrScanSize,
                  height: qrScanSize,
                ),
              ),
            ),
            // Positioned(
            //   top: (constraints.maxHeight - qrScanSize) * 0.333333 + qrScanSize + 24,
            //   width: constraints.maxWidth,
            //   child: Align(
            //     alignment: Alignment.center,
            //     child: DefaultTextStyle(
            //       style: TextStyle(color: Colors.white),
            //       child: widget.helpWidget ?? Text("请将二维码置于方框中"),
            //     ),
            //   ),
            // ),
            Positioned(
              top: (constraints.maxHeight - qrScanSize) * 0.333333 + qrScanSize - 12 - 35,
              width: constraints.maxWidth,
              child: Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: setFlashlight,
                  child: openFlashlight ? flashOpen : flashClose,
                ),
              ),
            ),
            Positioned(
              width: constraints.maxWidth,
              bottom: constraints.maxHeight == mediaQuery.size.height ? 12 + mediaQuery.padding.top : 12,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: _scanImage,
                    child: Container(
                      width: 45,
                      height: 45,
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/tool_img.png",
                        package: "flutter_qr_reader",
                        width: 25,
                        height: 25,
                        color: Colors.white54,
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      border: Border.all(color: Colors.white30, width: 12),
                    ),
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/tool_qrcode.png",
                      package: "flutter_qr_reader",
                      width: 35,
                      height: 35,
                      color: Colors.white54,
                    ),
                  ),
                  SizedBox(width: 45, height: 45),
                ],
              ),
            )
          ],
        );
      }),
    );
  }

  @override
  void dispose() {
    _clearAnimation();
    super.dispose();
  }

  void scanResult(String data) {
    LogUtil.e("data  =============="+data + "    widget.type =="+widget.type);
    if (StringUtil.isNotEmpty(widget.type) && widget.type == GlobalEntiy.qrcode_address && StringUtil.isNotEmpty(data)) {
      if (data.contains(GlobalEntiy.qrcode_address)) {
        NavigatorUtil.goBack(context);
        NavigatorUtil.push(context, '${Routes.transferPage}?coinCode=${Uri.encodeComponent(data)}');
      }
    } else if (StringUtil.isEmpty(widget.type) && StringUtil.isNotEmpty(data)){
      NavigatorUtil.goBackWithParams(context, data);
    }else{
      ToastUtil.show(S.current.qrcode_fail);
      Future.delayed(const Duration(milliseconds: 2000), () {
        startScan();
      });
    }
    
  }
}

class QrScanBoxPainter extends CustomPainter {
  final double animationValue;
  final bool isForward;
  final Color boxLineColor;

  QrScanBoxPainter({required this.animationValue, required this.isForward, required this.boxLineColor});

  @override
  void paint(Canvas canvas, Size size) {
    final borderRadius = BorderRadius.all(Radius.circular(12)).toRRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
    );
    canvas.drawRRect(
      borderRadius,
      Paint()
        ..color = Colors.white54
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1,
    );
    final borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    final path = new Path();
    // leftTop
    path.moveTo(0, 50);
    path.lineTo(0, 12);
    path.quadraticBezierTo(0, 0, 12, 0);
    path.lineTo(50, 0);
    // rightTop
    path.moveTo(size.width - 50, 0);
    path.lineTo(size.width - 12, 0);
    path.quadraticBezierTo(size.width, 0, size.width, 12);
    path.lineTo(size.width, 50);
    // rightBottom
    path.moveTo(size.width, size.height - 50);
    path.lineTo(size.width, size.height - 12);
    path.quadraticBezierTo(size.width, size.height, size.width - 12, size.height);
    path.lineTo(size.width - 50, size.height);
    // leftBottom
    path.moveTo(50, size.height);
    path.lineTo(12, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - 12);
    path.lineTo(0, size.height - 50);

    canvas.drawPath(path, borderPaint);

    canvas.clipRRect(BorderRadius.all(Radius.circular(12)).toRRect(Offset.zero & size));

    // 绘制横向网格
    final linePaint = Paint();
    final lineSize = size.height * 0.45;
    final leftPress = (size.height + lineSize) * animationValue - lineSize;
    linePaint.style = PaintingStyle.stroke;
    linePaint.shader = LinearGradient(
      colors: [Colors.transparent, boxLineColor],
      begin: isForward ? Alignment.topCenter : Alignment(0.0, 2.0),
      end: isForward ? Alignment(0.0, 0.5) : Alignment.topCenter,
    ).createShader(Rect.fromLTWH(0, leftPress, size.width, lineSize));
    for (int i = 0; i < size.height / 5; i++) {
      canvas.drawLine(
        Offset(
          i * 5.0,
          leftPress,
        ),
        Offset(i * 5.0, leftPress + lineSize),
        linePaint,
      );
    }
    for (int i = 0; i < lineSize / 5; i++) {
      canvas.drawLine(
        Offset(0, leftPress + i * 5.0),
        Offset(
          size.width,
          leftPress + i * 5.0,
        ),
        linePaint,
      );
    }
  }

  @override
  bool shouldRepaint(QrScanBoxPainter oldDelegate) => animationValue != oldDelegate.animationValue;

  @override
  bool shouldRebuildSemantics(QrScanBoxPainter oldDelegate) => animationValue != oldDelegate.animationValue;
}
