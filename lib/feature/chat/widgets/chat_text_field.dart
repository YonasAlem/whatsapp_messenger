import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_messenger/common/enum/message_type.dart';
import 'package:whatsapp_messenger/common/extension/custom_theme_extension.dart';
import 'package:whatsapp_messenger/common/utils/coloors.dart';
import 'package:whatsapp_messenger/common/widgets/custom_icon_button.dart';
import 'package:whatsapp_messenger/feature/auth/pages/image_picker_page.dart';
import 'package:whatsapp_messenger/feature/chat/controller/chat_controller.dart';

class ChatTextField extends ConsumerStatefulWidget {
  const ChatTextField({
    super.key,
    required this.receiverId,
    required this.scrollController,
  });

  final String receiverId;
  final ScrollController scrollController;

  @override
  ConsumerState<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends ConsumerState<ChatTextField> {
  late TextEditingController messageController;

  bool isMessageIconEnabled = false;
  double cardHeight = 0;

  void sendImageMessageFromGallery() async {
    final image = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const ImagePickerPage(),
        ));

    if (image != null) {
      sendFileMessage(image, MessageType.image);
      setState(() => cardHeight = 0);
    }
  }

  void sendFileMessage(var file, MessageType messageType) async {
    ref.read(chatControllerProvider).sendFileMessage(
          context,
          file,
          widget.receiverId,
          messageType,
        );
    await Future.delayed(const Duration(milliseconds: 500));
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      widget.scrollController.animateTo(
        widget.scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  void sendTextMessage() async {
    if (isMessageIconEnabled) {
      ref.read(chatControllerProvider).sendTextMessage(
            context: context,
            textMessage: messageController.text,
            receiverId: widget.receiverId,
          );
      messageController.clear();
    }

    await Future.delayed(const Duration(milliseconds: 100));
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      widget.scrollController.animateTo(
        widget.scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  iconWithText({
    required VoidCallback onPressed,
    required IconData icon,
    required String text,
    required Color background,
  }) {
    return Column(
      children: [
        CustomIconButton(
          onPressed: onPressed,
          icon: icon,
          background: background,
          minWidth: 50,
          iconColor: Colors.white,
          border: Border.all(
            color: context.theme.greyColor!.withOpacity(.2),
            width: 1,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          text,
          style: TextStyle(
            color: context.theme.greyColor,
          ),
        ),
      ],
    );
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: cardHeight,
          width: double.maxFinite,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: context.theme.receiverChatCardBg,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      iconWithText(
                        onPressed: () {},
                        icon: Icons.book,
                        text: 'File',
                        background: const Color(0xFF7F66FE),
                      ),
                      iconWithText(
                        onPressed: () {},
                        icon: Icons.camera_alt,
                        text: 'Camera',
                        background: const Color(0xFFFE2E74),
                      ),
                      iconWithText(
                        onPressed: sendImageMessageFromGallery,
                        icon: Icons.photo,
                        text: 'Gallery',
                        background: const Color(0xFFC861F9),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      iconWithText(
                        onPressed: () {},
                        icon: Icons.headphones,
                        text: 'Audio',
                        background: const Color(0xFFF96533),
                      ),
                      iconWithText(
                        onPressed: () {},
                        icon: Icons.location_on,
                        text: 'Location',
                        background: const Color(0xFF1FA855),
                      ),
                      iconWithText(
                        onPressed: () {},
                        icon: Icons.person,
                        text: 'Contact',
                        background: const Color(0xFF009DE1),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
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
                            onPressed: () => setState(
                              () => cardHeight == 0 ? cardHeight = 220 : cardHeight = 0,
                            ),
                            icon: cardHeight == 0 ? Icons.attach_file : Icons.close,
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
                icon: isMessageIconEnabled ? Icons.send_outlined : Icons.mic_none_outlined,
                background: Coloors.greenDark,
                iconColor: Colors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
