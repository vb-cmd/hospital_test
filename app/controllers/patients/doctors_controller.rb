module Patients
  class DoctorsController < BaseController
    authorize_resource class: false

    def index
      @categories = Category.take_names
      @doctors = Doctor.find_by_category_or_all(params[:category])
    end
  end
end
