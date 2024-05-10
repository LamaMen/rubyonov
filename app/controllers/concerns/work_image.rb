module WorkImage extend ActiveSupport::Concern
    include WorkHelper
   
   # display image by index for searched theme
   def show_image(theme_id, image_index)
        theme_images = Image.theme_images(theme_id)
   
        # current_user_id = current_user.id
        # logger.info "In show_image: current_user_id = #{current_user_id.inspect} "
   
        logger.info "Index = #{image_index} "
        logger.info "Images = #{theme_images.inspect} "
        
        one_image_attr = theme_images[image_index].attributes
        logger.info "In show_image: one_image_attr = #{one_image_attr.inspect} "
        
        image_id = one_image_attr["id"]
        logger.info "In show_image: image_id = #{image_id.inspect} "
   
        # user_valued, value = Value.user_valued_exists(current_user_id, image_id)
        # 1/0 # true/false .exists?
        # logger.info "In show_image: user_valued = #{user_valued.inspect} "
        
        values_qty = Value.all.count.round
   
        # if user_valued == 1
            # common_ave_value = Image.find_image(image_id).ave_value
            # logger.info "In 1show_image: common_ave_value = #{common_ave_value.inspect} "
            # if common_ave_value.blank?
                # common_ave_value = 0
            # end
                # common_ave_value.round unless common_ave_value.blank?
            # 
            # logger.info "In 2show_image: common_ave_value = #{common_ave_value.inspect} "
        # else
            common_ave_value = 0
        # end
   
        data = { index: image_index,
                values_qty: values_qty,
                current_user_id:  0,
                theme_id: theme_id,
                images_arr_size: theme_images.size,
                image_id: image_id,
                name: one_image_attr["name"],
                file: one_image_attr["file"],
                user_valued: 0,
                value: 0,
                common_ave_value: common_ave_value
        }
        
        logger.info "In show_image:  data = #{data.inspect} "
        data
   end

    def image_data(theme, data)
        @image_data = {}

        @image_data[:values_qty] = data[:values_qty]
        @image_data[:theme] = theme
        @image_data[:current_user_id] = data[:current_user_id]
        @image_data[:theme_id] = data[:theme_id]
        @image_data[:index] = data[:index]
        @image_data[:images_arr_size]  = data[:images_arr_size]
        @image_data[:image_id]  = data[:image_id]
        @image_data[:name]  = data[:name]
        @image_data[:file]  = data[:file]
        @image_data[:user_valued]  = data[:user_valued]
        @image_data[:value]  = data[:value]
        @image_data[:common_ave_value]  = 
        data[:common_ave_value]

        @image_data
    end
end