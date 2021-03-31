class Robot
  @@used_names = []

  def name
    if @name
      return @name
    else
      loop do
        @name = random_name
        break unless @@used_names.include?(@name) || @name.nil?
      end
      @@used_names << @name
      @name
    end
  end

  def reset
    @@used_names.delete(@name)
    @name = nil
  end

  def random_name
    name = (0...2).map { ('A'..'Z').to_a[rand(26)] }.join + rand(10).to_s + rand(10).to_s + rand(10).to_s
  end



end
