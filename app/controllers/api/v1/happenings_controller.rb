class Api::V1::HappeningsController < ApplicationController
  
    def list
        options = params.permit(:title, :subtitle, :web_source, :category, :happening_at)
        # TODO: ideally i'd pass the entire result into a job which can only be done once every minute/hour/day but this also works.
        happenings_helper = HappeningsHelper::HappeningsGatherer.new()
        happenings_helper.gatherHappenings
        query = ""
        query = build_happening_query(query, 'title', options[:title])
        query = build_happening_query(query, 'subtitle', options[:subtitle])
        query = build_happening_query(query, 'web_source', options[:web_source])
        query = build_happening_query(query, 'category', options[:category])

         result = Happening.where(query)
        render json: {options: result}
      end
  end

  private 

  def build_happening_query(query, name, value) 
    if value.present?
        if query == ""
            query += " (#{name} LIKE '%#{value}%') "
        else
            query += " AND (#{name} LIKE '%#{value}%') "
        end
    end
     return query
  end
  