class MealRepository
  def initialize(csv_path)
    @csv_path = csv_path
    @csv_options = { col_sep: ',', force_quotes: true, header_converters: :symbol, headers: :first_row, quote_char: '"'}
    @meals = []
    load_csv if File.exist?(csv_path)
  end

  def all
    return @meals
  end

  def find(id)
    @meals.find { |meal| meal.id == id }
  end

  def add(meal)
    @next_id = @meals.empty? ? 1 : @meals.last.id + 1
    meal.id = @next_id
    @next_id += 1
    @meals << meal
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_path, @csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      @meals << Meal.new(row)
    end
  end

  def save_csv
    CSV.open(@csv_path, 'wb', @csv_options) do |csv|
      csv << ['id', 'name', 'price']
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end
end
