class Api::V1::TodosController < ActionController::API
  rescue_from StandardError,                with: :internal_server_error
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def index
    @todos = Todo.all
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      render :show, status: :created
    else
      render json: { errors: @todo.errors.full_messages },
            status: :unprocessable_entity
    end
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update_attributes(todo_params)
      render :show, status: :created
    else
      render json: { errors: @todo.errors.full_messages },
            status: :unprocessable_entity
    end
  end


  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    render json: { status: 'SUCCESS', message: 'Deleted Todo', data:@todo}, status: :ok
  end

  private


  def todo_params
    params.permit(:name, :priority, :done)
  end


  def not_found(exception)
    render json: { error: exception.message }, status: :not_found
  end

  def internal_server_error(exception)
    if Rails.env.development?
      response = { type: exception.class.to_s, message: exception.message, backtrace: exception.backtrace }
    else
      response = { error: "Internal Server Error" }
    end
    render json: response, status: :internal_server_error
  end
end


