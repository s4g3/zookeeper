class Animal < ActiveRecord::Base
 validates_presence_of :name
 validates_numericality_of :weight, :greater_than => 0, :allow_nil => true

end
