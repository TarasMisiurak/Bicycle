class BicycleSuggestion < Bicycle
  enum status: [ :canceled, :pending, :approved ]
end
