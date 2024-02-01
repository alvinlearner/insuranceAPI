class InsuranceCompaniesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  
    # GET /insurance_companies
    def index
      insurance_companies = InsuranceCompany.all
      render json: insurance_companies
    end
  
    # POST /insurance_companies
    def create
      insurance_company = InsuranceCompany.create(insurance_company_params)
      render json: insurance_company, status: :created
    end
  
    # GET /insurance_companies/:id
    def show
      insurance_company = find_insurance_company
      render json: insurance_company
    end
  
    # PATCH /insurance_companies/:id
    def update
      insurance_company = find_insurance_company
      insurance_company.update(insurance_company_params)
      render json: insurance_company
    end
  
    # DELETE /insurance_companies/:id
    def destroy
      insurance_company = find_insurance_company
      insurance_company.destroy
      head :no_content
    end
    
  
    private
  
    def insurance_company_params
      params.permit(:company, :rate, :excessprotector, :pvt, :lossofuse, :pcf, :itl, :stampduty)
    end
  
    def render_not_found_response
      render json: { error: "Insurance Company not found" }, status: :not_found
    end
  
    def find_insurance_company
      InsuranceCompany.find(params[:id])
    end
  end



# class InsuranceCompaniesController < ApplicationController
#   rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

#   # GET /insurance_companies
#   def index
#     insurance_companies = InsuranceCompany.all
#     render json: insurance_companies
#   end

#   # POST /insurance_companies
#   def create
#     insurance_company = InsuranceCompany.create(insurance_company_params)
#     render json: convert_decimals_to_integers(insurance_company), status: :created
#   end

#   # GET /insurance_companies/:id
#   def show
#     insurance_company = find_insurance_company
#     render json: convert_decimals_to_integers(insurance_company)
#   end

#   # PATCH /insurance_companies/:id
#   def update
#     insurance_company = find_insurance_company
#     insurance_company.update(insurance_company_params)
#     render json: convert_decimals_to_integers(insurance_company)
#   end

#   # DELETE /insurance_companies/:id
#   def destroy
#     insurance_company = find_insurance_company
#     insurance_company.destroy
#     head :no_content
#   end

#   private

#   def insurance_company_params
#     params.permit(:company, :rate, :excessprotector, :pvt, :lossofuse, :pcf, :itl, :stampduty)
#   end

#   def render_not_found_response
#     render json: { error: "Insurance Company not found" }, status: :not_found
#   end

#   def find_insurance_company
#     InsuranceCompany.find(params[:id])
#   end

#   def convert_decimals_to_integers(insurance_company)
#     insurance_company.as_json.tap do |json|
#       json['rate'] = insurance_company.rate.to_i
#       json['excessprotector'] = insurance_company.excessprotector.to_i
#       json['pvt'] = insurance_company.pvt.to_i
#       json['lossofuse'] = insurance_company.lossofuse.to_i
#       json['pcf'] = insurance_company.pcf.to_i
#       json['itl'] = insurance_company.itl.to_i
#       json['stampduty'] = insurance_company.stampduty.to_i
#     end
#   end
# end

  