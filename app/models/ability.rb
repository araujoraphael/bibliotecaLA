class Ability
  include CanCan::Ability
  
  def initialize(usuario)
    if usuario.admin?
      can :manage, :all
    else
     # Usuarios 
     can :show, Usuario, id: usuario.id
     can :index, Usuario, id: usuario.id
     can :edit, Usuario, id: usuario.id
     can :update, Usuario, id: usuario.id
     
     #Empréstimos
     can :new, Emprestimo
     can :destroy, Emprestimo, usuario_id: usuario.id
    end
  end
end