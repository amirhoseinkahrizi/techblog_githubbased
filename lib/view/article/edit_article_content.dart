import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:techblog_githubbased/component/my_component.dart';
import 'package:techblog_githubbased/controller/article/manage_article_contoroller.dart';

class EditArticleContent extends StatelessWidget {
  EditArticleContent({super.key});
  final HtmlEditorController controller = HtmlEditorController();
  ManageArticleContoroller manageArticleContoroller =
      Get.put(ManageArticleContoroller());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.clearFocus(),
      child: Scaffold(
        appBar: appBar("ویراش عنوان مقاله"),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              HtmlEditor(
                controller: controller,
                htmlEditorOptions: HtmlEditorOptions(
                    hint: "برای ویراش مقاله اینجا کلیک کنید",
                    shouldEnsureVisible: true,
                    initialText: manageArticleContoroller
                        .articleinfomodel.value.content),
                callbacks: Callbacks(
                  onChangeContent: (p0) {
                    manageArticleContoroller.articleinfomodel.update(
                      (val) {
                        val?.content = p0;
                      },
                    );
                    log(manageArticleContoroller.articleinfomodel.value.content
                        .toString());
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
