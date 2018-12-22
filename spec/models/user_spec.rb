# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  username               :string
#  name                   :string
#  last_name              :string
#  bio                    :text
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  avatar_file_name       :string
#  avatar_content_type    :string
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#  cover_file_name        :string
#  cover_content_type     :string
#  cover_file_size        :integer
#  cover_updated_at       :datetime
#

require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
=begin
  it "should work" do
    expect(true).to eq(true)
  end
=end
  #it "should work" do
    #Expectativas
    #expect("Juan").to eq("Marcos")
    #expect(20). to be > 10
  #end
  #it {expect(20).to be > 10}
  #it {should validate_presence_of :username}
  #it {should validate_uniqueness_of :username}
  #it {should validate_length_of(:username).is_at_least(3).is_at_most(12)}

  #1 excpectativa por prueba, pero con describe se pueden agrupar
  describe "#validate_username_regex" do
    #build o create
    let(:user) {FactoryBot.create(:user)}
    it "should not allow username with numbers at the beginning" do
      #user = User.new(email:"prueba@test.com",password:"12335345",username:"99a")
      #user.save
      #invalid? => true
      # errors => no esté vacío
      # errors.full_messages => el username debe iniciar con una letra
      #false / nil, 0 es true
      puts "I=================================="
      puts user.errors.inspect
      puts "F=================================="
      user.username = "9aaa"
      expect(user.valid?).to be_falsy
    end
    it "should not contain special characters" do
      user.username = "aaa*"
      expect(user.valid?).to be_falsy
    end
  end
end
