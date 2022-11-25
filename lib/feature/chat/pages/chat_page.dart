import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_messenger/common/models/user_model.dart';
import 'package:whatsapp_messenger/common/widgets/custom_icon_button.dart';
import 'package:whatsapp_messenger/feature/auth/controller/auth_controller.dart';

class ChatPage extends ConsumerWidget {
  const ChatPage({super.key, required this.user});

  final UserModel user;

  String lastSeenMessage(lastSeen) {
    DateTime now = DateTime.now();
    Duration differenceDuration = now.difference(
      DateTime.fromMillisecondsSinceEpoch(lastSeen),
    );

    String finalMessage = differenceDuration.inSeconds > 59
        ? differenceDuration.inMinutes > 59
            ? differenceDuration.inDays > 23
                ? "${differenceDuration.inDays} ${differenceDuration.inDays == 1 ? 'day' : 'days'}"
                : "${differenceDuration.inHours} ${differenceDuration.inHours == 1 ? 'hour' : 'hours'}"
            : "${differenceDuration.inMinutes} ${differenceDuration.inMinutes == 1 ? 'minute' : 'minutes'}"
        : 'few moments';

    return finalMessage;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          borderRadius: BorderRadius.circular(20),
          child: Row(
            children: [
              const Icon(Icons.arrow_back),
              CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(user.profileImageUrl),
              ),
            ],
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.username,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 3),
            StreamBuilder(
              stream: ref
                  .read(authControllerProvider)
                  .getUserPresenceStatus(uid: user.uid),
              builder: (_, snapshot) {
                if (snapshot.connectionState != ConnectionState.active) {
                  return const SizedBox();
                }

                final singleUserModel = snapshot.data!;
                final lastMessage = lastSeenMessage(user.lastSeen);

                return Text(
                  singleUserModel.active
                      ? 'online'
                      : "last seen $lastMessage ago",
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                );
              },
            ),
          ],
        ),
        actions: [
          CustomIconButton(
            onPressed: () {},
            icon: Icons.video_call,
            iconColor: Colors.white,
          ),
          CustomIconButton(
            onPressed: () {},
            icon: Icons.call,
            iconColor: Colors.white,
          ),
          CustomIconButton(
            onPressed: () {},
            icon: Icons.more_vert,
            iconColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
