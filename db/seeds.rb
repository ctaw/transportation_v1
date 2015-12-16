if User.all.blank?
  User.create(:email => 'admin@test.com', :password => 'password', :password_confirmation => 'password', :first_name => 'Brian', :last_name => 'Rafor' ,:role_id => 0)
  User.create(:email => 'guest@test.com', :password => 'password', :password_confirmation => 'password', :first_name => 'Cara', :last_name => 'Delevingne' ,:role_id => 1)
end
