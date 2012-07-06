class CreatePaymentTypes < ActiveRecord::Migration
  def self.up
    create_table :payment_types do |t|
      t.string :name

      t.timestamps
    end
    # remove_column :orders, :pay_type  

    remove_column :orders, :payment_type  
    add_column :orders, :payment_type_id, :integer   
  end

  def self.down
    drop_table :payment_types
    add_column :orders, :payment_type, :string
    remove_column :orders, :payment_type_id
  end
  
end