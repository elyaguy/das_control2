window.angularApp.controller("CollegeController", [
    "$scope",
    "API_URL",
    "window",
    "jQuery",
    "$compile",
    "$uibModal",
    "$http",
    "$sce",
    "CollegeEditModal",
    "CollegeDeleteModal",
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
        CollegeEditModal,
        CollegeDeleteModal,
        EmailModal
    ) {
        "use strict";

        var dt = $("#college-college-list");
        // var dt2 = $("#product-college-list");
        var supId;
        var i;

        var quantity = 0;


        var hideColums = dt.data("hide-colums").split(",");
        var hideColumsArray = [];
        if (hideColums.length) {
            for (i = 0; i < hideColums.length; i += 1) {
                hideColumsArray.push(parseInt(hideColums[i]));
            }
        }

        //================
        // Start datatable
        //================

        dt.dataTable({
            // "oLanguage": { sProcessing: "<img src='../assets/das/img/loading2.gif'>" },
            "oLanguage": idioma(),
            "processing": true,
            "dom": "lfBrtip",
            "serverSide": true,
            "ajax": API_URL + "/_inc/college.php",
            "order": [[0, "desc"]],
            "aLengthMenu": [
                [10, 25, 50, 100, 200, -1],
                [10, 25, 50, 100, 200, "All"]
            ],
            "columnDefs": [
                { "targets": [4, 5, 6], "orderable": false },
                { "visible": false, "targets": hideColumsArray },
                { "className": "text-center", "targets": [0, 1, 2, 3, 4, 5, 6] },
                {
                    "targets": [0],
                    'createdCell': function (td, cellData, rowData, row, col) {
                        $(td).attr('data-title', $("#college-college-list thead tr th:eq(0)").html());
                    }
                },
                {
                    "targets": [1],
                    'createdCell': function (td, cellData, rowData, row, col) {
                        $(td).attr('data-title', $("#college-college-list thead tr th:eq(1)").html());
                    }
                },
                {
                    "targets": [2],
                    'createdCell': function (td, cellData, rowData, row, col) {
                        $(td).attr('data-title', $("#college-college-list thead tr th:eq(2)").html());
                    }
                },
                {
                    "targets": [3],
                    'createdCell': function (td, cellData, rowData, row, col) {
                        $(td).attr('data-title', $("#college-college-list thead tr th:eq(3)").html());
                    }
                },
                {
                    "targets": [4],
                    'createdCell': function (td, cellData, rowData, row, col) {
                        $(td).attr('data-title', $("#college-college-list thead tr th:eq(4)").html());
                    }
                },
                {
                    "targets": [5],
                    'createdCell': function (td, cellData, rowData, row, col) {
                        $(td).attr('data-title', $("#college-college-list thead tr th:eq(5)").html());
                    }
                },
                {
                    "targets": [6],
                    'createdCell': function (td, cellData, rowData, row, col) {
                        $(td).attr('data-title', $("#college-college-list thead tr th:eq(6)").html());
                    }
                },
            ],
            "aoColumns": [
                { data: "college_id" },
                { data: "college_name" },
                { data: "total_product" },
                { data: "status" },
                { data: "btn_view" },
                { data: "btn_edit" },
                { data: "btn_delete" }
            ],
            "footerCallback": function (row, data, start, end, display) {
                var pageTotal;
                var api = this.api();
                // Remove the formatting to get integer data for summation
                var intVal = function (i) {
                    return typeof i === 'string' ?
                        i.replace(/[\$,]/g, '') * 1 :
                        typeof i === 'number' ?
                            i : 0;
                };
                // Total over all pages at column 3
                pageTotal = api
                    .column(3, { page: 'current' })
                    .data()
                    .reduce(function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);
                // Update footer
                $(api.column(3).footer()).html(
                    pageTotal
                );
            },
            "pageLength": window.settings.datatable_item_limit,
            "buttons": [
                {
                    extend: "print", footer: 'true',
                    text: "<i class=\"fa fa-print\"></i>",
                    titleAttr: "Print",
                    title: "College List",
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
                    title: window.store.name + " > College List",
                    exportOptions: {
                        columns: [0, 1, 2, 3]
                    }
                },
                {
                    extend: "excelHtml5",
                    text: "<i class=\"fa fa-file-excel-o\"></i>",
                    titleAttr: "Excel",
                    title: window.store.name + " > College List",
                    exportOptions: {
                        columns: [0, 1, 2, 3]
                    }
                },
                {
                    extend: "csvHtml5",
                    text: "<i class=\"fa fa-file-text-o\"></i>",
                    titleAttr: "CSV",
                    title: window.store.name + " > College List",
                    exportOptions: {
                        columns: [0, 1, 2, 3]
                    }
                },
                {
                    extend: "pdfHtml5",
                    text: "<i class=\"fa fa-file-pdf-o\"></i>",
                    titleAttr: "PDF",
                    download: "open",
                    title: window.store.name + " > College List",
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

        //================
        // End datatable
        //================


        // Add Product
        $scope.addProduct = function (data) {

            var html = "<tr id=\"" + data.p_id + "\" class=\"" + data.p_id + "\" data-item-id=\"" + data.p_id + "\">";
            html += "<td class=\"text-center\" style=\"min-width:100px;\" data-title=\"Product Name\">";
            html += "<input name=\"product_college[" + data.p_id + "][p_id]\" type=\"hidden\" class=\"item-id\" value=\"" + data.p_id + "\">";
            html += "<input name=\"product_college[" + data.p_id + "][p_name]\" type=\"hidden\" class=\"item-name\" value=\"" + data.p_name + "\">";
            html += "<span class=\"name\" id=\"name-" + data.p_id + "\">" + data.p_name + "-" + data.p_code + "</span>";
            html += "</td>";
            html += "<td style=\"padding:2px;\" data-title=\"Quantity\">";
            html += "<input class=\"form-control input-sm text-center quantity\" name=\"product_college[" + data.p_id + "][quantity]\" type=\"text\" value=\"" + data.quantity + "\" data-id=\"" + data.p_id + "\" id=\"quantity-" + data.p_id + "\" onclick=\"this.select();\" onkeypress=\"return IsNumeric(event);\" ondrop=\"return false;\" onpaste=\"return false;\" onKeyUp=\"if(this.value<0){this.value='1';}\">";
            html += "</td>";
            html += "<td class=\"text-center\">";
            html += "<i class=\"fa fa-close text-red pointer remove\" data-id=\"" + data.p_id + "\" title=\"Remove\"></i>";
            html += "</td>";
            html += "</tr>";

            // Update existing if find
            if ($("#" + data.p_id).length) {
                quantity = $(document).find("#quantity-" + data.p_id);
                quantity.val(parseFloat(quantity.val()) + 1);
                // unitPrice = $(document).find("#purchase-price-" + data.itemId);
                // itemTaxMethod = $(document).find("#tax-method-" + data.itemId);
                // itemTaxrate = $(document).find("#taxrate-" + data.itemId);
                // itemTaxAmount = $(document).find("#tax-amount-" + data.itemId);
                // taxAmount = $(document).find("#tax-amount-" + data.itemId);
                // realItemTaxAmount = parseFloat((itemTaxrate.val() / 100) * parseFloat(unitPrice.val()));
                // itemTaxAmount.val(parseFloat(quantity.val()) * realItemTaxAmount);
                // taxAmount.val(parseFloat(parseFloat(quantity.val()) * realItemTaxAmount).toFixed(2));
                // itemTaxAmountView = $(document).find("#tax-amount-view-" + data.itemId);
                // itemTaxAmountView.text(itemTaxAmount.val());
                // subTotal = $(document).find("#subtotal-" + data.itemId);
                // subTotal.text(window.formatDecimal(parseFloat(subTotal.text()) + parseFloat(purchasePrice), 2));
            } else {
                // $(document).find("#product-table tbody").append(html);
                $(document).find("#product-table tbody").prepend(html);
                //array_unshift($(document).find("#product-table tbody"), html);

            }
        };


        // Product Autocomplete
        $(document).on("focus", ".autocomplete-product", function (e) {
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
                        $("#add_item").val("");
                        $("#add_item").focus();
                    }
                },
                close: function () {
                    $(document).find(".autocomplete-product").blur();
                    $(document).find(".autocomplete-product").val("");
                    $("#add_item").focus();
                },
            }).bind("focus", function () {
                if ($("#add_item").val().length > 1) {
                    $(this).autocomplete("search");
                }
            });
        });

        // var page = 1;
        // $scope.products;
        // $scope.showProductList = function (url) {
        //     $http({
        //         //url: url ? url : API_URL + "/_inc/pos.php?action_type=PRODUCTLIST&query_string=" + productCode + "&category_id=" + categoryId + "&field=p_name&page=" + page,
        //         method: "GET",
        //         cache: false,
        //         processData: false,
        //         contentType: false,
        //         dataType: "json"
        //     }).
        //         then(function (response) {
        //             $scope.products = response.data.products;

        //             // console.log(response.data.products);   
        //             // dt2.dataTable({
        //             //     paging: true,
        //             //     data: $scope.products,
        //             //     orderable: false,
        //             //     scrollCollapse: false,
        //             //     searching: false,
        //             //     editable:true,
        //             //     select: true,
        //             //     scrollY: '30vh',
        //             //     columnDefs: [
        //             //         {
        //             //             orderable: false,
        //             //             className: 'select-checkbox',
        //             //             targets: 0
        //             //         },
        //             //         {
        //             //             orderable: false,
        //             //             editable: true,
        //             //             targets: 2,
        //             //         }
        //             //     ],
        //             //     select: {
        //             //         style: 'os',
        //             //         selector: 'td:first-child'
        //             //     },
        //             //     order: [[1, 'asc']],
        //             //     columns: [
        //             //         { data: null },
        //             //         { data: 'p_name' },
        //             //         { data: 'course_name' },
        //             //         { data: 'estimatedsales' }
        //             //     ]
        //             // });
        //             // dt2.dataTable({
        //             //     data: $scope.products,
        //             //     select: true,
        //             //     aLengthMenu: [
        //             //         [5, 10, 25, 50, 100, 200, -1],
        //             //         [5, 10, 25, 50, 100, 200, "All"]
        //             //     ],
        //             //     columns: [
        //             //         { data: 'p_id' },
        //             //         { data: 'p_name' },
        //             //         { data: 'course_name' },
        //             //         { data: 'estimatedsales' }
        //             //     ]
        //             // });

        //         }, function (response) {
        //             if (window.store.sound_effect == 1) {
        //                 window.storeApp.playSound("error.mp3");
        //             }
        //             window.toastr.error(response.data.errorMsg, "ADVERTENCIA!");
        //         });
        // };
        // $scope.showProductList();




        //================
        // Start datatable
        //================
        // var editor = new $.fn.dataTable.Editor({
        //     ajax: "ruta/al/servidor",
        //     table: "#course-course-list",
        //     fields: [
        //       { label: "ID", name: "p_name" },
        //       { label: "Nombre", name: "course_name" },
        //       { label: "Total de productos", name: "stimatedsales" },
        //       // Agrega más campos según tus necesidades
        //     ]
        //   });



        // dt2.dataTable({
        //     "oLanguage": { sProcessing: "<img src='../assets/das/img/loading2.gif'>", "sSearch": "Filter records:" },
        //     "language": {
        //         url: '//cdn.datatables.net/plug-ins/1.13.5/i18n/es-MX.json',
        //     },
        //     // 
        //     "processing": true,

        //     // "dom": "lfBrtip",
        //     "dom": "Bfrtip",
        //     // "select": true,
        //     "serverSide": false,
        //     // "ajax": API_URL + "/_inc/college.php?info=COLLEGE_PRODUCT",
        //     // "ajax": API_URL + "/_inc/college2.php",
        //     "order": [[0, "desc"]],
        //     "aLengthMenu": [
        //         [5, 10, 25, 50, 100, 200, -1],
        //         [5, 10, 25, 50, 100, 200, "All"]
        //     ],
        //     // "columnDefs": [
        //     //     { "targets": [0, 1, 2, 3], "orderable": true },
        //     //     { "targets": [2, 3], "editable": true },

        //     //     { "visible": false, "targets": hideColumsArray },
        //     //     { "className": "text-center", "targets": [0, 1, 2, 3] },
        //     //     {
        //     //         "targets": [1],
        //     //         'createdCell': function (td, cellData, rowData, row, col) {
        //     //             $(td).attr('data-title', $("#product-college-list thead tr th:eq(1)").html());
        //     //         }
        //     //     },
        //     //     {
        //     //         "targets": [2],
        //     //         'createdCell': function (td, cellData, rowData, row, col) {
        //     //             $(td).attr('data-title', $("#product-college-list thead tr th:eq(2)").html());
        //     //         }
        //     //     },
        //     //     {
        //     //         "targets": [3],
        //     //         'createdCell': function (td, cellData, rowData, row, col) {
        //     //             $(td).attr('data-title', $("#product-college-list thead tr th:eq(3)").html());
        //     //         }
        //     //     },
        //     //     // {
        //     //     //     "targets": 2, // Índice de la columna "course_name"
        //     //     //     "editable": true // Habilitar la edición para esta columna
        //     //     // }

        //     // ],
        //     // "aoColumns": [
        //     //     { data: "select" },
        //     //     { data: "p_name" },
        //     //     { data: "course_name" },
        //     //     { data: "stimatedsales" },
        //     // ],
        //     // "footerCallback": function (row, data, start, end, display) {
        //     //     var pageTotal;
        //     //     var api = this.api();
        //     //     // Remove the formatting to get integer data for summation
        //     //     var intVal = function (i) {
        //     //         return typeof i === 'string' ?
        //     //             i.replace(/[\$,]/g, '') * 1 :
        //     //             typeof i === 'number' ?
        //     //                 i : 0;
        //     //     };
        //     //     // Total over all pages at column 3
        //     //     pageTotal = api
        //     //         .column(3, { page: 'current' })
        //     //         .data()
        //     //         .reduce(function (a, b) {
        //     //             return intVal(a) + intVal(b);
        //     //         }, 0);
        //     //     // Update footer
        //     //     // $( api.column( 3 ).footer() ).html(
        //     //     //     pageTotal
        //     //     // );
        //     // },
        //     // "pageLength": window.settings.datatable_item_limit,
        //     // "buttons": [
        //     //     // { extend: 'create', editor: editor }, // Agrega botón de creación
        //     //     // { extend: 'edit', editor: editor },   // Agrega botón de edición
        //     //     // { extend: 'remove', editor: editor }, // Agrega botón de eliminación
        //     //     // Agrega más botones según tus necesidades
        //     //     {
        //     //         extend: "print", footer: 'true',
        //     //         text: "<i class=\"fa fa-print\"></i>",
        //     //         titleAttr: "Print",
        //     //         title: "College List",
        //     //         customize: function (win) {
        //     //             $(win.document.body)
        //     //                 .css('font-size', '10pt')
        //     //                 .append(
        //     //                     '<div><b><i>Powered by: ControlDas.com</i></b></div>'
        //     //                 )
        //     //                 .prepend(
        //     //                     '<div class="dt-print-heading"><img class="logo" src="' + window.logo + '"/><h2 class="title">' + window.store.name + '</h2><p>Printed on: ' + window.formatDate(new Date()) + '</p></div>'
        //     //                 );

        //     //             $(win.document.body).find('table')
        //     //                 .addClass('compact')
        //     //                 .css('font-size', 'inherit');
        //     //         },
        //     //         exportOptions: {
        //     //             columns: [0, 1, 2, 3]
        //     //         }
        //     //     },
        //     //     {
        //     //         extend: "copyHtml5",
        //     //         text: "<i class=\"fa fa-files-o\"></i>",
        //     //         titleAttr: "Copy",
        //     //         title: window.store.name + " > College List",
        //     //         exportOptions: {
        //     //             columns: [0, 1, 2, 3]
        //     //         }
        //     //     },
        //     //     {
        //     //         extend: "excelHtml5",
        //     //         text: "<i class=\"fa fa-file-excel-o\"></i>",
        //     //         titleAttr: "Excel",
        //     //         title: window.store.name + " > College List",
        //     //         exportOptions: {
        //     //             columns: [0, 1, 2, 3]
        //     //         }
        //     //     },
        //     //     {
        //     //         extend: "csvHtml5",
        //     //         text: "<i class=\"fa fa-file-text-o\"></i>",
        //     //         titleAttr: "CSV",
        //     //         title: window.store.name + " > College List",
        //     //         exportOptions: {
        //     //             columns: [0, 1, 2, 3]
        //     //         }
        //     //     },
        //     //     {
        //     //         extend: "pdfHtml5",
        //     //         text: "<i class=\"fa fa-file-pdf-o\"></i>",
        //     //         titleAttr: "PDF",
        //     //         download: "open",
        //     //         title: window.store.name + " > College List",
        //     //         exportOptions: {
        //     //             columns: [0, 1, 2, 3]
        //     //         },
        //     //         customize: function (doc) {
        //     //             doc.content[1].table.widths = Array(doc.content[1].table.body[0].length + 1).join('*').split('');
        //     //             doc.pageMargins = [10, 10, 10, 10];
        //     //             doc.defaultStyle.fontSize = 8;
        //     //             doc.styles.tableHeader.fontSize = 8; doc.styles.tableHeader.alignment = "left";
        //     //             doc.styles.title.fontSize = 10;
        //     //             // Remove spaces around page title
        //     //             doc.content[0].text = doc.content[0].text.trim();
        //     //             // Header
        //     //             doc.content.splice(1, 0, {
        //     //                 margin: [0, 0, 0, 12],
        //     //                 alignment: 'center',
        //     //                 fontSize: 8,
        //     //                 text: 'Printed on: ' + window.formatDate(new Date()),
        //     //             });
        //     //             // Create a footer
        //     //             doc['footer'] = (function (page, pages) {
        //     //                 return {
        //     //                     columns: [
        //     //                         'Powered by ControlDas.com',
        //     //                         {
        //     //                             // This is the right column
        //     //                             alignment: 'right',
        //     //                             text: ['page ', { text: page.toString() }, ' of ', { text: pages.toString() }]
        //     //                         }
        //     //                     ],
        //     //                     margin: [10, 0]
        //     //                 };
        //     //             });
        //     //             // Styling the table: create style object
        //     //             var objLayout = {};
        //     //             // Horizontal line thickness
        //     //             objLayout['hLineWidth'] = function (i) { return 0.5; };
        //     //             // Vertikal line thickness
        //     //             objLayout['vLineWidth'] = function (i) { return 0.5; };
        //     //             // Horizontal line color
        //     //             objLayout['hLineColor'] = function (i) { return '#aaa'; };
        //     //             // Vertical line color
        //     //             objLayout['vLineColor'] = function (i) { return '#aaa'; };
        //     //             // Left padding of the cell
        //     //             objLayout['paddingLeft'] = function (i) { return 4; };
        //     //             // Right padding of the cell
        //     //             objLayout['paddingRight'] = function (i) { return 4; };
        //     //             // Inject the object in the document
        //     //             doc.content[1].layout = objLayout;
        //     //         }
        //     //     }
        //     // ],
        // });

        // Activate an inline edit on click of a table cell
        // dt2.on('click', 'tbody td:not(:first-child)', function (e) {
        //     editor.inline(this);
        // });
        // dt2.on('click', 'tbody td:not(:first-child)', function (e) {
        //     editor.inline(this);
        // });
        // dt2.on('click', 'tbody td', function () {
        //     var cell = dt2.cell(this); // Obtiene la celda seleccionada
        //     var columnIndex = cell.index().column; // Obtiene el índice de la columna
        //     var rowData = cell.data(); // Obtiene los datos de la fila

        //     // Aquí puedes implementar la lógica de edición según tus necesidades
        //     // Por ejemplo, abrir un modal de edición o reemplazar la celda por un campo de entrada

        //     console.log('Celda seleccionada:', cell);
        //     console.log('Índice de columna:', columnIndex);
        //     console.log('Datos de fila:', rowData);
        //   });

        //================
        // End datatable
        //================

        // Crear nuevo Colegio
        $(document).delegate("#create-college-submit", "click", function (e) {
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
                then(function (response) {

                    $("#reset").trigger("click");
                    $btn.button("reset");
                    $(":input[type=\"button\"]").prop("disabled", false);
                    var alertMsg = response.data.msg;
                    window.toastr.success(alertMsg, "ÉXITO!");

                    supId = response.data.id;

                    dt.DataTable().ajax.reload(function (json) {
                        if ($("#row_" + supId).length) {
                            $("#row_" + supId).flash("yellow", 5000);
                        }
                    }, false);

                }, function (response) {

                    $btn.button("reset");
                    $(":input[type=\"button\"]").prop("disabled", false);
                    var alertMsg = "<div>";
                    window.angular.forEach(response.data, function (value) {
                        alertMsg += "<p>" + value + ".</p>";
                    });
                    alertMsg += "</div>";
                    window.toastr.warning(alertMsg, "ADVERTENCIA!");
                });
        });

        // Edit college
        $(document).delegate("#edit-college", "click", function (e) {
            e.stopPropagation();
            e.preventDefault();

            var d = dt.DataTable().row($(this).closest("tr")).data();

            CollegeEditModal(d);
        });

        // Delete college
        $(document).delegate("#delete-college", "click", function (e) {
            e.stopPropagation();
            e.preventDefault();
            var datatable = dt;
            var d = datatable.DataTable().row($(this).closest("tr")).data();

            CollegeDeleteModal(d);
        });

        // Oopen edit modal dialog box by query string
        if (window.getParameterByName("college_id") && window.getParameterByName("college_name")) {
            supId = window.getParameterByName("college_id");
            var supName = window.getParameterByName("college_name");
            dt.DataTable().search(supName).draw();
            dt.DataTable().ajax.reload(function (json) {
                $.each(json.data, function (index, obj) {
                    if (obj.DT_RowId === "row_" + supId) {
                        CollegeEditModal({ college_id: supId, college_name: obj.college_name });
                        return false;
                    }
                });
            }, false);
        }

        // Reset form
        $(document).delegate("#reset", "click", function (e) {
            e.preventDefault();
            quantity = 0;
            $("#product-table tbody").empty();
            $("#college_name").val('');
            // $("#code_name").val('');
        });


        // Append email button into datatable buttons
        if (window.sendReportEmail) { $(".dt-buttons").append("<button id=\"email-btn\" class=\"btn btn-default buttons-email\" tabindex=\"0\" aria-controls=\"invoice-invoice-list\" type=\"button\" title=\"Email\"><span><i class=\"fa fa-envelope\"></i></span></button>"); };

        // Send college list through email
        $("#email-btn").on("click", function (e) {
            e.stopPropagation();
            e.preventDefault();
            dt.find("thead th:nth-child(5), thead th:nth-child(6), thead th:nth-child(7), tbody td:nth-child(5), tbody td:nth-child(6), tbody td:nth-child(7), tfoot th:nth-child(5), tfoot th:nth-child(6), tfoot th:nth-child(7), tfoot th:nth-child(10)").addClass("hide-in-mail");
            var thehtml = dt.html();
            EmailModal({ template: "default", subject: "College List", title: "College List", html: thehtml });
        });

    }]);