module ApplicationHelper
=begin
  def set(object)
    if object.save
      render json: object, status: :created
    else
      render json: object, status: :unprocessable_entity
    end
  end

  def delete(object)
    if object.destroy
      render json: object, status: :ok
    end
  end

  def get(object, params = {})
    if object
      output = params.empty? ? object : object.to_json(params)
      respond_to do |format|
        #render json: output, status: :ok
        format.html
        format.json { render json: output, status: :ok}
      end
    else
      render json: { errors: 'Entry not found' }, status: :not_found
    end
  end
=end
end
