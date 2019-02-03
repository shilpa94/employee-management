json.extract! employee, :id, :firstname, :lastname, :email, :gender, :phone, :address, :employee_id, :department, :created_at, :updated_at
json.url employee_url(employee, format: :json)
