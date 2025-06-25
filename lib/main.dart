/*
Created by: Mbaka bilal <mbakabilal.t@gmail.com>
Created on: 24,June,2025
Updated by: Mbaka bilal <mbakabilal.t@gmail.com>
Updated on: 24,June,2025
*/

import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'app.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());

  runApp(const MyApp());
}
