module OrdersHelper
  def render_order_paid_state(order)
    order.is_paid? ? '已付款' : '未付款'
  end
end
