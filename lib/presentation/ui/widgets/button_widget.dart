// ignore_for_file: constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TypeButton {
  Main,
  Secondary,
  NotLineMain,
  NotLineSecondary,
  Error,
  NotLineError,
  WhiteButton,
  Light,
}

class ButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final TypeButton type;
  final bool active;
  final double? width;
  final double? height;
  final bool enabled;
  final TextStyle textStyle;
  final Widget? icon;
  final IconData? iconData;
  final bool vertical;
  final bool? shadow;
  final FontWeight? fontWeight;
  final bool withBg;
  final Alignment alignment;

  const ButtonWidget({
    super.key,
    required this.onTap,
    required this.text,
    this.type = TypeButton.Main,
    this.active = true,
    this.enabled = true,
    this.iconData,
    this.width,
    this.icon,
    this.height,
    this.vertical = false,
    this.fontWeight,
    this.shadow,
    this.withBg = false,
    this.alignment = Alignment.center,
    this.textStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
  });

  _ButtonTheme? _getTheme(BuildContext context) {
    Map<TypeButton, _ButtonTheme> button = {
      TypeButton.Main: _ButtonTheme(
        background: Theme.of(context).primaryColor,
        backgroundHover: Theme.of(context).primaryColor.withAlpha(77),
        color: Colors.white,
        colorDisabled: Colors.white.withAlpha(102),
        shadow: true,
      ),
    };
    return button[TypeButton.Main];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      alignment: alignment, //or choose another Alignment
      child: Container(
        height: height,
        width: width,
        margin: withBg ? const EdgeInsets.only(top: 8) : null,
        padding: withBg ? const EdgeInsets.all(64) : null,
        decoration: withBg
            ? const BoxDecoration(
                image: DecorationImage(
                  opacity: 0.5,
                  image: ExactAssetImage('assets/appIcon/bg-button.png'),
                  fit: BoxFit.fitHeight,
                ),
              )
            : null,
        child: TextButton.icon(
          onPressed: active && enabled ? onTap : null,
          icon: !active
              ? const CupertinoActivityIndicator(color: Colors.white)
              : iconData != null
                  ? Icon(
                      iconData,
                      color: active && enabled
                          ? _getTheme(context)?.color
                          : _getTheme(context)?.colorDisabled,
                    )
                  : icon != null
                      ? icon!
                      : Container(),
          label: Text(
            text,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: textStyle.copyWith(
              fontWeight: fontWeight ??
                  (type == TypeButton.Main ? FontWeight.w600 : FontWeight.w400),
              fontSize: 16,
              color: active && enabled
                  ? _getTheme(context)?.color
                  : _getTheme(context)?.colorDisabled,
            ),
          ),
          style: ButtonStyle(
            shadowColor: WidgetStateProperty.all(
              shadow == true ||
                      (shadow == null && _getTheme(context)?.shadow == true)
                  ? Colors.black
                  : Colors.transparent,
            ),
            backgroundColor: WidgetStateProperty.all(
              active && enabled
                  ? _getTheme(context)?.background
                  : _getTheme(context)?.backgroundHover,
            ),
          ),
        ),
      ),
    );
  }
}

class _ButtonTheme {
  final Color background;
  final Color backgroundHover;
  final Color color;
  final Color colorDisabled;
  final bool shadow;

  _ButtonTheme({
    required this.background,
    required this.backgroundHover,
    required this.color,
    required this.colorDisabled,
    required this.shadow,
  });
}
