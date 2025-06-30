import 'package:flutter/material.dart';
import 'package:flutter_tawkto/flutter_tawk.dart';

class chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Tawk(
        directChatLink: 'https://tawk.to/chat/661ced961ec1082f04e259a8/1hrgg0623',
        visitor: TawkVisitor(
          name: 'khushi bhatiya',
          email: 'khushibhatiya@gmail.com',
        ),
      ),
    );
  }
}

