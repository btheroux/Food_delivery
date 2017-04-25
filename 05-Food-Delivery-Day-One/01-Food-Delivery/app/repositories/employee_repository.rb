class EmployeeRepository
  def initialize(csv_path)
    @csv_path = csv_path
    @csv_options = { col_sep: ',', force_quotes: true, header_converters: :symbol, headers: :first_row, quote_char: '"'}
    @employees = []
    load_csv if File.exist?(csv_path)
  end

  def all_delivery_guys
    return @employees.select { |employee| employee.role == "delivery_guy" }
  end

  def find(id)
    @employees.find { |employee| employee.id == id }
  end

  def find_by_username(username)
    @employees.find { |employee| employee.username == username }
  end

  private

  def load_csv
    CSV.foreach(@csv_path, @csv_options) do |row|
      row[:id] = row[:id].to_i
      @employees << Employee.new(row)
    end
  end
end

