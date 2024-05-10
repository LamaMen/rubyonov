class ApplicationController < ActionController::Base
    include SessionsHelper

    def pages_of(data, records_per_pages)
        unless data.kind_of?(Array)
          data.page(params[:page]).per(records_per_pages)
        else
          Kaminari.paginate_array(data).page(params[:page]).per(records_per_pages)
        end
    end
end
