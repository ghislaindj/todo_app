class AjaxController < ApplicationController

def editable
    model = params[:id].scan(/(\D+)_(\D+)_/)[0][0].camelize.constantize
    object = model.find(params[:id].scan(/\d+/)[0])
    attribute = params[:id].scan(/(\D+)_(\D+)_/)[0][1]
    result = object.update_attribute attribute, params[:value]
    
    respond_to do |format|
      format.js { render :json => params[:value] 
                  @todos = current_user.todos.paginate(page: params[:page], per_page: 5)
                }
    end
  end



end
