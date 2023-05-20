import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late TextEditingController _textEditingController;
  late ScrollController _scrollController;
  List<String> _chatMessages = [];
  List<String> _questions = [
    "Hi",
    "I'd like to book an appointment for a haircut",
    "How about next Friday at 2:00 PM?",
    "My name is Anjum",
    "Sure, it's 123456789",
    "Yes, I would like a short trim and some layers",
    "No, that's all. Thank you for your help!",
    "What is your name?",
    "How old are you?",
    "What is the capital of France?",
  ];
  Map<String, String> _answers = {
    "Hi": "Hello! How can I assist you today?",
    "I'd like to book an appointment for a haircut":
        "Sure, I can assist you with that. May I know your preferred date and time for the appointment?",
    "How about next Friday at 2:00 PM?":
        "Great! I have checked the availability, and we have an opening at that time. Can I have your name, please?",
    "My name is Anjum":
        "Thank you, Anjum. Could you also provide me with your contact number?",
    "Sure, it's 123456789":
        "Perfect! I have booked an appointment for you, Anjum, on Friday at 2:00 PM. Is there anything specific you would like to mention to the stylist?",
    "Yes, I would like a short trim and some layers":
        "Noted. I will make sure to communicate your preferences to the stylist. Is there anything else I can assist you with?",
    "No, that's all. Thank you for your help!":
        "You're welcome, Anjum! We look forward to seeing you for your appointment. If you have any further questions, feel free to ask. Have a great day!",
    "What is your name?": "My name is Roboto.",
    "How old are you?": "I am a virtual assistant, so I don't have an age.",
    "What is the capital of France?": "The capital of France is Paris.",
  };

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _scrollController = ScrollController();
    _chatMessages.add("Hello! I'm Roboto. How can I assist you?");
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _handleSendMessage() {
    String message = _textEditingController.text.trim();
    if (message.isNotEmpty) {
      setState(() {
        _chatMessages.insert(0, "User: $message");
        String answer = _getAnswer(message);
        _chatMessages.insert(0, "ChatBot: $answer");
        _textEditingController.clear();
        _scrollToTop();
      });
    }
  }

  String _getAnswer(String question) {
    if (_answers.containsKey(question)) {
      return _answers[question]!;
    } else {
      return "I'm sorry, I don't have an answer for that.";
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 14,
              backgroundColor: Color.fromARGB(255, 220, 208, 243),
              backgroundImage: AssetImage('assets/images/bot.jpg'),
            ),
            SizedBox(width: 8),
            Text("Roboto"),
            Container(
              margin: EdgeInsets.fromLTRB(2, 2, 0, 0),
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 3, 0, 0),
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(3, 2, 0, 0),
                    child: Image(
                      image: AssetImage('assets/images/icon.png'),
                      width: 20,
                      height: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.help),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Frequently Asked Questions"),
                      content: Container(
                        width: double.maxFinite,
                        height: 180,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: _questions.length,
                          itemBuilder: (context, index) {
                            final question = _questions[index];
                            return ListTile(
                              title: Text(question),
                              onTap: () {
                                Navigator.pop(context);
                                _textEditingController.text = question;
                                _handleSendMessage();
                              },
                            );
                          },
                        ),
                      ),
                    );
                  },
                );
              }),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              controller: _scrollController,
              itemCount: _chatMessages.length,
              itemBuilder: (context, index) {
                bool isUserMessage = _chatMessages[index].startsWith("User:");
                Color messageBackgroundColor = isUserMessage
                    ? Colors.deepPurple
                    : Color.fromARGB(255, 224, 223, 223);
                Color messageTextColor =
                    isUserMessage ? Colors.white : Colors.black;

                return Container(
                  padding: EdgeInsets.all(8),
                  alignment: isUserMessage
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: messageBackgroundColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      _chatMessages[index]
                          .replaceAll("User: ", "")
                          .replaceAll("ChatBot: ", ""),
                      style: TextStyle(color: messageTextColor),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: "Type your message...",
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onSubmitted: (_) => _handleSendMessage(),
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _handleSendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
