import 'package:discord_bot/error_handler.dart';
import 'package:discord_bot/settings.dart';
import 'package:discord_bot/src/commands/ping.dart';
import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commands/nyxx_commands.dart';
// List<String> admin = ['338739607044620288'];

void main(List<String> arguments) {
  final bot = NyxxFactory.createNyxxWebsocket(token, intents);

  final commands = CommandsPlugin(
    prefix: mentionOr((_) => prefix),
    options: CommandsOptions(logErrors: false, hideOriginalResponse: false),
  );

  //commands regist
  //uses cascade operator
  commands.addCommand(ping);

  // Add our error handler
  commands.onCommandError.listen(commandErrorHandler);

  // add plugins
  bot
    ..registerPlugin(Logging())
    ..registerPlugin(CliIntegration())
    ..registerPlugin(IgnoreExceptions())
    ..registerPlugin(commands);


  bot.connect();
}
