class EmprestimosController < ApplicationController
  before_filter :transformar_id, only: [:new, :destroy]

  def new
    @livro = Livro.find_by_codigo(params[:livro_id])
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
    @livro = Livro.find_by_codigo(params[:livro_id])
    emprestimo = @livro.emprestimo_atual
    emprestimo.data_devolucao = Time.now
    emprestimo.save
  
    redirect_to livros_path
  end

private
  def transformar_id
    params[:livro_id] = params[:livro_id].split('-').join('/')
  end 

end
