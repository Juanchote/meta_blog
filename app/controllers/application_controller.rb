class ApplicationController < ActionController::Base
  protect_from_forgery

  def not_found
    render :file => '/public/404.html',
                    status => 404, :layout => true
  end

  def render_for(object, params={})
    respond_to do |format|
      if object
        output = params.empty? ? object : object.to_json(params)
        format.html
        format.json { render json: output, status: :ok}
      else
        format.html { not_found }
        format.json { render json: { errors: 'Entry not found' }, status: :not_found }
      end
    end
  end

  def save_for(object)
    respond_to do |format|
      if object.valid?
        format.html
        format.json { render json: object, status: :created }
      else
        format.html { render 'new' }
        format.json { render json: object, status: :unprocessable_entity }
      end
    end
  end

  def destroy_for(object)
    respond_to do |format|
      if object.destroy
        format.html
        format.json { render json: object, status: :ok }
      else
        format.html
        format.json { render json: object, status: :unprocessable_entity }
      end
    end
  end
end
