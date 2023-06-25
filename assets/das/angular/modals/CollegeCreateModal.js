window.angularApp.factory("CollegeCreateModal", ["API_URL", "window", "jQuery", "$http", "$uibModal", "$sce", "$rootScope", function (API_URL, window, $, $http, $uibModal, $sce, $scope) {
    return function($scope) {
        var uibCollegeModalInstance = $uibModal.open({
            animation: true,
            ariaLabelledBy: "modal-title",
            ariaDescribedBy: "modal-body",
            template: "<div class=\"modal-header\">" +
                            "<button ng-click=\"closeCollegeCreateModal();\" type=\"button\" class=\"close college-create-modal\" data-dismiss=\"modal\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>" +
                           "<h3 class=\"modal-title\" id=\"modal-title\"><span class=\"fa fa-fw fa-plus\"></span> {{ modal_title }}</h3>" +
                        "</div>" +
                        "<div class=\"modal-body\" id=\"modal-body\">" +
                            "<div bind-html-compile=\"rawHtml\">Loading...</div>" +
                        "</div>",
            controller: function ($scope, $uibModalInstance) {
                $http({
                  url: window.baseUrl + "/_inc/college.php?action_type=CREATE",
                  method: "GET"
                })
                .then(function(response, status, headers, config) {
                    $scope.modal_title = "Crear nuevo Colegio";
                    $scope.rawHtml = $sce.trustAsHtml(response.data);

                    setTimeout(function() {
                        window.storeApp.select2();
                    }, 500);

                }, function(response) {
                   window.swal("Ups!", response.data.errorMsg, "error");
                });

                // Submit Box Form
                $(document).delegate("#create-college-submit", "click", function(e) {
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
                            $scope.closeCollegeCreateModal();
                            $(document).find(".close").trigger("click");

                            // insert college into select2
                            var select = $(document).find('#college_id');
                            if (select.length) {
                                var option = $('<option></option>').
                                     attr('selected', true).
                                     text(response.data.college.college_name).
                                     val(response.data.id);
                                option.appendTo(select);
                                select.trigger('change');
                            }

                            // increase college count
                            var collegeCount = $(document).find("#college-count h3");
                            if (collegeCount) {
                                collegeCount.text(parseInt(collegeCount.text()) + 1);
                            }

                            // Callback
                            if ($scope.CollegeCreateModalCallback) {
                                $scope.CollegeCreateModalCallback($scope);
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

                $scope.closeCollegeCreateModal = function () {
                    uibCollegeModalInstance.dismiss("cancel");
                };
            },
            scope: $scope,
            size: "md",
            backdrop  : "static",
            keyboard: true,
        });

        uibCollegeModalInstance.result.catch(function () { 
            uibCollegeModalInstance.close(); 
        });
    };
}]);