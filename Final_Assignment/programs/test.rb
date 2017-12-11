require 'csv'
all_records = CSV.read('/home/shivam/Ruby_Assignment-Home/Final_Assignment/DataFiles/Details1.csv', )
acc_no=147
rec=all_records.find{|d| d[3].eql? 'pratik'}
puts rec
sender=all_records.find{|d| d[3].eql?'Shom'}
rec[5]=rec[5].to_i+200
sender[5]=sender[5].to_i-200
puts all_records
CSV.open('/home/shivam/Ruby_Assignment-Home/Final_Assignment/DataFiles/Details1.csv', 'wb') { |csv|
  #csv << headers
  all_records.each{|row|
    csv << row}}