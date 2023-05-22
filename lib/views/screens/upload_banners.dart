import 'package:flutter/material.dart';

class UploadBannerScreen extends StatelessWidget {
  const UploadBannerScreen({super.key});
  static const String routeName = '/UploadBannerScreen';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.topLeft,
            child: const Text(
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
                'Upload Banners'),
          ),
        ),
        Divider(
          color: Colors.grey[900],
          thickness: 1,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[600],
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                      style: TextStyle(
                        fontSize: 10,
                      ),
                      'Upload Banner! 👇'),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
