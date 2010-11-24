class UsuariosController < ApplicationController
  
  before_filter :authenticate_usuario!
  load_and_authorize_resource
  
  
  rescue_from CanCan::AccessDenied do |exception|
        flash[:alert] = exception.message
        redirect_to root_url
  end
      
  def index
    query = Usuario.scoped
    
    query = query.where('email LIKE ?', "#{params[:email]}") unless params[:email].blank?
        query = query.where('name LIKE?', "%#{params[:name]}%") unless params[:name].blank?
    @usuarios = query.all
    
    respond_to do |format|
      format.html
      format.xml {render xml: @usuarios}
    end
  end
  
   def show
     puts 'aaaaaaaaaaah'
     @usuario = Usuario.find(params[:id])
    
     respond_to do |format|
       format.html # show.html.erb
       format.xml  { render xml: @usuario }
     end
   end
   
  
   def new
     @usuario = Usuario.new

     respond_to do |format|
       format.html # new.html.erb
       format.xml  { render xml: @usuario }
     end
   end
   
   def create
      @usuario = Usuario.new(params[:usuario])
      @usuario.login = @usuario.login
      @usuario.admin = false
            
      respond_to do |format|
        if @usuario.save
          format.html { redirect_to(usuarios_path, notice: 'livro was successfully created.') }
          format.xml  { render xml: @usuario, status: :created, location: @usuario }
        else
          format.html { render action: "new" }
          format.xml  { render xml:  @usuario.errors, status: :unprocessable_entity }
        end
      end
    end
    
     # GET /usuarios/1/edit
     def edit
       @usuario = Usuario.find(params[:id])
     end
    
    
     # PUT /usuarios/1
     # PUT /usuarios/1.xml
     def update
       @usuario = Usuario.find(params[:id])

       respond_to do |format|
         if @usuario.update_attributes(params[:usuario])
           format.html { redirect_to(usuarios_path, notice: 'usuario was successfully updated.') }
           format.xml  { head :ok }
         else
           format.html { render action: "edit" }
           format.xml  { render xml: @usuario.errors, status: :unprocessable_entity }
         end
       end
     end
    
    
    def destroy
       @usuario = Usuario.find(params[:id])
       @usuario.destroy

       respond_to do |format|
         format.html { redirect_to (usuarios_url) }
         format.xml { head :ok }
       end
     end
     
     def current_user
       @usuario_logado = current_usuario
     end
   
end
