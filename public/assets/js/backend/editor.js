define([
    'jquery',
    'addons/tinymce/tinymce'
], function ($) {

    var Editor = {
        init: function (selector) {
            if (typeof tinymce === 'undefined') {
                console.error('tinymce not loaded');
                return;
            }

            tinymce.init({
    selector: '.editor',
    language: 'zh_CN',
    height: 400,

    plugins: 'image link lists code fullscreen',
    toolbar: 'undo redo | bold italic | image | code fullscreen',

    /* ===== URL 处理（核心） ===== */
    relative_urls: false,
    convert_urls: false,
    remove_script_host: true,
    document_base_url: '/',

    /* ===== 图片尺寸（移动端友好） ===== */
    image_dimensions: false,
    object_resizing: false,

    /* ===== 上传 ===== */
    images_upload_handler: function (blobInfo, success, failure) {
        var formData = new FormData();
        formData.append('file', blobInfo.blob(), blobInfo.filename());

        $.ajax({
            url: Fast.api.fixurl('ajax/upload'),
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function (res) {
                if (res.code === 1) {
                    success(res.data.url); // /uploads/...
                } else {
                    failure(res.msg || '上传失败');
                }
            },
            error: function () {
                failure('上传请求失败');
            }
        });
    }
});



        }
    };

    return Editor;
});
