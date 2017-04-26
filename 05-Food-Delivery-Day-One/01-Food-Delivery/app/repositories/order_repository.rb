require 'csv'
require 'pry-byebug'

class OrderRepository
  def initialize(csv_path, meal_repository, employee_repository, customer_repository)
    @csv_path = csv_path
    @csv_options = { col_sep: ',', force_quotes: true, header_converters: :symbol, headers: :first_row, quote_char: '"'}
    @orders = []
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    load_csv if File.exist?(csv_path)
  end

  def find(id)
    @orders.find { |order| order.id == id }
  end

  def add(order)
    @next_id = @orders.empty? ? 1 : @orders.last.id + 1
    order.id = @next_id
    @next_id += 1
    @orders << order
    save_csv
  end

  def undelivered_orders
    @orders.select { |order| !order.delivered? }
  end

  private

  def load_csv
    CSV.foreach(@csv_path, @csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:delivered] = row[:delivered] == "true"
      row[:meal] = @meal_repository.find(row[:meal_id].to_i)
      row[:employee] = @employee_repository.find(row[:employee_id].to_i)
      row[:customer] = @customer_repository.find(row[:customer_id].to_i)
      @orders << Order.new(row)
    end
  end

  def save_csv
    CSV.open(@csv_path, 'wb', @csv_options) do |csv|
      csv << ['id', 'delivered','meal_id', 'employee_id', 'customer_id']
      @orders.each do |order|
        csv << [order.id, order.delivered, order.meal.id, order.employee.id, order.customer.id]
      end
    end
  end
end


