class Author < ApplicationRecord
    def name
        "#{first_name} #{last_name}"
    end
    
    has_and_belongs_to_many :papers
    validates :last_name, presence: true, length: { minimum: 1 }
end
