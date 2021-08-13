import 'dart:io';

import 'package:ipfsnets/ui/widget/my_app_bar.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../../../include.dart';

class QrCodeScannerPage extends StatefulWidget {

  const QrCodeScannerPage({Key? key}) : super(key: key);

  @override
  _QrCodeScannerPageState createState() => _QrCodeScannerPageState();
}

class _QrCodeScannerPageState extends State<QrCodeScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  /// In order to get hot reload to work we need to pause the camera if the platform
  /// is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    } else if (Platform.isIOS) {
      controller?.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    final scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 300.0;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(S.current.me_item_8),
      //   centerTitle: true,
      //   backgroundColor: Color(0x55000000),
      // ),
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.white,
                borderRadius: 10,
                borderLength: 20,
                borderWidth: 5,
                cutOutSize: scanArea,
              ),
            ),
          ),

          Positioned(
            top: 30,
            left: 20,
            child: Center(
              child: IconButton(
                icon:Icon(Icons.arrow_back_ios_rounded, size: 32, color: Colors.white,),
                onPressed: () {
                  NavigatorUtil.goBack(context);
                },
              ),
            ),
          ),
          Positioned(
            bottom: 130,
            left: 0,
            right: 0,
            child: Center(
              child: IconButton(
                icon: const Icon(Icons.highlight_outlined, size: 32, color: Colors.white,),
                onPressed: () {
                  controller?.toggleFlash();
                },
              ),
            ),
          ),

          Positioned(
            bottom: 20,
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.broken_image_outlined, size: 35, color: Colors.white,),
              onPressed: () {
                controller?.toggleFlash();
              },
            ),
          ),
          // const Positioned(
          //   top: 0,
          //   left: 0,
          //   right: 0,
          //   child: MyAppBar(
          //     title: S.current.me_item_8,
          //     backgroundColor: Colors.transparent,
          //     backImgColor: Colors.white,
          //   ),
          // ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      /// 避免扫描结果多次回调
       controller.dispose();
       Future.delayed(Duration(milliseconds: 200),(){
         ToastUtil.show(scanData.code.toString());
         NavigatorUtil.goBackWithParams(context, scanData.code);
       });

    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}