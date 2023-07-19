module CompanyName 
  attr_reader :company_name
  
  def company_name(name)
    @company_name = name
  end

  def show_company_name
    @company_name
  end
end