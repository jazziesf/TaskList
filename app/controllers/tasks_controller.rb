# TASKS = [
#   { id: 1, description: "Reverse Sentence Project", complete: "2018, 02, 14"},
#   { id: 2, description:"Join Thursday for a Happy Hour", complete:"2018, 03, 23"},
#   { id: 3, description:"Read Ruby the Hard Way", complete:"2018, 04, 04"},
#   { id: 4, description:"Code-Journal Article", complete:"2018, 08, 21"},
# ]


class TasksController < ApplicationController

  def index
    @tasks = Task.all.order(:name)
  end

  def show
    id = params[:id]
    @task = Task.find_by(id: id)


    if id == nil
      render :not_found, status: :not_found
    end
  end

  def new
    @task = Task.new
  end


  def edit
    @book = Task.find(params[:id].to_i)
  end

  def create
    @task = Task.new(name: params[:task][:name], description: params[:task][:description], due: params[:task][:due]) #instantiate a new book
    if @task.save # save returns true if the database insert succeeds
      redirect_to root_path # go to the index so we can see the book in the list
    else # save failed :(
      render :new # show the new book form view again
    end
  end

end
