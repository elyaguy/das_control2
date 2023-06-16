const mix = require('laravel-mix');

// // Main CSS
// mix.styles([

//     // Plugins
//     'assets/bootstrap/css/bootstrap.css',
//     'assets/jquery-ui/jquery-ui.min.css',
//     'assets/font-awesome/css/font-awesome.css',
//     'assets/morris/morris.css',
//     'assets/select2/select2.min.css',
//     'assets/datepicker/datepicker3.css',
//     'assets/timepicker/bootstrap-timepicker.css',
//     'assets/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css',
//     'assets/perfectScroll/css/perfect-scrollbar.css',
//     'assets/toastr/toastr.min.css',

//     // Filemanager
//     'assets/das/css/filemanager/dialogs.css',
//     'assets/das/css/filemanager/main.css',

//     // Theme
//     'assets/das/css/theme.css',
//     'assets/das/css/skins/skin-black.css',
//     'assets/das/css/skins/skin-blue.css',
//     'assets/das/css/skins/skin-green.css',
//     'assets/das/css/skins/skin-red.css',
//     'assets/das/css/skins/skin-purple.css',
//     'assets/das/css/skins/skin-yellow.css',

//     // DataTable
//     'assets/DataTables/datatables.min.css',

//     // Main CSS
//     'assets/das/css/main.css',

//     // Responsive CSS
//     'assets/das/css/responsive.css',

//     // Barcode CSS
//     // 'assets/das/css/barcode.css',

//     // Print CSS
//     'assets/das/css/print.css',

// ],'assets/das/cssmin/main.css');



// // POS CSS
// mix.styles([

//     'assets/bootstrap/css/bootstrap.css',
//     'assets/jquery-ui/jquery-ui.min.css',
//     'assets/font-awesome/css/font-awesome.css',
//     'assets/datepicker/datepicker3.css',
//     'assets/timepicker/bootstrap-timepicker.min.css',
//     'assets/perfectScroll/css/perfect-scrollbar.css',
//     'assets/select2/select2.min.css',
//     'assets/toastr/toastr.min.css',
//     'assets/contextMenu/dist/jquery.contextMenu.min.css',

//     // Filemanager
//     'assets/das/css/filemanager/dialogs.css',
//     'assets/das/css/filemanager/main.css',

//     // Theme
//     'assets/das/css/theme.css',
//     'assets/das/css/skins/skin-black.css',
//     'assets/das/css/skins/skin-blue.css',
//     'assets/das/css/skins/skin-green.css',
//     'assets/das/css/skins/skin-red.css',
//     'assets/das/css/skins/skin-yellow.css',
//     'assets/das/css/main.css',

//     // Main
//     'assets/das/css/pos/skeleton.css',
//     'assets/das/css/pos/pos.css',
//     'assets/das/css/pos/responsive.css',

// ],'assets/das/cssmin/pos.css');



// // LOGIN CSS
// mix.styles([

//     'assets/bootstrap/css/bootstrap.css',
//     'assets/perfectScroll/css/perfect-scrollbar.css',
//     'assets/toastr/toastr.min.css',
//     'assets/das/css/theme.css',
//     'assets/das/css/login.css',

// ],'assets/das/cssmin/login.css');



// Angular JS
mix.scripts([

    'assets/das/angular/lib/angular/angular.min.js',
    'assets/das/angular/lib/angular/angular-sanitize.js',
    'assets/das/angular/lib/angular/angular-bind-html-compile.min.js',
    'assets/das/angular/lib/angular/ui-bootstrap-tpls-2.5.0.min.js',
    'assets/das/angular/lib/angular/angular-route.min.js',
    'assets/das/angular/lib/angular-translate/dist/angular-translate.min.js',
    'assets/das/angular/lib/ng-file-upload/dist/ng-file-upload.min.js',
    'assets/das/angular/lib/angular-local-storage.min.js',
    'assets/das/angular/angularApp.js',
    
],'assets/das/angularmin/angular.js');

