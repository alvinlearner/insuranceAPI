class Transaction < ApplicationRecord
  belongs_to :client
  belongs_to :insurance_companies
end
