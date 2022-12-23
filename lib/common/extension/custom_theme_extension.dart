import 'package:flutter/material.dart';
import 'package:whatsapp_messenger/common/utils/coloors.dart';

extension ExtendedTheme on BuildContext {
  CustomThemeExtension get theme {
    return Theme.of(this).extension<CustomThemeExtension>()!;
  }
}

class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  final Color? circleImageColor;
  final Color? greyColor;
  final Color? blueColor;
  final Color? langBgColor;
  final Color? langHightlightColor;
  final Color? authAppbarTextColor;
  final Color? photoIconBgColor;
  final Color? photoIconColor;
  final Color? profilePageBg;
  final Color? chatTextFieldBg;
  final Color? chatPageBgColor;
  final Color? chatPageDoodleColor;
  final Color? senderChatCardBg;
  final Color? receiverChatCardBg;
  final Color? yellowCardBgColor;
  final Color? yellowCardTextColor;

  const CustomThemeExtension({
    this.circleImageColor,
    this.greyColor,
    this.blueColor,
    this.langBgColor,
    this.langHightlightColor,
    this.authAppbarTextColor,
    this.photoIconBgColor,
    this.photoIconColor,
    this.profilePageBg,
    this.chatTextFieldBg,
    this.chatPageBgColor,
    this.chatPageDoodleColor,
    this.senderChatCardBg,
    this.receiverChatCardBg,
    this.yellowCardBgColor,
    this.yellowCardTextColor,
  });

  static const lightMode = CustomThemeExtension(
    circleImageColor: Color(0xFF25D366),
    greyColor: Coloors.greyLight,
    blueColor: Coloors.blueLight,
    langBgColor: Color(0xFFF7F8FA),
    langHightlightColor: Color(0xFFE8E8ED),
    authAppbarTextColor: Coloors.greenLight,
    photoIconBgColor: Color(0xFFF1F1F1),
    photoIconColor: Color(0xFF9DAAB3),
    profilePageBg: Color(0xFFF7F8FA),
    chatTextFieldBg: Colors.white,
    chatPageBgColor: Color(0xFFEFE7DE),
    chatPageDoodleColor: Colors.white70,
    senderChatCardBg: Color(0xFFE7FFDB),
    receiverChatCardBg: Color(0xFFFFFFFF),
    yellowCardBgColor: Color(0xFFFFEECC),
    yellowCardTextColor: Color(0xFF13191C),
  );

  static const darkMode = CustomThemeExtension(
    circleImageColor: Coloors.greenDark,
    greyColor: Coloors.greyDark,
    blueColor: Coloors.blueDark,
    langBgColor: Color(0xFF182229),
    langHightlightColor: Color(0xFF09141A),
    authAppbarTextColor: Color(0xFFE9EDEF),
    photoIconBgColor: Color(0xFF283339),
    photoIconColor: Color(0xFF61717B),
    profilePageBg: Color(0xFF0B141A),
    chatTextFieldBg: Coloors.greyBackground,
    chatPageBgColor: Color(0xFF081419),
    chatPageDoodleColor: Color(0xFF172428),
    senderChatCardBg: Color(0xFF005C4B),
    receiverChatCardBg: Coloors.greyBackground,
    yellowCardBgColor: Color(0xFF222E35),
    yellowCardTextColor: Color(0xFFFFD279),
  );

  @override
  ThemeExtension<CustomThemeExtension> copyWith({
    Color? circleImageColor,
    Color? greyColor,
    Color? blueColor,
    Color? langBgColor,
    Color? langHightlightColor,
    Color? authAppbarTextColor,
    Color? photoIconBgColor,
    Color? photoIconColor,
    Color? profilePageBg,
    Color? chatTextFieldBg,
    Color? chatPageBgColor,
    Color? chatPageDoodleColor,
    Color? senderChatCardBg,
    Color? receiverChatCardBg,
    Color? yellowCardBgColor,
    Color? yellowCardTextColor,
  }) {
    return CustomThemeExtension(
      circleImageColor: circleImageColor ?? this.circleImageColor,
      greyColor: greyColor ?? this.greyColor,
      blueColor: blueColor ?? this.blueColor,
      langBgColor: langBgColor ?? this.langBgColor,
      langHightlightColor: langHightlightColor ?? this.langHightlightColor,
      authAppbarTextColor: authAppbarTextColor ?? this.authAppbarTextColor,
      photoIconBgColor: photoIconBgColor ?? this.photoIconBgColor,
      photoIconColor: photoIconColor ?? this.photoIconColor,
      profilePageBg: profilePageBg ?? this.profilePageBg,
      chatTextFieldBg: chatTextFieldBg ?? this.chatTextFieldBg,
      chatPageBgColor: chatPageBgColor ?? this.chatPageBgColor,
      chatPageDoodleColor: chatPageDoodleColor ?? this.chatPageDoodleColor,
      senderChatCardBg: senderChatCardBg ?? this.senderChatCardBg,
      receiverChatCardBg: receiverChatCardBg ?? this.receiverChatCardBg,
      yellowCardBgColor: yellowCardBgColor ?? this.yellowCardBgColor,
      yellowCardTextColor: yellowCardTextColor ?? this.yellowCardTextColor,
    );
  }

  @override
  ThemeExtension<CustomThemeExtension> lerp(
      ThemeExtension<CustomThemeExtension>? other, double t) {
    if (other is! CustomThemeExtension) return this;
    return CustomThemeExtension(
      circleImageColor: Color.lerp(circleImageColor, other.circleImageColor, t),
      greyColor: Color.lerp(greyColor, other.greyColor, t),
      blueColor: Color.lerp(blueColor, other.blueColor, t),
      langBgColor: Color.lerp(langBgColor, other.langBgColor, t),
      langHightlightColor:
          Color.lerp(langHightlightColor, other.langHightlightColor, t),
      authAppbarTextColor:
          Color.lerp(authAppbarTextColor, other.authAppbarTextColor, t),
      photoIconBgColor: Color.lerp(photoIconBgColor, other.photoIconBgColor, t),
      photoIconColor: Color.lerp(photoIconColor, other.photoIconColor, t),
      profilePageBg: Color.lerp(profilePageBg, other.profilePageBg, t),
      chatTextFieldBg: Color.lerp(chatTextFieldBg, other.chatTextFieldBg, t),
      chatPageBgColor: Color.lerp(chatPageBgColor, other.chatPageBgColor, t),
      senderChatCardBg: Color.lerp(senderChatCardBg, other.senderChatCardBg, t),
      yellowCardBgColor:
          Color.lerp(yellowCardBgColor, other.yellowCardBgColor, t),
      yellowCardTextColor:
          Color.lerp(yellowCardTextColor, other.yellowCardTextColor, t),
      receiverChatCardBg:
          Color.lerp(receiverChatCardBg, other.receiverChatCardBg, t),
      chatPageDoodleColor:
          Color.lerp(chatPageDoodleColor, other.chatPageDoodleColor, t),
    );
  }
}
