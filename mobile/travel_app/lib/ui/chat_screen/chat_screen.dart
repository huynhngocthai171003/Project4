import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = [
    ChatMessage(text: "Hello", isSentByMe: true),
    ChatMessage(text: "Lo cái đàu bùi", isSentByMe: false),
    ChatMessage(text: "?????", isSentByMe: true),
  ];

  void _addMessage(String text) {
    setState(() {
      _messages.add(ChatMessage(
        text: text,
        isSentByMe: true,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF344A43),
        title: Row(
          children: [
            // Khoảng cách từ nút quay lại đến avatar
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://scontent.fsgn5-11.fna.fbcdn.net/v/t39.30808-6/359812678_335848075440514_1856852702386968664_n.jpg?_nc_cat=110&cb=99be929b-59f725be&ccb=1-7&_nc_sid=a4a2d7&_nc_ohc=jwOZBUxWdRoAX_VI_jn&_nc_ht=scontent.fsgn5-11.fna&oh=00_AfCf_5arDYhEA6QuNkMNbN6OPYk_xFknMjhwGlbwsBFqjg&oe=64D02B28'),
            ),
            SizedBox(width: 15.w), // Khoảng cách từ avatar đến title
            Expanded(
              child: Text(
                'Tui tên Phú',
                style: TextStyle(
                    fontSize: 20.sp), // Điều chỉnh kích thước của title
              ),
            ),
          ],
        ),
        actions: [
          SizedBox(width: 47.w), // Khoảng cách từ bên phải đến PopupMenuButton
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text('Option 1'),
                value: 'Option 1',
              ),
              PopupMenuItem(
                child: Text('Option 2'),
                value: 'Option 2',
              ),
              // Add more options as needed
            ],
            onSelected: (value) {
              // Handle option selection here
            },
          ),
        ],
      ),
      body: Container(
        color: Color(0xFF1D3133),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 10.h),
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    final message = _messages[index];
                    return message.isSentByMe
                        ? _buildSentMessage(message)
                        : _buildReceivedMessage(message);
                  },
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              color: Colors.grey[200],
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration.collapsed(
                        hintText: 'Type your message...',
                      ),
                      onSubmitted: _addMessage,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  ElevatedButton(
                    onPressed: () => _addMessage('Test message'),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFD6A268),
                      onPrimary: Colors.black,
                    ),
                    child: Text('Send'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSentMessage(ChatMessage message) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: Color(0xFF344A43),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Text(
            message.text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildReceivedMessage(ChatMessage message) {
    return Row(
      children: [
        SizedBox(width: 21.w), // Khoảng cách avatar với lề trái
        CircleAvatar(
          backgroundImage: NetworkImage(
              'https://scontent.fsgn5-8.fna.fbcdn.net/v/t39.30808-6/359815789_336137048744950_351633392557043897_n.jpg?stp=cp6_dst-jpg&_nc_cat=109&cb=99be929b-59f725be&ccb=1-7&_nc_sid=a4a2d7&_nc_ohc=aTqrBb0FIPwAX_ek2ed&_nc_ht=scontent.fsgn5-8.fna&oh=00_AfCUanEpXwvZvv82EPTv_g8lpv-hha2YHcTQwxk4_fN-ig&oe=64D149AA'),
        ),
        SizedBox(width: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Text(
            message.text,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}

class ChatMessage {
  final String text;
  final bool isSentByMe;

  ChatMessage({required this.text, required this.isSentByMe});
}
