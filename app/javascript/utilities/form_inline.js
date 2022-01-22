document.addEventListener("turbolinks:load", function () {

    $(".form-inline-link").on("click", formInlineLinkHandler);
  
    var errors = document.querySelector(".resource-errors");
  
    if (errors && controls.length) {
        var resourceId = errors.dataset.resourceId;
        formInlineHandler(resourceId);
    }
  });
  
  function formInlineLinkHandler(event) {
    event.preventDefault();
  
    var testId = this.dataset.testId;
    console.log(testId);
    formInlineHandler(testId);
  }
  
  function formInlineHandler(testId) {
    var link = document.querySelector(
        '.form-inline-link[data-test-id="' + testId + '"]'
    );
  
    var $testTitle = $('.test-title[data-test-id="' + testId + '"]');
    var $formInline = $('.form-inline[data-test-id="' + testId + '"]');
  
    $formInline.toggle();
    $testTitle.toggle();
  
    if ($formInline.is(":visible")) {
        link.textContent = "Cancel";
    } else {
        link.textContent = "Edit";
    }
  }