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
                        url: window.baseUrl + "/_inc/ajax.php?type=COLLEGE_PRODUCT_EDIT&college_id=" + college.college_id,
                        method: "GET",
                        cache: false,
                        processData: false,
                        contentType: false,
                        dataType: "json"
                    }).
                        then(function (response) {
                            console.log("okEdgarMain");
                            window.angular.forEach(response.data.products, function (productItem, key) {
                                if (productItem) {
                                    var data = {
                                        p_id: productItem['p_id'],
                                        p_name: productItem['p_name'],
                                        p_code: productItem['p_code'],
                                        quantity: productItem['quantity'],
                                    };
                                    $scope.addProduct(data);
                                    // var find = window._.find($scope.productArray, function (item) {
                                    //     return item.p_id == productItem.p_id;
                                    // });
                                    // if (!find) {
                                    //     $scope.productArray.push(productItem);
                                    // }
                                }
                            });

                        }, function (response) {
                            if (window.store.sound_effect == 1) {
                                window.storeApp.playSound("error.mp3");
                            }
                            window.toastr.error(response.data.errorMsg, "ADVERTENCIA!");
                        });
                };
                $scope.showProductList();
                // Add Product Autocomplete
                $scope.addProduct = function (data) {
                    var html = "<tr id=\"" + data.p_id + "\" class=\"" + data.p_id + "\" data-item-id=\"" + data.p_id + "\">";
                    html += "<td class=\"text-center\" style=\"min-width:100px;\" data-title=\"Product Name\">";
                    html += "<input name=\"product_college_edit[" + data.p_id + "][p_id]\" type=\"hidden\" class=\"item-id\" value=\"" + data.p_id + "\">";
                    html += "<input name=\"product_college_edit[" + data.p_id + "][p_name]\" type=\"hidden\" class=\"item-name\" value=\"" + data.p_name + "\">";
                    html += "<span class=\"name\" id=\"name-" + data.p_id + "\">" + data.p_name + "-" + data.p_code + "</span>";
                    html += "</td>";
                    html += "<td style=\"padding:2px;\" data-title=\"Quantity\">";
                    html += "<input class=\"form-control input-sm text-center quantity\" name=\"product_college_edit[" + data.p_id + "][quantity]\" type=\"text\" value=\"" + data.quantity + "\" data-id=\"" + data.p_id + "\" id=\"quantity-" + data.p_id + "\" onclick=\"this.select();\" onkeypress=\"return IsNumeric(event);\" ondrop=\"return false;\" onpaste=\"return false;\" onKeyUp=\"if(this.value<0){this.value='1';}\">";
                    html += "</td>";
                    html += "<td class=\"text-center\">";
                    html += "<i class=\"fa fa-close text-red pointer remove\" data-id=\"" + data.p_id + "\" title=\"Remove\"></i>";
                    html += "</td>";
                    html += "</tr>";

                    // Update existing if find
                    if ($("#" + data.p_id).length) {
                        quantity = $(document).find("#quantity-" + data.p_id);
                        quantity.val(parseFloat(quantity.val()) + 1);
                    } else {
                        $(document).find("#product-edit-table tbody").prepend(html);
                    }
                };
                // Product Autocomplete
                $(document).on("focus", ".autocomplete-product-edit", function (e) {
                    e.stopImmediatePropagation();
                    e.stopPropagation();
                    e.preventDefault();

                    var $this = $(this);
                    $this.attr('autocomplete', 'off');


                    $this.autocomplete({
                        source: function (request, response) {
                            return $http({
                                url: window.baseUrl + "/_inc/ajax.php?type=ITEMCOLLEGE",
                                dataType: "json",
                                method: "post",
                                data: $.param({
                                    name_starts_with: request.term
                                }),
                            })
                                .then(function (data) {
                                    return response($.map(data.data, function (item) {
                                        var code = item.split("|");
                                        return {
                                            label: code[1].replace(/&amp;/g, "&") + " (" + code[2] + ")",
                                            value: code[0],
                                            data: item
                                        };
                                    }));
                                }, function (data) {
                                    window.swal("Ups!", response.data.errorMsg, "error");
                                });
                        },
                        focusOpen: true,
                        autoFocus: true,
                        minLength: 0,
                        select: function (event, ui) {
                            var names = ui.item.data.split("|");
                            var data = {
                                p_id: names[0],
                                p_name: names[1],
                                p_code: names[2],
                                quantity: 1,
                            };
                            $scope.addProduct(data);
                        },
                        open: function () {
                            $(".ui-autocomplete").perfectScrollbar();
                            if ($(".ui-autocomplete .ui-menu-item").length == 1) {
                                $(".ui-autocomplete .ui-menu-item:first-child").trigger("click");
                                $("#add_item_edit").val("");
                                $("#add_item_edit").focus();
                            }
                        },
                        close: function () {
                            $(document).find(".autocomplete-product-edit").blur();
                            $(document).find(".autocomplete-product-edit").val("");
                            $("#add_item_edit").focus();
                        },
                    }).bind("focus", function () {
                        if ($("#add_item_edit").val().length > 1) {
                            $(this).autocomplete("search");
                        }
                    });
                });
                // Remove Product     

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