class User < ActiveRecord::Base
  # boolean :is_active, :default => true
  # string :first_name
  # string :last_name
  # string :contact_no, :limit => 15
  # string :signup_tpe, :limit => 5
  # string :password, :limit => 500
  # string :password_salt, :limit => 500
  # string :password_hash, :limit => 500
  has_many :carts
  has_many :socities
  has_many :otp_stores

  def generate_access_token(user_id)
    Rails.logger.info "#{__FILE__}:#{__LINE__} generate_access_token Start"
    random_token = SecureRandom.hex
    begin
      api_key_instance = ApiKey.find_by_access_token(random_token)
      if(api_key_instance.present?)
        random_token = SecureRandom.hex
      else
        break
      end
    end until true
    api_key_data_instance = ApiKey.find_by_user_id(user_id)
    if(api_key_data_instance.present?)
      api_key_data = api_key_data_instance.update(:access_token => random_token)
    else
      api_key_data = ApiKey.create(:user_id => user_id, :access_token => random_token)
    end
    #access_token_data = ApiKey.find_by_user_id(user_id)
    return random_token
  end
end