// Angular Filemanager JS
mix.scripts([

    'assets/das/angular/filemanager/js/directives/directives.js',
    'assets/das/angular/filemanager/js/filters/filters.js',
    'assets/das/angular/filemanager/js/providers/config.js',
    'assets/das/angular/filemanager/js/entities/chmod.js',
    'assets/das/angular/filemanager/js/entities/item.js',
    'assets/das/angular/filemanager/js/services/apihandler.js',
    'assets/das/angular/filemanager/js/services/apimiddleware.js',
    'assets/das/angular/filemanager/js/services/filenavigator.js',
    'assets/das/angular/filemanager/js/providers/translations.js',
    'assets/das/angular/filemanager/js/controllers/main.js',
    'assets/das/angular/filemanager/js/controllers/selector-controller.js',

],'assets/das/angularmin/filemanager.js');



// Angular Modal JS
mix.scripts([

    'assets/das/angular/modals/InvoiceViewModal.js',
    'assets/das/angular/modals/InvoiceInfoEditModal.js',
    'assets/das/angular/modals/BoxCreateModal.js',
    'assets/das/angular/modals/BoxDeleteModal.js',
    'assets/das/angular/modals/BoxEditModal.js',
    'assets/das/angular/modals/UnitCreateModal.js',
    'assets/das/angular/modals/UnitDeleteModal.js',
    'assets/das/angular/modals/UnitEditModal.js',
    'assets/das/angular/modals/TaxrateCreateModal.js',
    'assets/das/angular/modals/TaxrateDeleteModal.js',
    'assets/das/angular/modals/TaxrateEditModal.js',
    'assets/das/angular/modals/CategoryCreateModal.js',
    'assets/das/angular/modals/CategoryDeleteModal.js',
    'assets/das/angular/modals/CategoryEditModal.js',
    'assets/das/angular/modals/CurrencyEditModal.js',
    'assets/das/angular/modals/CustomerCreateModal.js',
    'assets/das/angular/modals/CustomerDeleteModal.js',
    'assets/das/angular/modals/CustomerEditModal.js',
    'assets/das/angular/modals/SupportDeskModal.js',
    'assets/das/angular/modals/DueCollectionDetailsModal.js',
    'assets/das/angular/modals/BankingDepositModal.js',
    'assets/das/angular/modals/BankingRowViewModal.js',
    'assets/das/angular/modals/BankingWithdrawModal.js',
    'assets/das/angular/modals/BankAccountCreateModal.js',
    'assets/das/angular/modals/BankAccountDeleteModal.js',
    'assets/das/angular/modals/BankAccountEditModal.js',
    'assets/das/angular/modals/BankTransferModal.js',
    'assets/das/angular/modals/EmailModal.js',
    'assets/das/angular/modals/KeyboardShortcutModal.js',
    'assets/das/angular/modals/PmethodDeleteModal.js',
    'assets/das/angular/modals/PmethodEditModal.js',
    'assets/das/angular/modals/PayNowModal.js',
    'assets/das/angular/modals/POSFilemanagerModal.js',
    'assets/das/angular/modals/POSReceiptTemplateEditModal.js',
    'assets/das/angular/modals/PrinterDeleteModal.js',
    'assets/das/angular/modals/PrinterEditModal.js',
    'assets/das/angular/modals/PrintReceiptModal.js',
    'assets/das/angular/modals/ProductCreateModal.js',
    'assets/das/angular/modals/ProductDeleteModal.js',
    'assets/das/angular/modals/ProductEditModal.js',
    'assets/das/angular/modals/ProductReturnModal.js',
    'assets/das/angular/modals/ProductViewModal.js',
    'assets/das/angular/modals/StoreDeleteModal.js',
    'assets/das/angular/modals/SupplierCreateModal.js',
    'assets/das/angular/modals/SupplierDeleteModal.js',
    'assets/das/angular/modals/SupplierEditModal.js',
    'assets/das/angular/modals/BrandCreateModal.js',
    'assets/das/angular/modals/BrandDeleteModal.js',
    'assets/das/angular/modals/BrandEditModal.js',
    'assets/das/angular/modals/CourseCreateModal.js',
    'assets/das/angular/modals/CourseDeleteModal.js',
    'assets/das/angular/modals/CourseEditModal.js',
    'assets/das/angular/modals/UserCreateModal.js',
    'assets/das/angular/modals/UserDeleteModal.js',
    'assets/das/angular/modals/UserEditModal.js',
    'assets/das/angular/modals/UserGroupCreateModal.js',
    'assets/das/angular/modals/UserGroupDeleteModal.js',
    'assets/das/angular/modals/UserGroupEditModal.js',
    'assets/das/angular/modals/UserInvoiceDetailsModal.js',
    'assets/das/angular/modals/GiftcardCreateModal.js',
    'assets/das/angular/modals/GiftcardEditModal.js',
    'assets/das/angular/modals/GiftcardViewModal.js',
    'assets/das/angular/modals/GiftcardTopupModal.js',
    'assets/das/angular/modals/InvoiceSMSModal.js',
    'assets/das/angular/modals/PaymentFormModal.js',
    'assets/das/angular/modals/PaymentOnlyModal.js',
    'assets/das/angular/modals/PurchaseInvoiceViewModal.js',
    'assets/das/angular/modals/PurchaseInvoiceInfoEditModal.js',
    'assets/das/angular/modals/PurchasePaymentModal.js',
    'assets/das/angular/modals/SellReturnModal.js',
    'assets/das/angular/modals/PurchaseReturnModal.js',
    'assets/das/angular/modals/ExpenseSummaryModal.js',
    'assets/das/angular/modals/SummaryReportModal.js',
    
],'assets/das/angularmin/modal.js');



