#to run: bundle exec rake import_csv
require 'csv'

desc "clear and import CSV data"
  task import_csv: :environment do
    csv_hash = {
      'lib/data/customers.csv' => Customer,
      'lib/data/merchants.csv' => Merchant,
      'lib/data/items.csv' => Item,
      'lib/data/invoices.csv' => Invoice,
      'lib/data/invoice_items.csv' => InvoiceItem,
      'lib/data/transactions.csv' => Transaction
    }

    csv_hash.each do |csv, model|
      model.destroy_all
      CSV.foreach(csv, headers: true) do |row|
        model.create!(row.to_h)
      end
      puts "CSV file - #{model} - loaded successfully!"
    end
    
    puts "CSV file load complete."
  end