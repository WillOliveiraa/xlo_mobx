import 'dart:io';

import 'package:flutter/material.dart';

class ImageDialog extends StatelessWidget {
  final dynamic image;
  final VoidCallback onDelete;

  const ImageDialog({@required this.image, @required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch ,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.file(image as File),
          FlatButton(
            child: const Text('Excluir'),
            textColor: Colors.red,
            onPressed: () {
              Navigator.of(context).pop();
              onDelete();
            },
          )
        ],
      ),
    );
  }
}
