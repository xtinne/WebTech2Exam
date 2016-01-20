class TodoController < ApplicationController
  def index
    @todos = Todo.all

    respond_to do |format|
  		format.json { render :json => @todos }
  end

  def new
  	@db = CouchRest.database(ENV['DB'])
  	@response = @db.save_doc({
      ingavedatum: todo_params.ingavedatum,
      einddatum: todo_params.einddatum,
      prioriteit: todo_params.prioriteit,
      beschrijving: todo_params.beschrijving,
      status: todo_params.status
      })
  end
 
  def create
  	@todos = Todo.new(todo_params)

  	if @todos.save
    	redirect_to @todos
 	else
    	render 'new'
  	end
  end
end

def show
	@todos = Todo.find(params[:prioriteit])

	respond_to do |format|
  		format.json { render :json => @todos }

end

private
  def todo_params
    params.require(:todos).permit(:ingavedatum, :einddatum, :prioriteit, :beschrijving, :status)
  end