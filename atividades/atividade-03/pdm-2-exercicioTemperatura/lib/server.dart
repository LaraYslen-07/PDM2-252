import 'dart:io';
import 'dart:convert';

void main() async {
  const int port = 8080;

  print('Iniciando servidor na porta $port...');

  try {
    final server = await ServerSocket.bind(InternetAddress.anyIPv4, port);
    print('Servidor escutando em ${InternetAddress.anyIPv4.address}:$port');

    await for (final socket in server) {
      print('Cliente conectado atráves do ip: ${socket.remoteAddress.address}:${socket.remotePort}');
      print('Tipo do endereço do cliente: ${socket.remoteAddress.type}');


      socket.listen(
        (List<int> data) {
          final message = utf8.decode(data).trim();
          if (message.isNotEmpty) {
            print('Temperatura recebida: $message');
          }
        },
        onError: (error) {
          print('Erro na conexão: $error');
          socket.destroy();
        },
        onDone: () {
          print('Cliente desconectado.');
          socket.destroy();
        },
      );
    }
  } catch (e) {
    print('Erro ao iniciar servidor: $e');
  }
}
