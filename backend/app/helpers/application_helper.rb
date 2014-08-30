module ApplicationHelper
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
      render json: output, status: :ok
    else
      render json: { errors: 'Entry not found' }, status: :not_found
    end

  end
end
