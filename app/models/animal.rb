class Animal < ActiveRecord::Base
 validates_presence_of :name, :species, :weight, :notes 
 validates :weight, numericality: true
end
