# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_render_cart
  before_action :initialize_cart
  include Pundit

  def after_sign_in_path_for(_resource)
    if user_signed_in?
      products_path
    else
      new_user_session_path
    end
  end

  def set_render_cart
    @render_cart = true
  end

  def initialize_cart
    @cart ||= Cart.find_by(id: session[:cart_id])

    return unless @cart.nil?

    @cart = Cart.create
    session[:cart_id] = @cart.id
  end
end
