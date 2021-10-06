class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :encrypted_password,:password,:password_confirmation,length:{minimum:6},format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/}
         validates :nickname, presence: true
         validates :lastname, presence:true, format: { with: /\A[ぁ-んァ-ン一-龥]/}
         validates :firstname, presence:true, format: { with: /\A[ぁ-んァ-ン一-龥]/}
         validates :lastname_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
         validates :firstname_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
         validates :birth_day, presence: true     
end


