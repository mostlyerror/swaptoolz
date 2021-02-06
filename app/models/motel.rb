class Motel < ApplicationRecord
    validates_presence_of :name, :address, :phone

    has_many :users
end
