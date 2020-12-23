import 'package:verus_verify/domain/entities/payload_interface.dart';
import 'package:verus_verify/modules/features/mobile/verify_file/entities/file_input_type.dart';

class FilePayload extends PayloadInterface {
  final String file;
  final String hash;
  final String id;
  final String signature;
  FilePayload({this.file, this.hash, this.id, this.signature});

  Map<String, String> toJson() {
    return {
      FileInputType.file : this.file,
      FileInputType.id : this.id,
      FileInputType.hash: this.hash,
      FileInputType.signature : this.signature
    };
  }
}