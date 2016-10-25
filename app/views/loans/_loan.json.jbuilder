json.extract! loan, :id, :date, :quantity, :student_id, :element_id, :created_at, :updated_at
json.url loan_url(loan, format: :json)