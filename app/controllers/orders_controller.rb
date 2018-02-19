class OrdersController < ApplicationController
  def index
    # getting all the deliver orders
    @orders = DeliveryOrder.all
    orders = []

    # looping through all the orders to set the date, time and push into a new object
    @orders.each do |item|
      start_time = item.serving_datetime.strftime("%I:%M")
      end_time = (item.serving_datetime + 1800).strftime("%I:%M%p")
      delivery_time = "#{start_time}-#{end_time}"
      new_order = {
        order_id: item.order_id,
        delivery_date: item.serving_datetime.strftime("%F"),
        delivery_time: delivery_time
      }
      orders.push(new_order)
    end
    render json: orders
  end



  def show
    # find one deliver order and show all order items for it
    @order = DeliveryOrder.find(params[:id])
    start_time = @order.serving_datetime.strftime("%I:%M")
    end_time = (@order.serving_datetime + 1800).strftime("%I:%M%p")
    delivery_time = "#{start_time}-#{end_time}"

    # looping through all the order items and push into an array
    new_items = []
    @order.order_items.each do |item|
      new_item = {
        name: item.meal.name,
        quantity: item.quantity,
        total_price: item.quantity * item.unit_price
      }
      new_items.push(new_item)
    end

    # remake the object
    order = {
      order_id: @order.order_id,
      delivery_date: @order.serving_datetime.strftime("%F"),
      delivery_time: delivery_time,
      order_items: new_items
    }

    render json: order
  end
end
