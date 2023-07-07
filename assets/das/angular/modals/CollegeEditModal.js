window.angularApp.factory("CollegeEditModal", ["API_URL", "window", "jQuery", "$http", "$uibModal", "$sce", "$rootScope", function (API_URL, window, $, $http, $uibModal, $sce, $scope) {
    return function (college) {
        var supId;
        var uibModalInstance = $uibModal.open({
            animation: true,
            ariaLabelledBy: "modal-title",
            ariaDescribedBy: "modal-body",
            template: "<div class=\"modal-header\">" +
                "<button ng-click=\"closeCollegeEditModal();\" type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>" +
                "<h3 class=\"modal-title\" id=\"modal-title\"><span class=\"fa fa-fw fa-pencil\"></span> {{ modal_title }}</h3>" +
                "</div>" +
                "<div class=\"modal-body\" id=\"modal-body\">" +
                "<div bind-html-compile=\"rawHtml\">Loading...</div>" +
                "</div>",
            controller: function ($scope, $uibModalInstance) {
                $http({
                    url: window.baseUrl + "/_inc/college.php?college_id=" + college.college_id + "&action_type=EDIT",
                    method: "GET"
                })
                    .then(function (response, status, headers, config) {
                        $scope.modal_title = college.college_name;
                        $scope.rawHtml = $sce.trustAsHtml(response.data);
                        setTimeout(function () {
                            window.storeApp.select2();
                        }, 100);
                    }, function (response) {
                        window.swal("Ups!", response.data.errorMsg, "error");
                    });

                $(document).delegate("#college-update", "click", function (e) {

                    e.stopImmediatePropagation();
                    e.stopPropagation();
                    e.preventDefault();

                    var $tag = $(this);
                    var $btn = $tag.button("loading");
                    var form = $($tag.data("form"));
                    var datatable = $tag.data("datatable");
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
                        then(function (response) {

                            $btn.button("reset");
                            var alertMsg = "<div class=\"alert alert-success\">";
                            alertMsg += "<p><i class=\"fa fa-check\"></i> " + response.data.msg + ".</p>";
                            alertMsg += "</div>";
                            form.find(".box-body").before(alertMsg);
                            $(datatable).DataTable().ajax.reload(null, false);

                            // Alert
                            window.swal({
                                title: "ÉXITO!",
                                text: response.data.msg,
                                icon: "success",
                                buttons: true,
                                dangerMode: false,
                            })
                                .then(function (willDelete) {
                                    if (willDelete) {
                                        $scope.closeCollegeEditModal();
                                        $(document).find(".close").trigger("click");
                                        supId = response.data.id;

                                        $(datatable).DataTable().ajax.reload(function (json) {
                                            if ($("#row_" + supId).length) {
                                                $("#row_" + supId).flash("yellow", 5000);
                                            }
                                        }, false);

                                    } else {
                                        $(datatable).DataTable().ajax.reload(null, false);
                                    }
                                });

                        }, function (response) {

                            $btn.button("reset");
                            var alertMsg = "<div class=\"alert alert-danger\">";
                            window.angular.forEach(response.data, function (value, key) {
                                alertMsg += "<p><i class=\"fa fa-warning\"></i> " + value + ".</p>";
                            });
                            alertMsg += "</div>";
                            form.find(".box-body").before(alertMsg);
                            $(":input[type=\"button\"]").prop("disabled", false);
                            window.swal("Ups!", response.data.errorMsg, "error");
                        });

                });

                $scope.closeCollegeEditModal = function () {
                    $uibModalInstance.dismiss("cancel");
                };


                var page = 1;
                $scope.products;
                $scope.showProductList = function (url) {
                    $http({
                        //url: url ? url : API_URL + "/_inc/pos.php?action_type=PRODUCTLIST&query_string=" + productCode + "&category_id=" + categoryId + "&field=p_name&page=" + page,
                        url: url ? url : API_URL + "/_inc/college2.php?action_type=COLLEGE_PRODUCT_EDIT&college_id=" + college.college_id,
                        method: "GET",
                        cache: false,
                        processData: false,
                        contentType: false,
                        dataType: "json"
                    }).
                        then(function (response) {
                            console.log("okModal");
                            $scope.products = response.data.products;

                        }, function (response) {
                            if (window.store.sound_effect == 1) {
                                window.storeApp.playSound("error.mp3");
                            }
                            window.toastr.error(response.data.errorMsg, "ADVERTENCIA!");
                        });
                };
                $scope.showProductList();

            },
            scope: $scope,
            size: "md",
            backdrop: "static",
            keyboard: true,
        });

        uibModalInstance.result.catch(function () {
            uibModalInstance.close();
        });
    };
}]);