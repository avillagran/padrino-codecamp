# encoding: utf-8
Proyecto::App.controllers :users do
  
  get :index do
    @users = User.all
    
    render 'users/index'
  end

  get :new do
    @user = User.new

    render 'users/new'
  end

  get :edit, with: [:id] do
    @user = User.get params[:id]
    render 'users/edit'
  end

  post :update, with: [:id] do
    logger.info params.inspect

    if (user = User.get(params[:id])).blank?
      flash[:error] = "No existe el registro"
    else
      user.update params[:user]
    end
    

    if user.errors.blank?
      flash[:notice] = "Usuario actualizado correctamente"
    else
      flash[:error] = "Ocurrió un error al editar el usuario, intente nuevamente"
    end

    redirect url(:users, :index )
  end

  post :create do
    logger.info params.inspect
    user = User.create params[:user]

    if user.errors.blank?
      flash[:notice] = "Usuario creado correctamente"
    else
      flash[:error] = "Ocurrió un error al crear el usuario, intente nuevamente"
    end

    redirect url(:users, :index)
  end

  get :destroy, with: [:id, :token] do
    unless csrf_token.eql? params[:token]

      flash[:error] = "No tiene permisos"

    else

      user = User.get params[:id]
      
      if user
        user.destroy
        flash[:notice] = "Usuario eliminado correctamente"
      else
        flash[:error] = "El usuario no puede ser eliminado"
      end

    end
    redirect url(:users, :index )
  end

end
