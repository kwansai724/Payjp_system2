class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :cards, dependent: :destroy
  has_one :subscription, dependent: :destroy

  scope :search, -> (search_params) do
    return if search_params.blank?

    name_like(search_params[:name])
  end
  scope :name_like, -> (name) { where('name LIKE ?', "%#{name}%") if name.present? }

  validates :name, presence: true, length: { minimum: 2 }
  validates :email, length: { maximum: 100 }
  validates :gender, presence: true
  validates :birthday, presence: true
  validates :address, presence: true

end
