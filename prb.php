<div class="table-responsive footer-actions">
  <table class="table">
    <tbody>
      
      <tr class="text-center">
        <td colspan="2">
          <br>
          <p class="powered-by">
            <small>&copy; ITsolution24.com</small>
            <?php $invoice_id = generate_invoice_id('sell'); ?>
          </p>
        </td>
      </tr>
    </tbody>
  </table>
</div>


<?php

function generate_invoice_id($type = 'sell', $invoice_id = null)
{
    $store_id = 1;
    $prefix = '';//get_preference('sales_reference_prefix') ? get_preference('sales_reference_prefix').'/' : '';
    // $invoice_model = registry()->get('loader')->model('invoice');
    // if (!$invoice_id) {
        $last_invoice = 3;//$invoice_model->getLastInvoice($type);
        $invoice_id = 3;// isset($last_invoice['invoice_id']) ? $last_invoice['invoice_id'] : '1';
    // }
    // if ($invoice_model->hasInvoice($invoice_id)) {
    //     $invoice_id = str_replace(array('A','B','C','D','E','F','G','H','I','G','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'), '', $invoice_id);
    //     $sequence = (int)(substr($invoice_id,-8)) + 1;
    //     $temp_invoice_id = $sequence;
    //     $zero_length = 8 - strlen($temp_invoice_id);
    //     $zeros = '';
    //     for ($i=0; $i < $zero_length; $i++) { 
    //         $zeros .= '0';
    //     }
    //     $sequence = $zeros.$sequence;
    //     $sequence_format = get_reference_format($sequence);
    //     $invoice_id = $prefix.$store_id.$sequence_format;
    //     generate_invoice_id($type, $invoice_id);
    // } else {

        $format = get_preference('reference_format');
        return $format;
        $zero_length = 8 - strlen($invoice_id);
        $zeros = '';
        for ($i=0; $i < $zero_length; $i++) { 
            $zeros .= '0';
        }
        $sequence = $zeros.'1';
        $sequence_format = get_reference_format($sequence);
        $invoice_id = $prefix.$store_id.$sequence_format;
    // }
    return $invoice_id;
}

