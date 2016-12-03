module EGPRatesCLI
  class Config
    def self.config
      prompt = TTY::Prompt.new
      prompt.collect do
        key(:interval).ask('Update Interval (default 1 minute): ') do |q|
          q.default 1
          q.convert :int
        end

        key(:bank).multi_select('Which Bank to show data from ? (default all) ') do |q|
          q.choice '(CBE)  Central Bank of Egypt'                  , :CBE
          q.choice '(NBE)  National Bank of Egypt'                 , :NBE
          q.choice '(CIB)  Commercial International Bank'          , :CIB
          q.choice '(AAIB) Arab African International Bank'        , :AAIB
          q.choice '       Banque Du Caire'                        , :BanqueDuCaire
          q.choice '       Banque Misr'                            , :BanqueMisr
          q.choice '       Suez Canal Bank'                        , :SuezCanalBank
          q.choice '       Al Baraka Bank'                         , :AlBarakaBank
          q.choice '       Al Ahli Bank of Kuwait'                 , :AlAhliBankOfKuwait
          q.choice '(SAIB) Société Arabe Internationale de Banque' , :SAIB
          q.choice '(MIDB) Misr Iran Development Bank'             , :MIDB
          q.choice '(UBE)  The United Bank of Egypt'               , :UBE
          q.choice '(CAE)  Crédit Agricole Egypt'                  , :CAE
          q.choice '(EDBE) Export Development Bank of Egypt'       , :EDBE
          q.choice '       Bank of Alexandria'                     , :AlexBank
          q.choice '(BLOM) Blom Bank Egypt'                        , :Blom
          q.choice '(ADIB) Abu Dhabi Islamic Bank'                 , :ADIB
          q.choice '(EGB)  Egyptian Gulf Bank'                     , :EGB
          q.choice '(NBG)  National Bank of Greece'                , :NBG
          q.choice '       Faisal Islamic Bank'                    , :FaisalBank
        end

        key(:currency).multi_select('Which Currencies? (default all)') do |q|
          q.choice 'USD'
          q.choice 'EUR'
          q.choice 'GBP'
          q.choice 'CHF'
          q.choice 'SAR'
          q.choice 'JPY'
          q.choice 'KWD'
          q.choice 'AED'
          q.choice 'AUD'
          q.choice 'BHD'
          q.choice 'CAD'
          q.choice 'DKK'
          q.choice 'JOD'
          q.choice 'NOK'
          q.choice 'OMR'
          q.choice 'QAR'
          q.choice 'SEK'
          q.choice 'CNY'
        end
      end
    end
  end
end
