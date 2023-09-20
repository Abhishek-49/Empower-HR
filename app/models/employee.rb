class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  belongs_to :department
  belongs_to :role
  has_one_attached :image
  has_many :leaves


  validates :first_name, :last_name, presence: true
  validates :department_id, presence: true
  validates :employee_id, presence: true, uniqueness: true
  validates :address, presence: true
  validates :mobile_no, presence: true
  validates :aadhar, presence: true, uniqueness: true
  validates :pancard, presence: true, uniqueness: true
  validates :date_of_birth, presence: true
  validates :email, presence: true, uniqueness: true



end
