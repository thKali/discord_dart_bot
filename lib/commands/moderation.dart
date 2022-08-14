import 'package:nyxx/nyxx.dart';

class Moderation {
  final INyxxWebsocket bot;
  final String prefix;
  final List listenableChannels;
  Moderation(this.bot, this.prefix, this.listenableChannels);

  init() => ouvirComandos();

  ouvirComandos() {
    bot.eventsWs.onMessageReceived.listen((event) {
      var channelId = event.message.channel.id;
      var message = event.message;

      // leia o canal
      if (message.content.contains('${prefix}ler')) {
        if (!listenableChannels.contains(channelId)) {
          listenableChannels.add(channelId);
          message.channel.sendMessage(
            MessageBuilder.content("Agora consigo ler este chat."),
          );
        } else {
          event.message.channel.sendMessage(
            MessageBuilder.content("Eu já leio aqui."),
          );
        }
      }

      //se o canal não pode ser lido, retorne
      if (!listenableChannels.contains(channelId)) return;

      //não leia o canal
      if (message.content.contains('${prefix}deixardeler')) {
        listenableChannels.remove(channelId);
        message.channel.sendMessage(
          MessageBuilder.content("Nunca mais volto aqui."),
        );
      }
    });
  }
}
