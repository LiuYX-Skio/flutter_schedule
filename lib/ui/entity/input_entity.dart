import 'package:flutter/material.dart';

class InputEntity {
  late int type;
  late double paddingVertical;
  late String hintText;
  late BorderRadius radios;
  late String imageUrl;

  InputEntity.from(this.type, this.hintText, this.radios,this.paddingVertical,this.imageUrl);
}
