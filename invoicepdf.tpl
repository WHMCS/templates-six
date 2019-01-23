<?php

include_once ROOTDIR."/modules/addons/clean_pdf/options.php";

$invoicepdf_override = ROOTDIR."/modules/addons/clean_pdf/templates/overrides/invoicepdf.php";
if (file_exists($invoicepdf_override)){
		include ROOTDIR."/modules/addons/clean_pdf/templates/overrides/invoicepdf.php";
}else{
	if (Lang::trans('locale') != 'ar_AR' && Lang::trans('locale') != 'he_IL' && Lang::trans('locale') != 'fa_IR'){
		include ROOTDIR."/modules/addons/clean_pdf/templates/invoicepdf.php";
	}else{
		include ROOTDIR."/modules/addons/clean_pdf/templates/invoicepdf_rtl.php";
	}
}
