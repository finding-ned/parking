json.extract! parking_setting, :id, :setting_refno, :setting_code, :setting_description, :setting_value, :isactive, :created_at, :updated_at
json.url parking_setting_url(parking_setting, format: :json)
