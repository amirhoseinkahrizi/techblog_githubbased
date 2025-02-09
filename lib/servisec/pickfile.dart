import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:techblog_githubbased/controller/pickfile_contoroller.dart';

PickfileContoroller pickfileContoroller = Get.put(PickfileContoroller());
Future pickfile() async {
  FilePickerResult? result =
      await FilePicker.platform.pickFiles(type: FileType.image);
  pickfileContoroller.file.value = result!.files.first;
}
