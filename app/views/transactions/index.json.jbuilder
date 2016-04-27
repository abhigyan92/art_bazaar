json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :new, :cart_id, :ip_address, :first_name, :last_name, :card_type, :card_expires_on
  json.url transaction_url(transaction, format: :json)
end
