class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  include ApplicationHelper

  def home
    @products = contentful.entries(content_type: ENV['CONTENTFUL_PRODUCT_CT_ID'])
  end

  def show
@product = contentful.entry(
params[:id]
)
  end
end
