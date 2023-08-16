# frozen_string_literal: true

class InvoiceGenerator
  def initialize(cart, user)
    @cart = cart
    @user = user
  end

  def generate_pdf
    pdf = Prawn::Document.new
    @orderables = Orderable.find_by(cart_id: @cart.id)
    order_date = @cart.orderables.first.created_at.strftime('%Y-%m-%d')
    delivery_date = @cart.orderables.first.updated_at.strftime('%Y-%m-%d')

    pdf.text 'Invoice', size: 24, align: :center
    pdf.move_down 20

    customer_info = [
      ['Customer name:', @user.profile&.first_name],
      ['Order date:', order_date],
      ['Delivery date:', delivery_date],
      ['Address:', @user.profile&.address]
    ]

    product_details = []

    @cart.orderables.each do |orderable|
      product_details << [
        ['Product name:', orderable.product.name],
        ['Product price:', orderable.price],
        ['Product quantity:', orderable.quantity]
      ]
    end

    pdf.move_down 20
    pdf.move_down 10

    pdf.bounding_box([pdf.bounds.left, pdf.bounds.top - 50], width: pdf.bounds.width) do
      customer_info.each do |info|
        pdf.text info.join(' '), size: 12
        pdf.move_down 5
      end

      pdf.move_down 20
      pdf.text 'Product Details', size: 18
      pdf.move_down 10

      product_details.each do |detail|
        pdf.text detail.join(' '), size: 12
        pdf.move_down 5
      end
    end
    pdf.text "Total price: #{@orderables.price}", size: 12
    pdf.text "Discounted price: #{@orderables.discount}", size: 12
    pdf.text "Payment status: #{@orderables.status}", size: 12
    pdf.move_down 50
    pdf.move_down 40
    pdf.render
  end
end
