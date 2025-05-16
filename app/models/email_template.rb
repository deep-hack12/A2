class EmailTemplate < ApplicationRecord
    validates :purpose, :language_code, :subject, :body, presence: true
end
