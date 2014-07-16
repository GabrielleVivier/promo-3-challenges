# Optional
class Transaction

  def initialize(amount)
    # Initialize amount and date of transaction
    @date = Time.now
    @amount = amount
  end

  def to_s
    # Nicely print transaction infos using Time#strftime.
    print @date.strftime("@{amount} euros on %Y-%m-%d at %H:%M %z")
  end
end
