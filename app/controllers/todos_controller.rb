class TodosController < ApplicationController
  def index
    @todos = Todo.all

    if params[:id]
      @todo = Todo.find(params[:id])
    else
      @todo = Todo.new
    end
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.save
    render :json => {:id => @todo.id, :title => @todo.title}
    #redirect_to todos_path
  end

  def update
    @todo = Todo.find(params[:id])
    @todo.update_attributes(todo_params)
    render :json => {:id => @todo.id, :title => @todo.title}
    #redirect_to todos_path
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    render :json => {:id => @todo.id}
    #redirect_to todos_path
  end

  def edit
    @todo = Todo.find(params[:id])
    render :json => {:id => @todo.id, :title => @todo.title}
  end

  def toggle_check
    @todo = Todo.find(params[:id])
    # 當值是 boolean 的時候，可以使用 toggle 方法來切換 true/false
    # 加上驚歎號表示會直接存入資料庫（否則要另外 save)
    # ref: http://api.rubyonrails.org/classes/ActiveRecord/Persistence.html#method-i-toggle
    @todo.toggle!(:done)
    render :json => {:id => @todo.id, :done => @todo.done}
    #redirect_to todos_path
  end

  private

  def todo_params
    params.require(:todo).permit(:title)
  end
end
