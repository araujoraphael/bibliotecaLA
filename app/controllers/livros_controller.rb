class LivrosController < ApplicationController
  
  before_filter :transformar_id, only: [:show, :edit, :update, :destroy]
  
  # GET /livros
   # GET /livros.xml
   def index
     
      #@livros = Livro.all
      query = Livro.scoped
      
      query = query.where('codigo LIKE ?', "#{params[:codigo]}") unless params[:codigo].blank?
      query = query.where('titulo LIKE ?', "%#{params[:titulo]}%") unless params[:titulo].blank?
      query = query.where('autor LIKE?', "%#{params[:autor]}%") unless params[:autor].blank?
      @livros = query.all

     respond_to do |format|
       format.html # index.html.erb
       format.xml  { render xml: @livros }
     end
   end

   # GET /livros/1
   # GET /livros/1.xml
   def show
     @livro = Livro.find_by_codigo(params[:id])

     respond_to do |format|
       format.html # show.html.erb
       format.xml  { render xml: @livro }
     end
   end
   
  
   # GET /livros/new
   # GET /livros/new.xml
   def new
     @livro = Livro.new

     respond_to do |format|
       format.html # new.html.erb
       format.xml  { render xml: @livro }
     end
   end

   # GET /livros/1/edit
   def edit
     @livro = Livro.find_by_codigo(params[:id])
   end

   # livro /livros
   # livro /livros.xml
   def create
     @livro = Livro.new(params[:livro])

     respond_to do |format|
       if @livro.save
         format.html { redirect_to(livros_path, notice: 'livro was successfully created.') }
         format.xml  { render xml: @livro, status: :created, location: @livro }
       else
         format.html { render action: "new" }
         format.xml  { render xml:  @livro.errors, status: :unprocessable_entity }
       end
     end
   end
   

   # PUT /livros/1
   # PUT /livros/1.xml
   def update
     @livro = Livro.find_by_codigo(params[:id])

     respond_to do |format|
       if @livro.update_attributes(params[:livro])
         format.html { redirect_to(livros_path, notice: 'livro was successfully updated.') }
         format.xml  { head :ok }
       else
         format.html { render action: "edit" }
         format.xml  { render xml: @livro.errors, status: :unprocessable_entity }
       end
     end
   end
   
   def destroy
     @livro = Livro.find_by_codigo(params[:id])
     @livro.destroy
     
     respond_to do |format|
       format.html { redirect_to (livros_url) }
       format.xml { head :ok }
     end
   end

private
  def transformar_id
    params[:id] = params[:id].split('-').join('/')
  end

end
