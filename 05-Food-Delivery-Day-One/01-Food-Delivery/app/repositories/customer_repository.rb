class CustomerRepository
  def initialize(csv_path)
    @csv_path = csv_path
    @csv_options = { col_sep: ',', force_quotes: true, header_converters: :symbol, headers: :first_row, quote_char: '"'}
    @customers = []
    load_csv if File.exist?(csv_path)
  end

  def all
    return @customers
  end

  def find(id)
    @customers.find { |customer| customer.id == id }
  end

  def add(customer)
    @next_id = @customers.empty? ? 1 : @customers.last.id + 1
    customer.id = @next_id
    @next_id += 1
    @customers << customer
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_path, @csv_options) do |row|
      row[:id] = row[:id].to_i
      @customers << Customer.new(row)
    end
  end

  def save_csv
    CSV.open(@csv_path, 'wb', @csv_options) do |csv|
      csv << ['id', 'name', 'address']
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end
end

