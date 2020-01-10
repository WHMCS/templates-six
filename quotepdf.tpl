<?php

include_once ROOTDIR."/modules/addons/clean_pdf/options.php";

$quotepdf_override = ROOTDIR."/modules/addons/clean_pdf/templates/overrides/quotepdf.php";
if (file_exists($quotepdf_override)){
	include ROOTDIR."/modules/addons/clean_pdf/templates/overrides/quotepdf.php";
}else{
	if (Lang::trans('locale') != 'ar_AR' && Lang::trans('locale') != 'he_IL' && Lang::trans('locale') != 'fa_IR'){
	    include ROOTDIR."/modules/addons/clean_pdf/templates/quotepdf.php";
	}else{
	    include ROOTDIR."/modules/addons/clean_pdf/templates/quotepdf_rtl.php";
	}
}
