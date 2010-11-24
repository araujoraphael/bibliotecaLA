class EmprestimosController < ApplicationController
  #before_filter :transformar_id, only: [:new, :destroy]
  before_filter :authenticate_usuario!
  load_and_authorize_resource :nested :livro
  
  def new
    @livro = Livro.find(params[:livro_id])
    @emprestimo = @livro.emprestimos.build
    @emprestimo.data_emprestimo = DateTime.now.strftime(fmt='%F')
  

    respond_to do |format|
     if @emprestimo.save
       format.html { redirect_to(livros_path, notice: 'emprestimo was successfully created.') }
       format.xml  { render xml: @emprestimo, status: :created, location: @emprestimo }
     else
       format.html { render action: "new" }
       format.xml  { render xml:  @emprestimo.errors, status: :unprocessable_entity }
     end
    end
  end
    
  def destroy
    @livro = Livro.find(params[:livro_id])
    emprestimo = @livro.emprestimo_atual
    emprestimo.data_devolucao = Time.now
    emprestimo.save
  
    redirect_to livros_path
  end

private
  def transformar_id
    params[:livro_id] = params[:livro_id].split('-').join('/')
  end 
  
  def current_user
    @usuario_logado = current_usuario
  end

end
