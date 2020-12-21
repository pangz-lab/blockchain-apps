import 'package:verus_verisig/domain/entities/payload_interface.dart';
import 'package:verus_verisig/modules/features/mobile/verify_text_message/entities/message_input_type.dart';

class TextMessagePayload extends PayloadInterface {
  final String message;
  final String id;
  final String signature;
  TextMessagePayload({this.message, this.id, this.signature});

  Map<String, String> toJson() {
    return {
      MessageInputType.id : this.id,
      MessageInputType.message: this.message,
      MessageInputType.signature : this.signature
    };
  }
}