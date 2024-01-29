class CreateInsuranceCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :insurance_companies do |t|
      t.string :company
      t.decimal :rate
      t.decimal :excessprotector
      t.decimal :pvt
      t.decimal :lossofuse
      t.decimal :pcf
      t.decimal :itl
      t.decimal :stampduty

      t.timestamps
    end
  end
end
