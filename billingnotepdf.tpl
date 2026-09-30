<?php

# Logo
$logoFilename = 'placeholder.png';
if (file_exists(ROOTDIR . '/assets/img/logo.png')) {
    $logoFilename = 'logo.png';
} elseif (file_exists(ROOTDIR . '/assets/img/logo.jpg')) {
    $logoFilename = 'logo.jpg';
} elseif (file_exists(ROOTDIR . '/assets/img/logo.jpeg')) {
    $logoFilename = 'logo.jpeg';
}
$pdf->Image(ROOTDIR . '/assets/img/' . $logoFilename, 15, 25, 75);

# Billing Note Status
$pdf->SetXY(0, 0);
$pdf->SetFont($pdfFont, 'B', 28);
$pdf->SetTextColor(255);
$pdf->SetLineWidth(0.75);
$pdf->StartTransform();
$pdf->Rotate(-35, 100, 225);
switch ($billingNote->billingNote->status->value) {
    case 'closed':
        $pdf->SetFillColor(200);
        $pdf->SetDrawColor(140);
        break;
    case 'issued':
        $pdf->SetFillColor(151, 223, 74);
        $pdf->SetDrawColor(110, 192, 70);
        break;
    default:
        $pdf->SetFillColor(223, 85, 74);
        $pdf->SetDrawColor(171, 49, 43);
        break;
}

$pdf->Cell(100, 18, strtoupper($billingNote->billingNote->status->trans()), 'TB', 0, 'C', '1');
$pdf->StopTransform();
$pdf->SetTextColor(0);

# Company Details
$pdf->SetXY(15, 42);
$pdf->SetFont($pdfFont, '', 13);

foreach ($companyaddress as $addressLine) {
    $pdf->Cell(180, 4, trim($addressLine), 0, 1, 'R');
    $pdf->SetFont($pdfFont, '', 9);
}
if (!empty($taxCode)) {
    $pdf->Cell(180, 4, $taxIdLabel . ': ' . trim($taxCode), 0, 1, 'R');
}
$pdf->Ln(5);

# Header Bar

/**
 * Billing Note Header
 * You can optionally define a header/footer in a way that is repeated across page breaks.
 * For more information, see https://go.whmcs.com/2361/pdf-invoices#header-and-footer
 */

$pdf->SetFont($pdfFont, 'B', 15);
$pdf->SetFillColor(239);
$pdf->Cell(0, 8, $pagetitle, 0, 1, 'L', '1');
$pdf->SetFont($pdfFont, '', 10);
$pdf->Cell(0, 6, Lang::trans('billing.issuedate') . ': ' . $dateIssued, 0, 1, 'L', '1');
$pdf->Ln(10);

$startpage = $pdf->GetPage();

# Clients Details
$addressypos = $pdf->GetY();
$pdf->SetFont($pdfFont, 'B', 10);
$pdf->Cell(0, 4, Lang::trans('invoicesinvoicedto'), 0, 1);
$pdf->SetFont($pdfFont, '', 9);
if (!empty($clientsdetails["companyname"])) {
    $pdf->Cell(0, 4, $clientsdetails["companyname"], 0, 1, 'L');
    $pdf->Cell(0, 4, Lang::trans('invoicesattn') . ': ' . $clientsdetails["firstname"] . ' ' . $clientsdetails["lastname"], 0, 1, 'L');
} else {
    $pdf->Cell(0, 4, $clientsdetails["firstname"] . " " . $clientsdetails["lastname"], 0, 1, 'L');
}
$pdf->Cell(0, 4, $clientsdetails["address1"], 0, 1, 'L');
if (!empty($clientsdetails["address2"])) {
    $pdf->Cell(0, 4, $clientsdetails["address2"], 0, 1, 'L');
}
$pdf->Cell(0, 4, $clientsdetails["city"] . ", " . $clientsdetails["state"] . ", " . $clientsdetails["postcode"], 0, 1, 'L');
$pdf->Cell(0, 4, $clientsdetails["country"], 0, 1, 'L');
if (array_key_exists('tax_id', $clientsdetails) && $clientsdetails['tax_id']) {
    $pdf->Cell(0, 4, $taxIdLabel . ': ' . $clientsdetails['tax_id'], 0, 1, 'L');
}
if ($customfields) {
    $pdf->Ln();
    foreach ($customfields as $customfield) {
        $pdf->Cell(0, 4, $customfield['fieldname'] . ': ' . $customfield['value'], 0, 1, 'L');
    }
}
$pdf->Ln(10);

