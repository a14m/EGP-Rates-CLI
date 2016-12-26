# frozen_string_literal: true
require 'egp_rates'
require 'tty'
require 'tty-prompt'
require 'tty-command'
require 'tty-table'
require 'egp_rates_cli/config'

# CLI
module EGPRatesCLI
  BANKS = %i(CBE NBE CIB AAIB BanqueDuCaire BanqueMisr SuezCanalBank
             AlBarakaBank AlAhliBankOfKuwait SAIB MIDB UBE CAE EDBE AlexBank
             Blom ADIB EGB NBG FaisalBank)

  CURRENCIES = %i(USD EUR GBP CHF SAR JPY KWD AED AUD BHD CAD DKK JOD NOK OMR
                  QAR SEK CNY)

  def self.config
    @@configurtion ||= Config.config
  end

  def self.start
    run(config)
  end

  def self.stop
    TTY::Prompt.new.say("\nGoodbye ;)")
    exit 0
  end

  def self.run(config)
    table = TTY::Table.new(
      header: [
        { value: 'Bank', alignment: :left },
        { value: 'Currency', alignment: :center },
        { value: 'Buy', alignment: :left },
        { value: 'Sell', alignment: :left}
      ]
    )
    banks      = config[:bank].empty? ? BANKS : config[:bank]
    currencies = config[:currency].empty? ? CURRENCIES : config[:currency]

    banks.each do |bank|
      currencies.each do |currency|
        begin
          rates = EGPRates.const_get(bank).new.exchange_rates
          table << [
            { value: bank.to_s, alignment: :left },
            { value: currency.to_s, alignment: :center },
            { value: rates[:buy][currency.to_sym], alignment: :left },
            { value: rates[:sell][currency.to_sym], alignment: :left }
          ]
        rescue EGPRates::ResponseError
          table << [
            { value: bank.to_s, alignment: :left },
            { value: currency.to_s, alignment: :center },
            { value: 'N/A', alignment: :center },
            { value: 'N/A', alignment: :center }
          ]
          next
        end
      end
    end
    render(table)
    sleep config[:interval] * 60
    run(config)
  end

  def self.render(table)
    TTY::Command.new(printer: :quiet).run('clear')
    TTY::Prompt.new.say("Updated at: #{Time.now}")
    puts table.render(:unicode, width: 80, resize: true)
  end
end
