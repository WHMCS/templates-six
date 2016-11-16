<?php

# Logo
if (file_exists(ROOTDIR.'/assets/img/logo.png')) $pdf->Image(ROOTDIR.'/assets/img/logo.png', 20, 25, 75);
elseif (file_exists(ROOTDIR.'/assets/img/logo.jpg')) $pdf->Image(ROOTDIR.'/assets/img/logo.jpg', 20, 25, 75);
else $pdf->Image(ROOTDIR.'/assets/img/placeholder.png', 20, 25, 75);

# Company Details
$pdf->SetFont($pdfFont,'',13);
$pdf->Cell(0,6,trim($companyaddress[0]),0,1,'R');
$pdf->SetFont($pdfFont,'',9);
for ( $i = 1; $i <= ((count($companyaddress)>6) ? count($companyaddress) : 6); $i += 1) {
    $pdf->Cell(0,4,trim($companyaddress[$i]),0,1,'R');
}
$pdf->Ln(5);

$pdf->SetFont($pdfFont,'B',10);

$tblhtml = "
<table width=\"100%\" bgcolor=\"#ccc\" cellspacing=\"1\" cellpadding=\"2\" border=\"0\">
    <tr height=\"30\" bgcolor=\"#efefef\" style=\"font-weight:bold;text-align:center;\">
        <td>{$_LANG['quotenumber']}</td>
        <td>{$_LANG['quotesubject']}</td>
        <td>{$_LANG['quotedatecreated']}</td>
        <td>{$_LANG['quotevaliduntil']}</td>
    </tr>
    <tr bgcolor=\"#fff\">
        <td align=\"center\">{$quotenumber}</td>
        <td align=\"left\">{$subject}</td>
        <td align=\"center\">{$datecreated}</td>
        <td align=\"center\">{$validuntil}</td>
    </tr>
</table>";
$pdf->writeHTML($tblhtml, true, false, false, false, '');

$pdf->Ln(10);

$pdf->SetFont($pdfFont,'B',10);
$pdf->Cell(0,4,$_LANG['quoterecipient'],0,1);
$pdf->SetFont($pdfFont,'',9);
if ($clientsdetails["companyname"]) {
    $pdf->Cell(0,4,$clientsdetails["companyname"],0,1,'L');
    $pdf->Cell(0,4,$_LANG["invoicesattn"].": ".$clientsdetails["firstname"]." ".$clientsdetails["lastname"],0,1,'L');
} else {
    $pdf->Cell(0,4,$clientsdetails["firstname"]." ".$clientsdetails["lastname"],0,1,'L');
}
$pdf->Cell(0,4,$clientsdetails["address1"],0,1,'L');
if ($clientsdetails["address2"]) {
    $pdf->Cell(0,4,$clientsdetails["address2"],0,1,'L');
}
$pdf->Cell(0,4,$clientsdetails["city"].', '.$clientsdetails["state"].', '.$clientsdetails["postcode"],0,1,'L');
$pdf->Cell(0,4,$clientsdetails["country"],0,1,'L');

$pdf->Ln(10);

if ($proposal) {
    $pdf->SetFont($pdfFont,'',9);
    $pdf->MultiCell(170,5,$proposal);
    $pdf->Ln(10);
}

$pdf->SetDrawColor(200);
$pdf->SetFillColor(239);

$pdf->SetFont($pdfFont,'',8);

$tblhtml = '<table width="100%" bgcolor="#ccc" cellspacing="1" cellpadding="2" border="0">
    <tr height="30" bgcolor="#efefef" style="font-weight:bold;text-align:center;">
        <td width="5%">'.$_LANG['quoteqty'].'</td>
        <td width="45%">'.$_LANG['quotedesc'].'</td>
        <td width="15%">'.$_LANG['quoteunitprice'].'</td>
        <td width="15%">'.$_LANG['quotediscount'].'</td>
        <td width="20%">'.$_LANG['quotelinetotal'].'</td>
    </tr>';
foreach ($lineitems AS $item) {
    $tblhtml .= '
    <tr bgcolor="#fff">
        <td align="center">'.$item['qty'].'</td>
        <td align="left">'.nl2br($item['description']).'<br /></td>
        <td align="center">'.$item['unitprice'].'</td>
        <td align="center">'.$item['discount'].'</td>
        <td align="center">'.$item['total'].'</td>
    </tr>';
}
$tblhtml .= '
    <tr height="30" bgcolor="#efefef" style="font-weight:bold;">
        <td align="right" colspan="4">'.$_LANG['invoicessubtotal'].'</td>
        <td align="center">'.$subtotal.'</td>
    </tr>';
if ($taxlevel1['rate']>0) $tblhtml .= '
    <tr height="30" bgcolor="#efefef" style="font-weight:bold;">
        <td align="right" colspan="4">'.$taxlevel1['name'].' @ '.$taxlevel1['rate'].'%</td>
        <td align="center">'.$tax1.'</td>
    </tr>';
if ($taxlevel2['rate']>0) $tblhtml .= '
    <tr height="30" bgcolor="#efefef" style="font-weight:bold;">
        <td align="right" colspan="4">'.$taxlevel2['name'].' @ '.$taxlevel2['rate'].'%</td>
        <td align="center">'.$tax2.'</td>
    </tr>';
$tblhtml .= '
    <tr height="30" bgcolor="#efefef" style="font-weight:bold;">
        <td align="right" colspan="4">'.$_LANG['invoicestotal'].'</td>
        <td align="center">'.$total.'</td>
    </tr>
</table>';

$pdf->writeHTML($tblhtml, true, false, false, false, '');

if ($notes) {
    $pdf->Ln(6);
    $pdf->SetFont($pdfFont,'',8);
    $pdf->MultiCell(170,5,$_LANG['invoicesnotes'].": $notes");
}
