<?php
define('INSTALLED', true);

$supportOk = false;
$dirOk = '';
$dir2Ok = '';
$sql_details2 = array(
	'host' => 'localhost',
	'db' => 'u872772425_das_control',
	'user' => 'u872772425_root',
	'pass' => 'ControlD@s2023.',
	'port' => '3306'
);

if ($supportOk) {
	$dirOk = 'das';
	$dirOk2 = 'das/';
	$sql_details2 = array(
		'host' => 'localhost',
		'db' => 'das_control',
		'user' => 'root',
		'pass' => '',
		'port' => '3306'
	);
}

$sql_details = $sql_details2;
//REMOTO
// $sql_details = array(
// 	'host' => 'srv689.hstgr.io',
// 	'db' => 'u872772425_das_control',
// 	'user' => 'u872772425_root',
// 	'pass' => 'ControlD@s2023.',
// 	'port' => '3306'
// );


/*
 * --------------------------------------------------------------------
 * GLOBAL CONSTANTS
 * --------------------------------------------------------------------
 */
define('FILE_READ_MODE', 0644);
define('FILE_WRITE_MODE', 0666);
define('DIR_READ_MODE', 0755);
define('DIR_WRITE_MODE', 0755);

define('ROOT', __DIR__);
define('ADMINDIRNAME', 'admin');
define('DIR_INCLUDE', ROOT . '/_inc/');
define('DIR_LIBRARY', DIR_INCLUDE . '/lib/');
define('DIR_MODEL', DIR_INCLUDE . '/model/');
define('DIR_VENDOR', DIR_INCLUDE . '/vendor/');
define('DIR_ADMIN', ROOT . '/' . ADMINDIRNAME . '/');
define('DIR_HELPER', ROOT . '/_inc/helper/');
define('DIR_LANGUAGE', ROOT . '/language/');
define('DIR_STORAGE', ROOT . '/storage/');
define('DIR_ASSET', ROOT . '/assets/');
define('DIR_EMAIL_TEMPLATE', DIR_INCLUDE . 'template/email/');
define('DIR_BACKUP', DIR_STORAGE . 'backups/');
define('DIR_LOG', DIR_STORAGE . 'logs/');


/*
 * --------------------------------------------------------------------
 * OFFLINE-ONLINE SYNCHRONIZATION
 * --------------------------------------------------------------------
 *
 * Toggling Offline Online Synchronization
 *
 */
define('SYNCHRONIZATION', false);
define('SYNCSERVERURL', '');


/*
 * --------------------------------------------------------------------
 * SUB-DIRECTORY
 * --------------------------------------------------------------------
 *
 * This is usefull when you will host the app inside a subdirectory of root
 */
define('SUBDIRECTORY', $dirOk);
// define('SUBDIRECTORY', '');


/*
 * --------------------------------------------------------------------
 * FILEMANAGER PATH
 * --------------------------------------------------------------------
 *
 * If you use FTP for filemanger then just left it as blank
 */
define('FILEMANAGERPATH', ROOT . '/storage/products/');


/*
 * --------------------------------------------------------------------
 * FILEMANAGER URL
 * --------------------------------------------------------------------
 *
 * If you use FTP for filemanger then just left it as blank
 * Example: http://modernpos/storage directory
 */
define('FILEMANAGERURL', 'http://localhost/' . $dir2Ok . 'storage/products');
// define('FILEMANAGERURL', 'http://localhost/storage/products');


/*
 * --------------------------------------------------------------------
 * ENABLE/DISABLE HOOKING SYSTEM
 * --------------------------------------------------------------------
 */
define('HOOK', 0);


/*
 * --------------------------------------------------------------------
 * ENABLE/DISABLE LOGGING SYSTEM
 * 
 * to work properly set HOOK as 1
 * --------------------------------------------------------------------
 */
define('LOG', 0);


/*
 * ----------------------------------------------------------------------------
 * SUSPEND USER ACCOUNT FOR A SPECIFIC DURATION, IF LOGIN ATTEMPTS WERE FAILED
 *-----------------------------------------------------------------------------
 */
define('TOTAL_LOGIN_TRY', 10);

/*
 * --------------------------------------------------------------------
 * IF ACCOUNT IS LOCKED, UNLOCK AFTER THE SPECIFIED TIME (MINUTES)
 *---------------------------------------------------------------------
 */
define('UNLOCK_ACCOUNT_AFTER', 10);

/*
 * --------------------------------------------------------------------
 * INSTALLMENT SELLING
 * --------------------------------------------------------------------
 *
 */
define('INSTALLMENT', true);


/*
 * --------------------------------------------------------------------
 * ALLOWED THESE IPs ONLY, IF EMPTY THEN ALLOWES ALL IPs
 * --------------------------------------------------------------------
 */
define('DENIED_IPS', array());


/*
 * --------------------------------------------------------------------
 * DENIED THESE IPs TO  ACCESS THE SYSTEM
 * --------------------------------------------------------------------
 */
define('ALLOWED_ONLY_IPS', array());


/*
 * --------------------------------------------------------------------
 * INVOICE PREFIXES
 * --------------------------------------------------------------------
 */
$invoice_init_prefix = array(
	'purchase' => 'C',
	'due_paid' => 'P',
	'expense' => 'G',
	'withdraw' => 'R',
	'deposit' => 'D',
);

// $invoice_init_prefix = array(
// 	'compra' => 'B',
// 	'debido_pagado' => 'F',
// 	'gastos' => 'E',
// 	'retirar' => 'W',
// 	'depósito' => 'E',
// );

/*
 * --------------------------------------------------------------------
 * ENABLE/DISABLE DEMO
 * --------------------------------------------------------------------
 *
 * DEMO should always be set to false for production
 * To restrict the instillation as demo set DEMO to true
 */
define('DEMO', false);


/*
 * --------------------------------------------------------------------
 * USE COMPILED ASSETS
 * --------------------------------------------------------------------
 *
 * If true then system will use compileted assets, i.e. minified/combined js, css and images
 */
define('USECOMPILEDASSET', true);

/*
 * --------------------------------------------------------------------
 * Right to Left (RTL) Toggling
 * --------------------------------------------------------------------
 *
 * If true then system will use compileted assets, i.e. minified/combined js, css and images
 */
define('RTL', 0);