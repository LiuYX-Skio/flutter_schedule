import 'package:flutter/material.dart';
import 'package:flutter_tv_music/base/base_state.dart';
import 'package:flutter_tv_music/base/base_statefulwidget.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

///二维码扫描
class ScanPage extends BaseStatefulWidget {
  const ScanPage({super.key});

  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends BaseState<ScanPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool isScanning = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('二维码扫描'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: (controller) {
                this.controller = controller;
                controller.scannedDataStream.listen((scanData) {
                  if (isScanning) {
                    // 扫描成功，处理扫描结果
                    print('扫描结果: ${scanData.code}');
                    setState(() {
                      isScanning = false;
                    });
                  }
                });
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: ElevatedButton(
              onPressed: () {
                // 重新开始扫描
                setState(() {
                  isScanning = true;
                });
              },
              child: Text('重新扫描'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
