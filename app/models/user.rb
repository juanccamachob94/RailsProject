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

class User < ApplicationRecord
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true, uniqueness: true, length: {in: 3..12}#, length: {minimum: 3, maximum: 12} o {is: 5}
  #validates :sexo, inclusion/exclusion: {in: ["F","M"]}
  #validate_presence_of :email,:username#Es lo mismo que validate_presence_of [:email,:username]
  #acceptance: true, se aplica sobre un booleano para validar que se está enviando como verdadero
  #Numericality => float o enteros
  #validates :edad, numericality: true
  #sólo enteros:
  #validates :edad, numericality: {only_integer: true}

  #personalizados:
  validate :validate_username_regex


  has_attached_file :avatar, styles: {thumb: "100x100", medium: "300x300"}, default_url: "/images/:style/naruto.png"
  has_attached_file :cover, styles: {thumb: "400x300", medium: "800x600"}, default_url: "/images/:style/missing_cover.jpg"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/

  private
  def validate_username_regex
    unless username =~ /\A[a-zA-Z]+[a-zA-Z0-9_]*\z/
      errors.add(:username,"El username debe iniciar con una letra")
      errors.add(:username,"El username sólo debe contener _, letras y números")
      #errors.add(:username,"El username debe iniciar con una letra y contener luego numeros, letras y _")
    end
  end
end
