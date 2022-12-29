import 'package:flutter/cupertino.dart';

extension screensize on BuildContext {
  get screenwidth => MediaQuery.of(this).size.width;
  get screenhight => MediaQuery.of(this).size.height;
}
