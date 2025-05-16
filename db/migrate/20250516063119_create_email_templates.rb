class CreateEmailTemplates < ActiveRecord::Migration[8.0]
  def change
    create_table :email_templates do |t|
      t.string :purpose
      t.string :language_code
      t.string :subject
      t.text :body

      t.timestamps
    end
  end
end
