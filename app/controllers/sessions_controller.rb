class SessionsController < ApplicationController
 #skip_before_action :login_required, only: [:new, :create]
  
  def new
  end

  def create
    if params[:student]
       @user = Student.find_by(name: params[:student][:name])
    elsif params[:instructor]
      @user = Instructor.find_by(name: params[:instructor][:name])
    end 
    
    if @user.nil?
      flash.now[:message] = "Enter a valid user name"
      render 'new'
    elsif @user.authenticate(params[:password])
      session[:user_id] = @user.id
      login(@user)
      redirect_to @user
    else
      flash.now[:message] = 'enter the correct password'
      render 'new'
    end
  end

  def not_allowed

  end 

  def destroy
    session[:student_id] = nil
    session[:instructor_id] = nil
    session[:user_id] = nil
    redirect_to root_path
  end

 
end