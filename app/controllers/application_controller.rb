class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :login_required, :instructor?


  def login(user)
    if user.class == Student
      session[:student_id] = user.id
    elsif user.class == Instructor
      session[:instructor_id] = user.id
    end
  end

  def instructor?
    if (session[:instructor_id])
      return true 
    else 
     # byebug
      redirect_to student_path(session[:student_id])
    end 
  end 


  def current_student
    Student.find(session[:student_id]) if session[:student_id]
  end

  def current_instructor
    Instructor.find(session[:instructor_id]) if session[:instructor_id]
  end

  def logged_in?
    !!current_student || !!current_instructor
  end

  def login_required
    if !logged_in?
      redirect_to '/login'
    end
  end

end
