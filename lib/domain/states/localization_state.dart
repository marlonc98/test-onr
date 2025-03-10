import 'package:flutter/material.dart';
import 'package:test_onr/domain/states/state_domain.dart';

abstract class LocalizationState extends StateDomain {
  abstract Locale locale;
  String translate(String keyText, {Map<String, dynamic>? values});
}
