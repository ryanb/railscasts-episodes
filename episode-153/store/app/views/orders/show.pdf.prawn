pdf.text "Order ##{@order.id}", :size => 30, :style => :bold

pdf.move_down(30)

items = @order.cart.line_items.map do |item|
  [
    item.product.name,
    item.quantity,
    number_to_currency(item.unit_price),
    number_to_currency(item.full_price)
  ]
end

pdf.table items, :border_style => :grid,
  :row_colors => ["FFFFFF","DDDDDD"],
  :headers => ["Product", "Qty", "Unit Price", "Full Price"],
  :align => { 0 => :left, 1 => :right, 2 => :right, 3 => :right }

pdf.move_down(10)

pdf.text "Total Price: #{number_to_currency(@order.cart.total_price)}", :size => 16, :style => :bold