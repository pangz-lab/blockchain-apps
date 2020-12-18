import 'package:verus_verisig/domain/entities/payload_interface.dart';
import 'package:verus_verisig/modules/features/mobile/verify_hash/entities/hash_input_type.dart';

class HashPayload extends PayloadInterface {
  final String hash;
  final String id;
  final String signature;
  HashPayload({this.hash, this.id, this.signature});

  Map<String, String> toJson() {
    return {
      HashInputType.id : this.id,
      HashInputType.hash: this.hash,
      HashInputType.signature : this.signature
    };
  }
}