# BillingNote Items
$tblhtml = '<table width="100%" bgcolor="#ccc" cellspacing="1" cellpadding="2" border="0">
    <tr colspan="2"><td>'. $itemTableTitle .'</td></tr>
    <tr height="30" bgcolor="#efefef" style="font-weight:bold;text-align:center;">
        <td width="80%">' . Lang::trans('invoicesdescription') . '</td>
        <td width="20%">' . Lang::trans('quotelinetotal') . '</td>
    </tr>';

foreach ($billingNote->lineItems as $item) {
    $tblhtml .= '<tr bgcolor="#fff">
        <td align="left">' . nl2br($item->description) . '<br /></td>
        <td align="center">' . $item->amount . '</td>
    </tr>';
}

$tblhtml .= '
    <tr height="30" bgcolor="#efefef" style="font-weight:bold;">
        <td align="right">' . Lang::trans('invoicessubtotal') . '</td>
        <td align="center">' . $billingNote->subTotal . '</td>
    </tr>';
foreach ($billingNote->taxes as $tax) {
    $tblhtml .= '
        <tr height="30" bgcolor="#efefef" style="font-weight:bold;">
            <td align="right">' . $tax->rate . ' ' . $tax->name . '</td>
            <td align="center">' . $tax->price . '</td>
        </tr>';
}

$tblhtml .= '
    <tr height="30" bgcolor="#efefef" style="font-weight:bold;">
        <td align="right">' . Lang::trans('invoicestotal') . '</td>
        <td align="center">' . $billingNote->total . '</td>
    </tr>
</table>';

$pdf->writeHTML($tblhtml, true, false, false, false, '');

$pdf->Ln(5);

# Transactions
$pdf->SetFont($pdfFont, 'B', 12);
$pdf->Cell(0, 4, Lang::trans('billing.ledger.title'), 0, 1);

$pdf->Ln(5);

$pdf->SetFont($pdfFont, '', 9);

$tblhtml = '<table width="100%" bgcolor="#ccc" cellspacing="1" cellpadding="2" border="0">
    <tr height="30" bgcolor="#efefef" style="font-weight:bold;text-align:center;">
        <td width="15%">' . Lang::trans('billing.ledger.date') . '</td>
        <td width="30%">' . Lang::trans('billing.ledger.type') . '</td>
        <td width="35%">' . Lang::trans('billing.ledger.reference') . '</td>
        <td width="20%">' . Lang::trans('invoicestransamount') . '</td>
    </tr>';

if (!count($transactions)) {
    $tblhtml .= '
    <tr bgcolor="#fff">
        <td colspan="4" align="center">' . Lang::trans('invoicestransnonefound') . '</td>
    </tr>';
} else {
    foreach ($transactions AS $trans) {
        $reference = $trans->referenceId;

        if ($reference) {
            $maxLength = 36;
            if (strlen($reference) > $maxLength) {
                $ellipsis = '...';
                $half = floor(($maxLength - strlen($ellipsis)) / 2);
                $reference = substr($reference, 0, $half)
                    . $ellipsis
                    . substr($reference, -$half, $half);
            }
        }

        $reference = trim($reference);

        $tblhtml .= '
        <tr bgcolor="#fff">
            <td align="center">' . $trans->clientDate . '</td>
            <td align="center">' . $trans->typeLabel . '</td>
            <td align="center">' . $trans->referenceText . '</td>
            <td align="center">' . $trans->amount . '</td>
        </tr>';
    }
}
$tblhtml .= '
    <tr height="30" bgcolor="#efefef" style="font-weight:bold;">
        <td colspan="3" align="right">' . Lang::trans('invoicesbalance') . '</td>
        <td align="center">' . $billingNote->balance . '</td>
    </tr>
</table>';

$pdf->writeHTML($tblhtml, true, false, false, false, '');

# Generation Date
$pdf->SetFont($pdfFont, '', 8);
$pdf->Ln(5);
$pdf->Cell(180, 4, Lang::trans('invoicepdfgenerated') . ' ' . getTodaysDate(1), '', '', 'C');

# Billing Note footer
