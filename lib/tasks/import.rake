require 'csv'

desc "Import teams from csv file"
task :import => [:environment] do

  file = "db/merchants.csv"

  CSV.foreach(file, :headers => true) do |row|
    Merchant.create(
      :id => row[0],
      :name => row[1],
      :created_at => row[2],
      :updated_at => row[3]
    )
  end

end
