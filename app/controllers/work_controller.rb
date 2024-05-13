class WorkController < ApplicationController
  include WorkImage

  def index
    @images_count = Image.all.count
    @selected_theme = t(".def_select_theme")
    @values_qty = Value.all.count
    session[:selected_theme_id] = @selected_theme # to display nothing
  end
   
  def choose_theme
    @themes = Theme.all.pluck(:name)
    respond_to :js
  end
   
   # @note: first display_theme and show first image from image array
  def display_theme
    @image_data = {}

    current_user_id = current_user.id
    if params[:theme].blank?
      theme = "Select theme to leave your answer"
      theme_id = 1
      values_qty = Value.all.count.round
      data = { index: 0, name: '', values_qty: values_qty,
               file: helpers.asset_path("pictures/honor_8x.jpg"), image_id: 4,
               current_user_id: current_user_id, user_valued: false,
               common_ave_value: 0, value: 0 }
    else
      theme = params[:theme]
      theme_model = Theme.find_by(name: theme)
      theme_id = theme_model.id
      data = show_image(theme_id, 0)
    end
    session[:selected_theme_id] = theme_id
    image_data(theme, data)

    respond_to :js
  end
   
  def results_list
    @selected_theme_id = session[:selected_theme_id]
    
    current_user_id = current_user.id
    res_composite_diag = Image.joins(:value)
      .select("images.name, images.created_at, images.file, values.value as user_value, values.created_at as mark_date, images.ave_value")
      .where("images.theme_id = :theme_id AND values.user_id = :user_id AND value <= images.ave_value + 25 AND value >= images.ave_value - 25", { theme_id: @selected_theme_id, user_id: current_user_id } )
      .order("value DESC")

    composite_results_size = res_composite_diag.size
    
    @composite_results = res_composite_diag.take(composite_results_size)
    @composite_results_paged = pages_of(@composite_results, 10)
  end
end
