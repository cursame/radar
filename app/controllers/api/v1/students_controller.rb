module Api
  module V1
    class StudentsController < ApplicationController
      def search
        @students = current_institution.students.order(:name).where(
          'lower(name) LIKE ?',
          "%#{params[:term].downcase}%"
        )
        @name_students = @students.map(&:name)
        render json: @name_students, root: false
      end
    end
  end
end
