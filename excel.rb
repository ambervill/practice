def self.excel
  rows = []
  bar = Spreadsheet.open("1.xls") do |book|
    sheet = book.worksheet 0
    sheet.each_with_index(1) do |row, i|
      inn = row[0].to_s.gsub('.0', '')
      if inn.length == 9
        inn = "0#{inn}"
      end
      rows << {inn: inn, email: KOrg.where(inn: inn).pluck("cp_email").keep_if { |email| email.present? }.uniq.join(", ")}
    end
  end
  # puts rows


  File.open("D:/tirazh/3.xls", "w+") do |file|
    excel = Spreadsheet::Workbook.new
    sheet = excel.create_worksheet
    rows.each.with_index(1) do |row, i|
      sheet.update_row(i,
                       row[:inn],
                       row[:email]

      )
    end
    excel.write file.path
  end
  nil

end