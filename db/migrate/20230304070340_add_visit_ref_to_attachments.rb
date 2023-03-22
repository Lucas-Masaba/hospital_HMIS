class AddVisitRefToAttachments < ActiveRecord::Migration[7.0]
  def change
    add_reference :attachments, :visit, null: false, foreign_key: true
  end
end
