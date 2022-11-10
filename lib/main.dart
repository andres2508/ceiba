import 'package:ceiba/app.dart';
import 'package:ceiba/infrastructure/locator/service.locator.dart';
import 'package:flutter/material.dart';

void main() {
  setupServiceLocator();
  runApp(const CeibaMobileApp());
}