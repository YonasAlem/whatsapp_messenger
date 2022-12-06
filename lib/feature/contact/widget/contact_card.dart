import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_messenger/common/extension/custom_theme_extension.dart';
import 'package:whatsapp_messenger/common/models/user_model.dart';

import '../../../common/utils/coloors.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({
    Key? key,
    required this.contactSource,
    required this.onTap,
  }) : super(key: key);

  final UserModel contactSource;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.only(
        left: 20,
        right: 10,
      ),
      leading: CircleAvatar(
        backgroundColor: context.theme.greyColor!.withOpacity(.3),
        radius: 20,
        backgroundImage: contactSource.profileImageUrl.isNotEmpty
            ? CachedNetworkImageProvider(contactSource.profileImageUrl)
            : null,
        child: contactSource.profileImageUrl.isEmpty
            ? const Icon(
                Icons.person,
                size: 30,
                color: Colors.white,
              )
            : null,
      ),
      title: Text(
        contactSource.username,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: contactSource.uid.isNotEmpty
          ? Text(
              "Hey there! I'm using WhatsApp",
              style: TextStyle(
                color: context.theme.greyColor,
                fontWeight: FontWeight.w600,
              ),
            )
          : null,
      trailing: contactSource.uid.isEmpty
          ? TextButton(
              onPressed: onTap,
              style: TextButton.styleFrom(
                foregroundColor: Coloors.greenDark,
              ),
              child: const Text('INVITE'),
            )
          : null,
    );
  }
}
