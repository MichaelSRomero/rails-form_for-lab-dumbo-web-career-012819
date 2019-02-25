class StudentsController < ApplicationController
  before_action :student_params, only: [:create, :update]

  def new
    @student = Student.new
  end

  def create
    @student = Student.create(student_params)
    redirect_to student_path(@student)
  end

  def show
    get_student
  end

  def edit
    get_student
  end

  def update
    get_student.update(student_params)
    redirect_to student_path(get_student)
  end

  private

  def get_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name)
  end
end
