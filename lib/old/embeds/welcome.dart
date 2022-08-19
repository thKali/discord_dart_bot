import 'embed_fields/test_field.dart';
import 'package:nyxx/nyxx.dart';

class EmbedWelcome extends EmbedBuilder {
  EmbedWelcome(String userName, String userImage) {
    color = DiscordColor.aquamarine;
    timestamp = DateTime.now();
    title = 'Deêm as boas vindas!';
    description = 'Olha só quem chegou...';
    imageUrl = userImage;
    fields = [
      TestField(),
      TestField(),
      TestField(),
      TestField(),
      TestField(),
      TestField(),
      TestField(),
      TestField(),
    ];
  }
}
// var embedBuilder = EmbedBuilder();
// embedBuilder.author = EmbedAuthorBuilder();
// embedBuilder.color = DiscordColor.aquamarine;
// embedBuilder.description = 'Description';
// embedBuilder.fields = [EmbedFieldBuilder()];
// embedBuilder.footer = EmbedFooterBuilder();
// embedBuilder.imageUrl =
// 'https://3.bp.blogspot.com/-44YplH3JdXQ/XGq6d9hjwjI/AAAAAAAAbZk/Bc1ja6bUJ1cCyaxSiueN7Ci-WOFDbGkxgCLcBGAs/s1600/himouto-umaru-gif.gif';
// embedBuilder.thumbnailUrl =
// 'https://3.bp.blogspot.com/-vPMrJl5N2Tc/XGrGAULtHWI/AAAAAAAAbaw/cvCwk7r3unY3DDrB6lcJ88v_8_ifQOOTACLcBGAs/s1600/cute%2Bgif.gif';
// embedBuilder.timestamp = DateTime.now();
// embedBuilder.title = 'Titulo';
// embedBuilder.type = 'Tipo';
// embedBuilder.url = 'http://www.google.com';
