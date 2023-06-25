window.angularApp.factory("CourseCreateModal", ["API_URL", "window", "jQuery", "$http", "$uibModal", "$sce", "$rootScope", function (API_URL, window, $, $http, $uibModal, $sce, $scope) {
    return function($scope) {
        var uibCourseModalInstance = $uibModal.open({
            animation: true,
            ariaLabelledBy: "modal-title",
            ariaDescribedBy: "modal-body",
            template: "<div class=\"modal-header\">" +
                            "<button ng-click=\"closeCourseCreateModal();\" type=\"button\" class=\"close course-create-modal\" data-dismiss=\"modal\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>" +
                           "<h3 class=\"modal-title\" id=\"modal-title\"><span class=\"fa fa-fw fa-plus\"></span> {{ modal_title }}</h3>" +
                        "</div>" +
                        "<div class=\"modal-body\" id=\"modal-body\">" +
                            "<div bind-html-compile=\"rawHtml\">Loading...</div>" +
                        "</div>",
            controller: function ($scope, $uibModalInstance) {
                $http({
                  url: window.baseUrl + "/_inc/course.php?action_type=CREATE",
                  method: "GET"
                })
                .then(function(response, status, headers, config) {
                    $scope.modal_title = "Crear nuevo Curso";
                    $scope.rawHtml = $sce.trustAsHtml(response.data);

                    setTimeout(function() {
                        window.storeApp.select2();
                    }, 500);

                }, function(response) {
                   window.swal("Ups!", response.data.errorMsg, "error");
                });

                // Submit Box Form
                $(document).delegate("#create-course-submit", "click", function(e) {
                    e.stopImmediatePropagation();
                    e.stopPropagation();
                    e.preventDefault();

                    var $tag = $(this);
                    var $btn = $tag.button("loading");
                    var form = $($tag.data("form"));
                    form.find(".alert").remove();
                    var actionUrl = form.attr("action");
                    
                    $http({
                        url: window.baseUrl + "/_inc/" + actionUrl,
                        method: "POST",
                        data: form.serialize(),
                        cache: false,
                        processData: false,
                        contentType: false,
                        dataType: "json"
                    }).
                    then(function(response) {
                        $btn.button("reset");
                        var alertMsg = "<div class=\"alert alert-success\">";
                        alertMsg += "<p><i class=\"fa fa-check\"></i> " + response.data.msg + ".</p>";
                        alertMsg += "</div>";
                        form.find(".box-body").before(alertMsg);

                        // Alert
                        window.swal("ÉXITO!", response.data.msg, "success")
                        .then(function(value) {

                            // close modalwindow
                            $scope.closeCourseCreateModal();
                            $(document).find(".close").trigger("click");

                            // insert course into select2
                            var select = $(document).find('#course_id');
                            if (select.length) {
                                var option = $('<option></option>').
                                     attr('selected', true).
                                     text(response.data.course.course_name).
                                     val(response.data.id);
                                option.appendTo(select);
                                select.trigger('change');
                            }

                            // increase course count
                            var courseCount = $(document).find("#course-count h3");
                            if (courseCount) {
                                courseCount.text(parseInt(courseCount.text()) + 1);
                            }

                            // Callback
                            if ($scope.CourseCreateModalCallback) {
                                $scope.CourseCreateModalCallback($scope);
                            }
                        });

                    }, function(response) {
                        $btn.button("reset");
                        var alertMsg = "<div class=\"alert alert-danger\">";
                        window.angular.forEach(response.data, function(value, key) {
                            alertMsg += "<p><i class=\"fa fa-warning\"></i> " + value + ".</p>";
                        });
                        alertMsg += "</div>";
                        form.find(".box-body").before(alertMsg);
                        $(":input[type=\"button\"]").prop("disabled", false);
                        window.swal("Ups!", response.data.errorMsg, "error");
                    });
                });

                $scope.closeCourseCreateModal = function () {
                    uibCourseModalInstance.dismiss("cancel");
                };
            },
            scope: $scope,
            size: "md",
            backdrop  : "static",
            keyboard: true,
        });

        uibCourseModalInstance.result.catch(function () { 
            uibCourseModalInstance.close(); 
        });
    };
}]);