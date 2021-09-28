class DoctorsController < ApplicationController
  def show
    @doctor = Doctor.find(params[:id])
  end

  def index
    @doctors = Doctor.all
  end

  def new
    @doctor = Doctor.new
    2.times do 
      @doctor.patients.build
    end 
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to doctor_path(@doctor)
    else
      render :new
    end 
  end

  private

  def doctor_params
    params.require(:doctor).permit(:name, patients_attributes: [:name, :age])
  end 


end
