class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :cards
  has_one :subscription

  scope :search, -> (search_params) do
    return if search_params.blank?

    name_like(search_params[:name])
  end
  scope :name_like, -> (name) { where('name LIKE ?', "%#{name}%") if name.present? }

end
