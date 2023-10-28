window.angularApp.controller("PurchaseReturnAllController", [
    "$scope",
    "API_URL",
    "window",
    "jQuery",
    "$compile",
    "$uibModal",
    "$http",
    "$sce",
    "PurchaseReturnAllViewModal",
    "EmailModal",
    function (
        $scope,
        API_URL,
        window,
        $,
        $compile,
        $uibModal,
        $http,
        $sce,
        PurchaseReturnAllViewModal,
        EmailModal
    ) {
        "use strict";

        var dt = $("#invoice-invoice-list");
        var transferId = null;
        var i;

        var hideColums = dt.data("hide-colums").split(",");
        var hideColumsArray = [];
        if (hideColums.length) {
            for (i = 0; i < hideColums.length; i += 1) {
                hideColumsArray.push(parseInt(hideColums[i]));
            }
        }

        var $from = window.getParameterByName("from");
        var $to = window.getParameterByName("to");
        var $type = window.getParameterByName("type");

        //================
        // Start datatable
        //================

        dt.dataTable({
            // "oLanguage": { sProcessing: "<img src='../assets/das/img/loading2.gif'>" },
            "oLanguage": idioma(),
            "processing": true,
            "dom": "lfBrtip",
            "serverSide": true,
            "ajax": API_URL + "/_inc/purchase_return_all.php?from=" + $from + "&to=" + $to + "&type=" + $type,
            "fixedHeader": true,
            "order": [[0, "desc"]],
            "aLengthMenu": [
                [10, 25, 50, 100, 200, -1],
                [10, 25, 50, 100, 200, "All"]
            ],
            "columnDefs": [
                { "targets": [4, 5, 6], "orderable": false },
                { "className": "text-center", "targets": [0, 1, 2, 4, 5, 6] },
                { "className": "text-right", "targets": [3] },
                { "visible": false, "targets": hideColumsArray },
                {
                    "targets": [0],
                    'createdCell': function (td, cellData, rowData, row, col) {
                        $(td).attr('data-title', $("#invoice-invoice-list thead tr th:eq(0)").html());
                    }
                },
                {
                    "targets": [1],
                    'createdCell': function (td, cellData, rowData, row, col) {
                        $(td).attr('data-title', $("#invoice-invoice-list thead tr th:eq(1)").html());
                    }
                },
                {
                    "targets": [2],
                    'createdCell': function (td, cellData, rowData, row, col) {
                        $(td).attr('data-title', $("#invoice-invoice-list thead tr th:eq(2)").html());
                    }
                },
                {
                    "targets": [3],
                    'createdCell': function (td, cellData, rowData, row, col) {
                        $(td).attr('data-title', $("#invoice-invoice-list thead tr th:eq(3)").html());
                    }
                },
                {
                    "targets": [4],
                    'createdCell': function (td, cellData, rowData, row, col) {
                        $(td).attr('data-title', $("#invoice-invoice-list thead tr th:eq(4)").html());
                    }
                },
                {
                    "targets": [5],
                    'createdCell': function (td, cellData, rowData, row, col) {
                        $(td).attr('data-title', $("#invoice-invoice-list thead tr th:eq(5)").html());
                    }
                },
                {
                    "targets": [6],
                    'createdCell': function (td, cellData, rowData, row, col) {
                        $(td).attr('data-title', $("#invoice-invoice-list thead tr th:eq(6)").html());
                    }
                },
            ],
            "aoColumns": [
                { data: "created_at" },
                { data: "reference_no" },
                { data: "supplier" },
                { data: "amount" },
                { data: "btn_view" },
                { data: "btn_edit" },
                { data: "btn_delete" }
            ],
            "footerCallback": function (row, data, start, end, display) {
                var pageTotal;
                var api = this.api();
                // Remove the formatting to get integer data for summation
                var intVal = function (i) {
                    return typeof i === "string" ?
                        i.replace(/[\$,]/g, "") * 1 :
                        typeof i === "number" ?
                            i : 0;
                };

                // Total over all pages at column 3
                pageTotal = api
                    .column(3, { page: "current" })
                    .data()
                    .reduce(function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);
                // Update footer
                $(api.column(3).footer()).html(
                    window.formatDecimal(pageTotal, 2)
                );
            },
            "pageLength": window.settings.datatable_item_limit,
            "buttons": [
                {
                    extend: "print", footer: 'true',
                    text: "<i class=\"fa fa-print\"></i>",
                    titleAttr: "Print",
                    title: "Purchase Return Listing-" + from + " to " + to,
                    customize: function (win) {
                        $(win.document.body)
                            .css('font-size', '10pt')
                            .append(
                                '<div><b><i>Powered by: ControlDas.com</i></b></div>'
                            )
                            .prepend(
                                '<div class="dt-print-heading"><img class="logo" src="' + window.logo + '"/><h2 class="title">' + window.store.name + '</h2><p>Printed on: ' + window.formatDate(new Date()) + '</p></div>'
                            );

                        $(win.document.body).find('table')
                            .addClass('compact')
                            .css('font-size', 'inherit');
                    },
                    exportOptions: {
                        columns: [0, 1, 2, 3]
                    }
                },
                {
                    extend: "copyHtml5",
                    text: "<i class=\"fa fa-files-o\"></i>",
                    titleAttr: "Copy",
                    title: window.store.name + " > Purchase Return Listing-" + from + " to " + to,
                    exportOptions: {
                        columns: [0, 1, 2, 3]
                    }
                },
                {
                    extend: "excelHtml5",
                    text: "<i class=\"fa fa-file-excel-o\"></i>",
                    titleAttr: "Excel",
                    title: window.store.name + " > Purchase Return Listing-" + from + " to " + to,
                    exportOptions: {
                        columns: [0, 1, 2, 3]
                    }
                },
                {
                    extend: "csvHtml5",
                    text: "<i class=\"fa fa-file-text-o\"></i>",
                    titleAttr: "CSV",
                    title: window.store.name + " > Purchase Return Listing-" + from + " to " + to,
                    exportOptions: {
                        columns: [0, 1, 2, 3]
                    }
                },
                {
                    extend: "pdfHtml5",
                    text: "<i class=\"fa fa-file-pdf-o\"></i>",
                    titleAttr: "PDF",
                    download: "open",
                    title: window.store.name + " > Purchase Return Listing-" + from + " to " + to,
                    exportOptions: {
                        columns: [0, 1, 2, 3]
                    },
                    customize: function (doc) {
                        doc.content[1].table.widths = Array(doc.content[1].table.body[0].length + 1).join('*').split('');
                        doc.pageMargins = [10, 10, 10, 10];
                        doc.defaultStyle.fontSize = 8;
                        doc.styles.tableHeader.fontSize = 8; doc.styles.tableHeader.alignment = "left";
                        doc.styles.title.fontSize = 10;
                        // Remove spaces around page title
                        doc.content[0].text = doc.content[0].text.trim();
                        // Header
                        doc.content.splice(1, 0, {
                            margin: [0, 0, 0, 12],
                            alignment: 'center',
                            fontSize: 8,
                            text: 'Printed on: ' + window.formatDate(new Date()),
                        });
                        // Create a footer
                        doc['footer'] = (function (page, pages) {
                            return {
                                columns: [
                                    'Powered by ControlDas.com',
                                    {
                                        // This is the right column
                                        alignment: 'right',
                                        text: ['page ', { text: page.toString() }, ' of ', { text: pages.toString() }]
                                    }
                                ],
                                margin: [10, 0]
                            };
                        });
                        // Styling the table: create style object
                        var objLayout = {};
                        // Horizontal line thickness
                        objLayout['hLineWidth'] = function (i) { return 0.5; };
                        // Vertikal line thickness
                        objLayout['vLineWidth'] = function (i) { return 0.5; };
                        // Horizontal line color
                        objLayout['hLineColor'] = function (i) { return '#aaa'; };
                        // Vertical line color
                        objLayout['vLineColor'] = function (i) { return '#aaa'; };
                        // Left padding of the cell
                        objLayout['paddingLeft'] = function (i) { return 4; };
                        // Right padding of the cell
                        objLayout['paddingRight'] = function (i) { return 4; };
                        // Inject the object in the document
                        doc.content[1].layout = objLayout;
                    }
                }
            ],
        });

        $scope.showStockList = function (toStoreID) {
            $scope.productsArray = [];
            $scope.transferProductArray = [];
            $http({
                url: window.baseUrl + "/_inc/ajax.php?type=STOCKITEMS&store_id=" + toStoreID,
                method: "GET",
                data: "",
                cache: false,
                processData: false,
                contentType: false,
                dataType: "json"
            }).
                then(function (response) {
                    window._.map(response.data.products, function (item) {
                        item.quantity = item.item_quantity - item.total_sell - item.return_quantity;
                        $scope.productsArray.push(item);
                    });
                    $scope.totalStockItem = window._.size($scope.productsArray);

                }, function (response) {

                    var alertMsg = "<div>";
                    window.angular.forEach(response.data, function (value) {
                        alertMsg += "<p>" + value + ".</p>";
                    });
                    alertMsg += "</div>";
                    window.toastr.warning(alertMsg, "ADVERTENCIA!");
                });
        };

        var fromStoreID = "";
        $('#from_store_id').on('select2:select', function (e) {
            var data = e.params.data;
            fromStoreID = data.element.value;
            if (toStoreID == fromStoreID) {
                $("#from_store_id").val("").trigger("change");
                window.toastr.warning("From and To store can not be same", "ADVERTENCIA!");
                return false;
            } else {
                $("#from_store_id").val(fromStoreID).trigger("change");
            }
            $scope.showStockList(fromStoreID);
        });

        if (window.store.store_id && window.store.store_id != "undefined") {
            $scope.showStockList(window.store.store_id);
            fromStoreID = window.store.store_id;
            $("#from_store_id").val(window.store.store_id).trigger("change");
        };

        var toStoreID = "";
        $('#to_store_id').on('select2:select', function (e) {
            var data = e.params.data;
            toStoreID = data.element.value;
            if (toStoreID == fromStoreID) {
                $("#to_store_id").val("").trigger("change");
                window.toastr.warning("From and To store can not be same", "ADVERTENCIA!");
                return false;
            } else {
                $("#to_store_id").val(toStoreID).trigger("change");
            }
        });

        $scope.transferItemArray = [];
        var stopProcess = false;
        $scope.addItemToTransferList = function (id, qty, index) {
            if (!qty) { qty = 1; }
            $http({
                url: API_URL + "/_inc/ajax.php?type=STOCKITEM&id=" + id + "&quantity=" + qty,
                method: "GET",
                cache: false,
                processData: false,
                contentType: false,
                dataType: "json"
            }).
                then(function (response) {
                    if (id) {
                        var find = window._.find($scope.transferItemArray, function (item) {
                            return item.id == response.data.products.id;
                        });
                        if (find) {
                            window._.map($scope.productsArray, function (sitem) {
                                if (sitem.id == response.data.products.id) {
                                    if (sitem.quantity <= 0) {
                                        window.toastr.warning('Out of Stock', "ADVERTENCIA!");
                                        stopProcess = true;
                                    } else {
                                        sitem.quantity = sitem.quantity - 1;
                                    }
                                }
                            });
                            if (stopProcess == false) {
                                window._.map($scope.transferItemArray, function (item) {
                                    if (item.id == response.data.products.id) {
                                        item.quantity = item.quantity + 1;
                                        $scope.totalItem = window._.size($scope.transferItemArray);
                                    }
                                });
                            }
                        } else {
                            response.data.products.quantity = 1;
                            $scope.transferItemArray.push(response.data.products);
                            $scope.totalItem = window._.size($scope.transferItemArray);

                            window._.map($scope.productsArray, function (sitem) {
                                if (sitem.id == response.data.products.id) {
                                    sitem.quantity = sitem.quantity - 1;
                                }
                            });
                        }
                    }
                }, function (response) {
                    window.toastr.warning(response.data.errorMsg, "ADVERTENCIA!");
                });
        };

        $scope.removeItemFromList = function (index, id) {
            window._.map($scope.transferItemArray, function (item, key) {
                var quantity = parseFloat($("#quantity-" + item.id).val());
                if (isNaN(quantity)) {
                    quantity = 1;
                    $("#quantity-" + item.id).val(quantity);
                }
                if (item.id == id) {
                    $scope.totalItem = $scope.totalItem - 1;
                }
                window._.map($scope.productsArray, function (sitem) {
                    if (sitem.id == item.id) {
                        sitem.quantity = sitem.quantity + quantity;
                    }
                });
            });
            $scope.transferItemArray.splice(index, 1);
            $scope.totalItem = window._.size($scope.transferItemArray);
        };

        $scope.stockCheck = function () {
            window._.map($scope.transferItemArray, function (item) {
                var quantity = parseFloat($("#quantity-" + item.id).val());
                if (isNaN(quantity)) {
                    quantity = 1;
                    $("#quantity-" + item.id).val(quantity);
                }
                window._.map($scope.productsArray, function (sitem) {
                    if (sitem.id == item.id) {
                        var stockQuantity = sitem.item_quantity - sitem.total_sell;
                        if (stockQuantity < quantity) {
                            window.toastr.warning('Out of Stock', "ADVERTENCIA!");
                            stopProcess = true;
                            sitem.quantity = 0;
                            $("#quantity-" + sitem.id).val(stockQuantity);
                            return false;
                        } else {
                            sitem.quantity = stockQuantity - quantity;
                            return true;
                        }
                    }
                });
                $scope.$apply(function () {
                    $scope.productsArray = $scope.productsArray;
                });
            });
            return true;
        }

        $(document).on('click', function (e) {
            if (e.target.id.indexOf('stock-item') !== -1) {
                return true;
            }
            $scope.stockCheck();
        });

        $("#form-transfer").keypress(function (e) {
            if (e.which == 13) {
                return false;
            }
        })

        // var requestSuccess = false;
        // Transfer confirm
        // $(document).delegate("#transfer-confirm-btn", "click", function(e) {
        $("#transfer-confirm-btn").on("click", function (e) {
            e.preventDefault();
            e.stopPropagation();
            e.stopImmediatePropagation();

            if ($scope.stockCheck()) {
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
                    then(function (response) {
                        $btn.button("reset");
                        $(":input[type=\"button\"]").prop("disabled", false);
                        var alertMsg = response.data.msg;
                        window.toastr.success(alertMsg, "ÉXITO!");
                        dt.DataTable().ajax.reload(function (json) {
                            if ($("#row_" + response.data.id).length) {
                                $("#row_" + response.data.id).flash("yellow", 5000);

                                // SE AGREGA IMPRESION AUTOMATICA BY Edgar Yagual
                                var d = dt.DataTable().row($("#row_" + response.data.id)).data();
                                PurchaseReturnAllViewModal(d);

                            }
                        }, false);
                        $("#reset").trigger("click");
                    }, function (response) {

                        // requestSuccess = false;
                        $btn.button("reset");
                        $(":input[type=\"button\"]").prop("disabled", false);
                        var alertMsg = "<div>";
                        window.angular.forEach(response.data, function (value) {
                            alertMsg += "<p>" + value + ".</p>";
                        });
                        alertMsg += "</div>";
                        window.toastr.warning(alertMsg, "ADVERTENCIA!");
                    });
            }
        });


        // View invoice
        $(document).delegate("#view-btn", "click", function (e) {
            e.stopPropagation();
            e.preventDefault();
            var d = dt.DataTable().row($(this).closest("tr")).data();
            // console.log(d);
            var $tag = $(this);
            var $btn = $tag.button("loading");
            PurchaseReturnAllViewModal(d);
            setTimeout(function () {
                $tag.button("reset");
            }, 300);
        });

        // Reset form
        $(document).delegate("#reset", "click", function (e) {
            e.preventDefault();
            e.stopPropagation();
            e.stopImmediatePropagation();
            $("#ref_no").val("");
            $("#amount").val("");
            $("#note").val("");
            $("#status").val("sent").trigger("change");
            $("#to_store_id").val("").trigger("change");
            $("#image_thumb img").attr("src", "../assets/das/img/noimage.jpg");
            $("#image").val("");
            $scope.$applyAsync(function () {
                // $scope.productsArray = [];
                $scope.transferItemArray = [];
            });
        });

        // Append email button into datatable buttons
        if (window.sendReportEmail) { $(".dt-buttons").append("<button id=\"email-btn\" class=\"btn btn-default buttons-pdf buttons-email\" tabindex=\"0\" aria-controls=\"transfer-transfer-list\" type=\"button\" title=\"Email\"><span><i class=\"fa fa-envelope\"></i></span></button>"); };

        // Send transfer list through email
        $("#email-btn").on("click", function (e) {
            e.stopPropagation();
            e.preventDefault();
            dt.find("thead th:nth-child(5), thead th:nth-child(6), thead th:nth-child(7), tbody td:nth-child(5), tbody td:nth-child(6), tbody td:nth-child(7), tfoot th:nth-child(5), tfoot th:nth-child(6), tfoot th:nth-child(7)").addClass("hide-in-mail");
            var thehtml = dt.html();
            EmailModal({ template: "default", subject: "Send Transter List", title: "Send Transter List", html: thehtml });
        });
    }]);

