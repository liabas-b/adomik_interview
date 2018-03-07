class ExerciseOneController < ApplicationController

  def index
    @currency_codes = %w(AUD BGN BRL CAD CHF CNY CZK DKK EUR GBP HKD HRK HUF IDR ILS INR ISK JPY KRW MXN MYR NOK NZD PHP PLN RON RUB SEK SGD THB TRY ZAR)
  end

  def transform
    # Here is your exercise
  end

  def download_sample
    @csv = build_sample_csv
    send_data @csv, filename: 'exercise_one_input.csv', type: 'application/csv'
  end

  private

  def build_sample_csv
    CSV.generate(headers: true) do |csv|
      csv << ['Buyer', 'Impressions', 'Revenue']
      100.times do
        buyer = Faker::Name.name
        impressions = Faker::Number.between(1, 1000000)
        revenue = impressions.fdiv(Faker::Number.between(5000, 10000))
        csv << [buyer, impressions, revenue]
      end
      csv << ['Coca Cola', '123864', '12.5']
      csv << ['Nike', '8752', '5.3']
      csv << ['Le Monde', 'Impressions', 'Revenue']
      csv << ['Buyer', 'Impressions', 'Revenue']
    end
  end
end
