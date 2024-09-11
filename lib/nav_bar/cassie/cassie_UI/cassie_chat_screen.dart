import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:iitschedulingapp/nav_bar/course_selection/preview/list_week_tab_bar/list_tab/schedule_api.dart';
import 'package:provider/provider.dart';
import '../../course_selection/selected_courses.dart';
import 'cassie_chat_message.dart';
import 'package:dart_openai/dart_openai.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();

  Future<void> _handleSubmitted(String text) async {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      isUser: true,
    );
    setState(() {
      _messages.insert(0, message);
    });

    var selectedCourses = Provider.of<SelectedCourses>(context, listen: false);

    var courseDetail = await getCourseDetails(selectedCourses);
    String courseDetailString =
        courseDetail.map((item) => item.toString()).join(", ");
    print(courseDetailString);

    // Replace this with the logic to send the user's message to your AI model
    // and get a response.
    await dotenv.load(fileName: '.env');
    OpenAI.apiKey = dotenv.env['OPENAI_API_KEY'] ?? "key not found";

    final completion = await OpenAI.instance.chat.create(
      model: "gpt-4",
      messages: [
        OpenAIChatCompletionChoiceMessageModel(
          content: [
            OpenAIChatCompletionChoiceMessageContentItemModel.text(
              "do not provide any extra commentary unless directly prompted for some. give me three unique schedules from this list. classes and labs should not have overlap. include the department code in paranthesis at the end referenced as to CRN. the labs and the classes work as pairs with the same class name and professor:$courseDetailString",
            ),
          ],
          role: OpenAIChatMessageRole.user,
        ),
      ],
    );

    String response = completion.choices.last.message.content?.first.text ?? 'Sorry, I did not understand that.';

    ChatMessage botMessage = ChatMessage(
      text: response,
      isUser: false,
    );

    setState(() {
      _messages.insert(0, botMessage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.789,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            color: Theme.of(context).primaryColor,
            child: const Center(
              child: Text(
                "AI Chat",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Flexible(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    reverse: true,
                    itemCount: _messages.length,
                    itemBuilder: (_, int index) => _messages[index],
                  ),
                ),
                const Divider(height: 1.0),
                Container(
                  decoration: BoxDecoration(color: Theme.of(context).cardColor),
                  child: _buildTextComposer(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).canvasColor),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration:
                    const InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () => _handleSubmitted(_textController.text),
            ),
          ],
        ),
      ),
    );
  }
}
