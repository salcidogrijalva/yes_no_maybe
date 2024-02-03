enum Senders { own, others }

class Message {
  final String text;
  final String? imageUrl;
  final Senders fromWho;

  Message({required this.text, this.imageUrl, required this.fromWho});
}