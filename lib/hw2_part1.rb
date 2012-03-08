class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1}

  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end

  def in(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self / @@currencies[singular_currency]
    end
  end

end

class String
  def method_missing(meth)
    if meth.to_s == "palindrome?"
      a = self.gsub(/\W/, '').downcase
      return a == a.reverse
    else
      super
    end
  end
end



module Enumerable
  def palindrome?()
    a = self.collect {|i| i }
    return a == a.reverse
  end
end
