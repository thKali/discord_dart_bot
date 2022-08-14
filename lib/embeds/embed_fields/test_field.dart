import 'package:nyxx/nyxx.dart';

class TestField extends EmbedFieldBuilder {
  TestField() {
    content = 'Conteúdo';

    name = 'Name';
    inline = false; // if true literally gonna stay inline
  }
}
