import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_messenger/common/extension/custom_theme_extension.dart';
import 'package:whatsapp_messenger/common/utils/coloors.dart';
import 'package:whatsapp_messenger/common/widgets/custom_icon_button.dart';
import 'package:whatsapp_messenger/feature/chat/controller/chat_controller.dart';

class ChatTextField extends ConsumerStatefulWidget {
  const ChatTextField({super.key, required this.receiverId});

  final String receiverId;

  @override
  ConsumerState<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends ConsumerState<ChatTextField> {
  late TextEditingController messageController;

  bool isMessageIconEnabled = false;

  void sendTextMessage() async {
    if (isMessageIconEnabled) {
      ref.read(chatControllerProvider).sendTextMessage(
            context: context,
            textMessage: messageController.text,
            receiverId: widget.receiverId,
          );
      messageController.clear();
    }
  }

  @override
  void initState() {
    messageController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: messageController,
              maxLines: 4,
              minLines: 1,
              onChanged: (value) {
                value.isEmpty
                    ? setState(() => isMessageIconEnabled = false)
                    : setState(() => isMessageIconEnabled = true);
              },
              decoration: InputDecoration(
                hintText: 'Message',
                hintStyle: TextStyle(color: context.theme.greyColor),
                filled: true,
                fillColor: context.theme.chatTextFieldBg,
                isDense: true,
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    style: BorderStyle.none,
                    width: 0,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                prefixIcon: Material(
                  color: Colors.transparent,
                  child: CustomIconButton(
                    onPressed: () {},
                    icon: Icons.emoji_emotions_outlined,
                    iconColor: Theme.of(context).listTileTheme.iconColor,
                  ),
                ),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RotatedBox(
                      quarterTurns: 45,
                      child: CustomIconButton(
                        onPressed: () {},
                        icon: Icons.attach_file,
                        iconColor: Theme.of(context).listTileTheme.iconColor,
                      ),
                    ),
                    CustomIconButton(
                      onPressed: () {},
                      icon: Icons.camera_alt_outlined,
                      iconColor: Theme.of(context).listTileTheme.iconColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 5),
          CustomIconButton(
            onPressed: sendTextMessage,
            icon: isMessageIconEnabled
                ? Icons.send_outlined
                : Icons.mic_none_outlined,
            background: Coloors.greenDark,
            iconColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
