class TodosController < ApplicationController
  before_filter :login_required

  require 'will_paginate/array'


  # GET /todos
  # GET /todos.json
  def index

    # trie les todos
    if params[:sort]
          @todos = current_user.todos.order("#{params[:sort]}").paginate(page: params[:page], per_page: 5)
    else 
      if params[:search]
        @todos = current_user.todos.find(:all,:conditions => ['body LIKE ?', "%#{params[:search]}%"]).paginate(page: params[:page], per_page: 5)

      else
        if params[:category]
        @todos = current_user.todos.where(:category => params[:category]).paginate(page: params[:page], per_page: 5)

        else
          @todos = current_user.todos.paginate(page: params[:page], per_page: 5)
        end
      end
    end

    @todo = current_user.todos.new
    #taches en retard
    @late_todos= current_user.todos.where(:done => false).where("due <= ?", Date.today).count

    # cree les categories que j'ai
    @mycategories = []
      current_user.todos.group(:category).count.each_pair do |c, n|
        @mycategories << c
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @categories.to_json}
      format.js
      format.rss { render :layout => false } #index.rss.builder
    end

  end


  def search
      @todos = current_user.todos.find(:all,:conditions => ['body LIKE ?', "%#{params[:search]}%"]).paginate(page: params[:page], per_page: 5)

      @todo = current_user.todos.new


      respond_to do |format|
        format.html
        format.json
      end

  end

  # GET /todos/1
  # GET /todos/1.json
  def show
    @todo = current_user.todos.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @todo }
    end
  end

  # GET /todos/new
  # GET /todos/new.json
  def new
    @todo = current_user.todos.new(params[:todo])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @todo }
      format.js

    end
  end

  # GET /todos/1/edit
  def edit
    #@todo = Todo.find(params[:id])
    @todo = current_user.todos.find(params[:id])
  end

  # POST /todos
  # POST /todos.json
  def create
    #@todo = Todo.new(params[:todo])
    #@todo = current_user.todos.create(params[:todo])
    @todo = current_user.todos.new(params[:todo])


    respond_to do |format|
      if @todo.save
        format.html { redirect_to @todo, notice: 'Todo was successfully created.' }
        format.json { render json: @todo, status: :created, location: @todo }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /todos/1
  # PUT /todos/1.json
  def update
    #@todo = Todo.find(params[:id])
    @todo = current_user.todos.find(params[:id])

    respond_to do |format|
      if @todo.update_attributes(params[:todo])
        format.html { redirect_to @todo, notice: 'Todo was successfully updated.' }
        format.json { head :no_content }

      else
        format.html { render action: "edit" }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    #@todo = Todo.find(params[:id])
    @todo = current_user.todos.find(params[:id])
    @todo.destroy

    respond_to do |format|
      format.html { redirect_to todos_url }
      format.json { head :no_content }
      format.js
    end
  end

  def multiple_destroy
    params[:id].each do |id|
        todo = current_user.todos.find_by_id(id)
        todo.destroy
    end
    respond_to do |format|
        format.js {
            @todos = current_user.todos.paginate(page: params[:page], per_page: 5)
         }
    end
  end

def done
    @todo = current_user.todos.find(params[:id])
    value = @todo.done ? 0 : 1
    respond_to do |format|
      if @todo.update_attributes(:done => value)
         format.json { render json: @todos }
         format.js {
            @todos = current_user.todos.paginate(page: params[:page], per_page: 5)
         }
      end
    end
  end

  def feed
      @title = "Todo Manager title"
      # the news items
      @todos = current_user.todos.order("updated_at desc")

      # this will be our Feed's update timestamp
      @updated = @todos.first.updated_at unless @todos.empty?

      respond_to do |format|
        format.atom { render :layout => false }
        format.rss { redirect_to feed_path(:format => :atom), :status => :moved_permanently }
      end
  end



  private

  def login_required
    unless current_user
      redirect_to signup_path
    end
  end
end
