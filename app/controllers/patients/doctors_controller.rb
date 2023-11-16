module Patients
  class DoctorsController < BaseController
    authorize_resource class: false

    def index
      @categories = Category.all
      @doctors = Doctor.find_by_category_or_all(params[:category])
    end
  end
end
