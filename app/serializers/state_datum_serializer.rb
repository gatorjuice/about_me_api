# frozen_string_literal: true

# StateDatum Serializer
class StateDatumSerializer < BaseSerializer
  attributes :id,
             :state_name,
             :uri,
             :median_household_income,
             :share_unemployed_seasonal,
             :share_population_in_metro_areas,
             :share_population_with_high_school_degree

  def uri
    api_v1_state_url(object)
  end
end
