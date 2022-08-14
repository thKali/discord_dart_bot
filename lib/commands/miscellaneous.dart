import 'package:nyxx/nyxx.dart';

class Micellaneous {
  final INyxxWebsocket bot;
  final String prefix;
  final List listenableChannels;
  Micellaneous(this.bot, this.prefix, this.listenableChannels);

  init() => ouvirComandos();

  ouvirComandos() {
    bot.eventsWs.onMessageReceived.listen((event) {
      var channelId = event.message.channel.id;
      var message = event.message;

      //se o canal não pode ser lido, retorne
      if (!listenableChannels.contains(channelId)) return;

      if (message.content.contains('${prefix}invite')) {
        message.channel.sendMessage(MessageBuilder.content(
            "Acesse o link abaixo para me convidar.\nhttps://discord.com/api/oauth2/authorize?client_id=704475647308726342&permissions=8&scope=bot"));
      }
    });
  }
}
