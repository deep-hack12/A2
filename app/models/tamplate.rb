class Tamplate < ApplicationRecord
    validates :purpose, :language_code, :subject, :body, presence: true
    enum :role, { admin: "admin", editor: "editor"}, default: :editor
    after_initialize :set_default_role, if: :new_record?
    def set_default_role
        self.role ||= Friend.role[:editor]
    end

end
