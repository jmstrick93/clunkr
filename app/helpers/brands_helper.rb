module BrandsHelper
  def listable_brand_info(brand)
    render partial: 'brands/brand_info_div', locals: {brand: brand}
  end

end