// Main JS
mix.scripts([

    'assets/jquery/jquery.min.js',
    'assets/jquery-ui/jquery-ui.min.js',
    'assets/bootstrap/js/bootstrap.min.js',
    'assets/chartjs/Chart.min.js',
    'assets/sparkline/jquery.sparkline.min.js',
    'assets/datepicker/bootstrap-datepicker.js',
    'assets/timepicker/bootstrap-timepicker.min.js',
    'assets/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js',
    'assets/select2/select2.min.js',
    'assets/perfectScroll/js/perfect-scrollbar.jquery.min.js',
    'assets/sweetalert/sweetalert.min.js',
    'assets/toastr/toastr.min.js',
    'assets/accounting/accounting.min.js',
    'assets/underscore/underscore.min.js',
    'assets/das/js/ie.js',
    'assets/das/js/theme.js',
    'assets/das/js/common.js',
    'assets/das/js/main.js',
    'assets/DataTables/datatables.min.js',
    'assets/das/angularmin/angular.js',
    'assets/das/angularmin/modal.js',
    'assets/das/angularmin/filemanager.js',

],'assets/das/jsmin/main.js');



// POS JS
mix.scripts([

    'assets/jquery/jquery.min.js',
    'assets/jquery-ui/jquery-ui.min.js',
    'assets/bootstrap/js/bootstrap.min.js',
    'assets/das/angularmin/angular.js',
    'assets/das/angular/angularApp.js',
    'assets/das/angularmin/filemanager.js',
    'assets/das/angularmin/modal.js',

    'assets/datepicker/bootstrap-datepicker.js',
    'assets/timepicker/bootstrap-timepicker.min.js',
    'assets/select2/select2.min.js',
    'assets/perfectScroll/js/perfect-scrollbar.jquery.min.js',
    'assets/sweetalert/sweetalert.min.js',
    'assets/toastr/toastr.min.js',
    'assets/accounting/accounting.min.js',
    'assets/underscore/underscore.min.js',
    'assets/contextMenu/dist/jquery.contextMenu.min.js',
    'assets/das/js/ie.js',

    'assets/das/js/common.js',
    'assets/das/js/main.js',
    'assets/das/js/pos/pos.js',

],'assets/das/jsmin/pos.js');


// LOGIN JS
mix.scripts([

    'assets/jquery/jquery.min.js',
    'assets/bootstrap/js/bootstrap.min.js',
    'assets/perfectScroll/js/perfect-scrollbar.jquery.min.js',
    'assets/toastr/toastr.min.js',
    'assets/das/js/forgot-password.js',
    'assets/das/js/common.js',
    'assets/das/js/login.js',

],'assets/das/jsmin/login.js');



// How to build assets
// npm run dev
// npm run production