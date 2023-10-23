<div class="row">
	<div class="col-md-12">
		<div class="table-responsive">

			<h5>
				<!-- <?php echo trans('text_return_products') . ':'; ?> -->
				<?php echo $item_name; ?>
			</h4>

			<div class="table-responsive">
				<table class="table table-bordered table-condensed margin-b0">
					<thead>
						<tr class="bg-gray">
							<th class="w-60 text-center">
								<?php echo trans('label_date'); ?>
							</th>
							<th class="w-20 text-right">
								<?php echo trans('label_quantity'); ?>
							</th>
							<th class="w-20 text-right">
								<?php echo trans('label_total'); ?>
							</th>
						</tr>
					</thead>
					<tbody>
						<?php
						$subtotal = 0;
						$quantity = 0;
						foreach ($invoice_items as $product): ?>
							<tr>
								<td class="text-center">
								<?php echo $product['created_at']; ?>
								</td>
								<td class="text-right">
									<?php echo number_format($product['item_quantity']); ?>

									<?php $quantity += $product['item_quantity']; ?>
								</td>
								<td class="text-right">
									<?php echo currency_format($product['item_total']); ?>
									<?php $subtotal += $product['item_total']; ?>

								</td>
							</tr>
						<?php endforeach; ?>
					</tbody>
					<tfoot>
						<tr class="bg-gray">
							<td class="text-right" colspan="1">
								<?php echo trans('label_total'); ?>
							</td>
							<td class="w-20 text-right">
								<?php echo ($quantity); ?>
							</td>
							<td class="w-20 text-right">
								<?php echo get_currency_symbol() . '  '. currency_format($subtotal); ?>
							</td>
					</tfoot>
				</table>
			</div>
		</div>
	</div>
</div>