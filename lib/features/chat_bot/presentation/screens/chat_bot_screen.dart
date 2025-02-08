import 'package:flutter/material.dart';
import 'package:todo_bloc/core/components/textfield/custom_text_field.dart';
import 'package:todo_bloc/core/constants/app_color.dart';
import 'package:todo_bloc/core/constants/app_style.dart';

class ChatBotScreen extends StatelessWidget {
  ChatBotScreen({super.key});
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'Assets.images.googleGeminiLogo.path',
            width: 80,
          ),
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFDFE4F1),
                  Color(0xFFB0C7D2),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          actions: [
            // SizedBox(
            //   width: 100,
            //   child: Obx(
            //     () => DropdownButtonFormField<GeminiType>(
            //       value: controller.typeGemini.value,
            //       decoration: const InputDecoration(
            //         border: InputBorder.none,
            //       ),
            //       items: const [
            //         DropdownMenuItem<GeminiType>(
            //           value: GeminiType.report,
            //           child: Text(
            //             'Gemini report',
            //             style: AppStyle.regular14,
            //           ),
            //         ),
            //         DropdownMenuItem<GeminiType>(
            //           value: GeminiType.chat,
            //           child: Text(
            //             'Gemini chat',
            //             style: AppStyle.regular14,
            //           ),
            //         ),
            //       ],
            //       onChanged: (p0) {
            //         controller.changeTypeGemini(p0!);
            //       },
            //     ),
            //   ),
            // ),
            // const SizedBox(width: 10),
          ],
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.only(bottom: 70),
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    margin: EdgeInsets.only(left: 0, right: 51),
                    decoration: BoxDecoration(
                      color: AppColor.backgroundColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'message.content',
                      style: AppStyle.regular14,
                    ),
                  ),
                ));
              },
            ),
            Positioned(
              bottom: 10,
              left: 16,
              right: 16,
              child: Row(
                children: [
                  Flexible(
                    child: CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Type your message...',
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.send_rounded)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
