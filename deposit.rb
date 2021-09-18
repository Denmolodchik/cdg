class Deposit
    attr_reader :id, :months, :percent

    def initialize(id,months,percent)
        @id = id
        @months = months
        @percent = percent
    end

end