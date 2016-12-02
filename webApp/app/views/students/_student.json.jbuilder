json.extract! student, :id, :id, :studentCode, :name, :email, :phone, :created_at, :updated_at
json.url student_url(student, format: :json)